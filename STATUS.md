# demoMaker checkpoint — October 24, 2026

## Decision

**VALIDATE / NOT READY for paid publication.** No genuine Express customer sale has been established. Core narrated-video functionality is already in the free edition. Stop additional feature development until the paid advantage is supported by relevant voluntary customer evidence. Product listings, downloads and compliments are not purchases.

## Preserved baseline

- Existing repository `aferlazzo/demoMaker`; baseline main `c57bd07af8bcd427625d881f16c32f8c6d9a3b7c`.
- Free v1.3.2 installer, historical releases, public gallery and transparent interest page retained.
- Prior installed Windows evidence remains in `VERIFICATION.md`; it is historical evidence, not a fresh Store installation result.
- Work isolated on `codex/express-store-readiness`. Do not push this work to main merely to trigger the existing automatic free-release workflow.

## Completed

1. Read source, releases, workflow and existing verification. Original eight tests passed before changes.
2. Checked actual public interest page/video playback; fetched both published MP4s, matched source hashes and fully decoded them. No email action or checkout attempted.
3. Researched six alternatives and public buyer discussions. Some competitor purchase self-reports exist; no independently verified Express purchase or paid-delta willingness to pay was found. See `docs/express-release-20261024/COMMERCIAL-DECISION.md`.
4. Responded to actual dependency audit findings: pinned Electron 42.11.18 and updated the affected lockfile dependency. Post-change audit reports zero known vulnerabilities at this snapshot; this is not a security certification.
5. Prepared private AppX build configuration, existing-icon tile assets and official Windows SDK packaging script. No signing certificate, security change, app reservation, purchase or paid publication.
6. Added an explicit import-only desktop packaging smoke mode using already-public footage and an isolated test profile. It does not capture the owner's desktop or microphone. Real narration and both imported-video exports passed in the source desktop runtime.
7. Prepared conditional listing/support/privacy copy and a component-level licensing review. These are drafts, not owner-approved legal terms.

## Final verification in progress

Commit intended source, build the private candidate from that clean commit using `scripts/build-store-preview.ps1`, and repeat import-only smoke against its actual unpacked executable. Save final package hash and measured test results in `docs/express-release-20261024/TEST-AND-PACKAGE-REPORT.md`. The unsigned test identity must never be represented as upload-ready or Store-certified.

## Blockers / limits

- Hidden-window MediaRecorder tests produced no frames. Actual interactive screen/microphone capture is unverified on the patched runtime; do not count import-only export success as a capture pass.
- Partner Center redirected to Microsoft sign-in; no authenticated publisher identity/reservation was established. No account creation, terms acceptance, upload, payout/tax configuration or paid publication performed.
- Exact GPL corresponding-source/build obligations, transitive notices, codec and VC redistributable questions remain. No distribution license/EULA has been selected for the owner.
- Signed clean Windows installation/update/uninstall, certification, Store identity/permissions and approved privacy/support URLs remain release gates.
- Product-value validation remains a commercial gate even if packaging passes.

## Resume instructions

Use this checkout and branch. Read the three documents under `docs/express-release-20261024/` and final test report first. Use Node 22.12+ for desktop build tools (tested with 24.22.1). Run `npm ci`, `npm test`; real voice integration requires prepared `.local/` and `npm run test:piper`. `scripts/prepare-store-preview.ps1 -PythonDriver <existing Python with pip>` prepares the private runtime; installed speech dependencies must be inventoried/reviewed again before distribution. Tile regeneration: run the existing Electron executable with `scripts/store-assets.cjs`.

For the private package, commit source first, then run `scripts/build-store-preview.ps1 -NodePath <node.exe> -OutputPackage <absolute .appx path>`. It retains builder/SDK logs under ignored `verification/`; the SDK validates schema/payload, not Store eligibility. Use `DEMOMAKER_SMOKE_DIR=<isolated folder>` and `DEMOMAKER_SMOKE_FIXTURE_ONLY=1` only for import-only packaging verification. Without the latter flag the old smoke hook may record the actual desktop; do not run that unattended on a personal machine.

**Next stage:** review final feasibility evidence, retain the free edition, and resolve the specific paid-value question before further development. If commercial evidence justifies proceeding, owner involvement is required only for Partner Center identity/sign-in, licensing/legal decisions and approval of a concrete paid submission. Do not create outreach, payment processing, a second app/repository or new features as a substitute for demand.
