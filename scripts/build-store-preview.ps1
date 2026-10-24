param([Parameter(Mandatory=$true)][string]$NodePath,[Parameter(Mandatory=$true)][string]$OutputPackage,[string]$MakeAppxPath='C:/Program Files (x86)/Windows Kits/10/bin/10.0.22621.0/x64/makeappx.exe')
$ErrorActionPreference='Stop'
$repo=Split-Path $PSScriptRoot -Parent
Push-Location $repo
try {
  $dirty=git status --porcelain --untracked-files=all
  if($dirty){throw 'Commit the intended source first; this build requires a clean checkout.'}
  if(!(Test-Path -LiteralPath $MakeAppxPath)){throw 'Install/select the official Windows SDK MakeAppx path.'}
  if(!(Test-Path -LiteralPath '.local/speech.json')){throw 'Prepare the app-local narration runtime first.'}
  $version=& $NodePath --version
  $nodeVersion=[version]$version.TrimStart('v')
  if($nodeVersion -lt [version]'22.12.0'){throw 'Node 22.12 or newer is required by the pinned desktop build tools.'}
  $env:Path=(Split-Path $NodePath -Parent)+';'+$env:Path
  $env:CSC_IDENTITY_AUTO_DISCOVERY='false'
  New-Item -ItemType Directory -Force verification | Out-Null
  $start=[DateTime]::UtcNow
  & $NodePath node_modules/electron-builder/out/cli/cli.js --config build/store-preview.cjs --win appx --x64 --publish never *> verification/store-builder.log
  $builderExit=$LASTEXITCODE
  $stage='dist/store-preview/__appx-x64'
  if(!(Test-Path -LiteralPath "$stage/mapping.txt") -or !(Test-Path -LiteralPath "$stage/AppxManifest.xml")){throw 'Builder did not generate package staging/mapping.'}
  if((Get-Item -LiteralPath "$stage/mapping.txt").LastWriteTimeUtc -lt $start.AddSeconds(-1)){throw 'Refusing a stale package mapping.'}
  # Always use the installed SDK, with its schema/payload validation enabled.
  # This avoids depending on a bundled helper whose macOS symlinks fail on this host.
  & $MakeAppxPath pack /o /l /f "$stage/mapping.txt" /p $OutputPackage *> verification/store-makeappx.log
  if($LASTEXITCODE -ne 0){throw 'Windows SDK package validation/assembly failed; see verification/store-makeappx.log.'}
  $sha=(Get-FileHash -LiteralPath $OutputPackage -Algorithm SHA256).Hash.ToLowerInvariant()
  $head=(git rev-parse HEAD).Trim()
  @{checked_at_utc=[DateTime]::UtcNow.ToString('o');source_commit=$head;builder_exit=$builderExit;sdk_pack_passed=$true;package_sha256=$sha;package_bytes=(Get-Item -LiteralPath $OutputPackage).Length;identity='demoMaker.InternalPreview';publisher='CN=demoMaker Internal Preview';signed=$false;installed=$false;store_certified=$false;not_for_sale=$true;uses_existing_sdk=$true} | ConvertTo-Json | Set-Content verification/store-package.json -Encoding utf8
  Get-Content verification/store-package.json
} finally {Pop-Location}
