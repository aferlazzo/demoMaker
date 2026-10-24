param([Parameter(Mandatory=$true)][string]$PythonDriver)
$ErrorActionPreference='Stop'
$repo=Split-Path $PSScriptRoot -Parent
$speechRoot=Join-Path $repo '.local'
$downloads=Join-Path $repo 'verification/store-preview/downloads'
New-Item -ItemType Directory -Force $downloads,(Join-Path $speechRoot 'python'),(Join-Path $speechRoot 'piper-packages'),(Join-Path $speechRoot 'piper-voices') | Out-Null
$archive=Join-Path $downloads 'python-3.12.10-embed-amd64.zip'
if(!(Test-Path -LiteralPath $archive)){Invoke-WebRequest 'https://www.python.org/ftp/python/3.12.10/python-3.12.10-embed-amd64.zip' -OutFile $archive}
Expand-Archive -LiteralPath $archive -DestinationPath (Join-Path $speechRoot 'python') -Force
@('python312.zip','.','../piper-packages','import site') | Set-Content (Join-Path $speechRoot 'python/python312._pth') -Encoding ascii
# The build host can be Python 3.13. Explicit wheel tags must match bundled 3.12.
& $PythonDriver -m pip install --target (Join-Path $speechRoot 'piper-packages') --python-version 3.12 --platform win_amd64 --implementation cp --abi cp312 --only-binary=:all: piper-tts==1.8.0
if($LASTEXITCODE -ne 0){throw 'Could not prepare pinned CPython 3.12 narration wheels'}
$embedded=Join-Path $speechRoot 'python/python.exe'
& $embedded -m piper.download_voices en_US-ljspeech-high --download-dir (Join-Path $speechRoot 'piper-voices')
if($LASTEXITCODE -ne 0){throw 'Voice download/import check failed'}
@{engine='piper';python='python/python.exe';packages='piper-packages'} | ConvertTo-Json | Set-Content (Join-Path $speechRoot 'speech.json') -Encoding utf8
Invoke-WebRequest 'https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/ljspeech/high/MODEL_CARD' -OutFile (Join-Path $speechRoot 'piper-voices/MODEL_CARD')
Write-Output 'Prepared an internal packaging runtime only. No System32 DLLs copied; no certificates installed. Clean-machine runtime dependencies and redistribution/source obligations remain release gates.'
