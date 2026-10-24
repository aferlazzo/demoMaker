# Express readiness verification — October 24, 2026

This is a private feasibility test of the existing free application, not a new paid release. Baseline main: `c57bd07af8bcd427625d881f16c32f8c6d9a3b7c`. Source branch: `codex/express-store-readiness`. Final package evidence will be appended after the committed-source build.

## Completed checks

| Check | Actual result | Scope / limit |
|---|---|---|
| Original tests before changes | 8/8 passed | Real FFmpeg, scene/caption/input/origin/range handling and both export layouts |
| Original tests after security patch | 8/8 passed, repeated after smoke changes | No test was deleted or relaxed |
| Real Piper integration | 1/1 passed | Actual local model, speech timing, pace and WAV/caption bounds, not mocked TTS |
| Dependency audit | Zero known vulnerabilities after Electron 42.11.18 and lockfile update | Snapshot of npm advisory data; not proof of no defects or a penetration test |
| Public pages | Gallery and price-interest page HTTP 200; truthful concept/free-edition disclosures present | No mailto activation, purchase, order or email |
| Public MP4s | Both HTTP 200, range 206, source SHA-256 match, H.264/AAC full decode | Real playback of main video separately observed in the in-app browser; no subjective audio-quality claim |
| Source desktop import-only smoke | Passed UI startup, local narration and both decoded MP4 exports | Uses already-public SoHelpMe footage, no personal desktop/microphone capture |
| Hidden-window recording attempts | Failed: MediaRecorder produced no frames/header-only data | Offscreen painting did not resolve it. Interactive capture on the patched runtime remains unverified; do not call import-only success a recording pass |
| Initial AppX helper | electron-builder helper failed | macOS symlink privilege extraction issue and helper spawn failure; no security settings weakened |
| Initial SDK package assembly | Official installed MakeAppx succeeded | Superseded draft package. Not signed, installed or certified; final committed-source result recorded below when available |
| Partner Center | Redirected to Microsoft sign-in | No authenticated identity/reservation, app upload, terms acceptance or paid publication |

## Public media evidence

| URL | Bytes | SHA-256 |
|---|---:|---|
| [demoMaker walkthrough](https://aferlazzo.github.io/demoMaker/media/DemoStudio-Demo.mp4) | 4,181,662 | `2fded42c52c7c5b0ef7ff429688807bf11647423e5f1c76c5e0ccdc87cbe70b1` |
| [SoHelpMe example](https://aferlazzo.github.io/demoMaker/media/SoHelpMe-Demo.mp4) | 2,103,035 | `d8046cb587e916b07f0982f46dc16197c2bb5f74d334bec07e6d1ba99260a6ba` |

`scripts/verify-public.mjs` reproduces the HTTP, source-byte and decode checks. It does not measure visitors, orders or intent. A mailbox subject search and private traffic signals were reviewed only locally; they are not published as customer data or used to claim a conversion rate.

## Runtime / reproducibility

Windows x64 host, Node 24.22.1, Electron 42.11.18, electron-builder 26.15.0, ffmpeg-static 5.2.0 (actual FFmpeg 6.0 GPL build), embedded CPython 3.12.10, Piper 1.8.0. Installed speech wheels: ONNX Runtime 1.31.0, NumPy 2.5.4, protobuf 7.36.2, packaging 26.3, flatbuffers 25.12.19, pathvalidate 3.3.1. Runtime preparer pins Python/Piper but not all transitive wheels/model revision; the measured artifact hash identifies this candidate, not an assurance of future bit-for-bit rebuilding. Pin/review complete runtime provenance before commercial distribution.

Build from a clean committed checkout with `scripts/build-store-preview.ps1`; the script records source commit, SDK result and package hash under ignored `verification/`. It uses the official installed Windows SDK 10.0.22621.0 MakeAppx, with schema/payload validation enabled. An AppX is a supported Windows package format, but test identity `demoMaker.InternalPreview` / publisher `CN=demoMaker Internal Preview` is not the owner's assigned Store identity. No Store-compatibility certification is claimed.

The import-only smoke isolates userData and uses public footage. That footage already has burned captions; a second generated test caption track demonstrates export behavior and is **not** a polished customer/Store example. Output review frames are taken at two seconds after the intentional fade-in. Do not confuse a first-frame black fade with a blank export. Actual UI screenshots can support internal preparation; final listing screenshots must come from the correct approved signed release.

## Still unverified / release blockers

- Signed package install, upgrade, uninstall and permissions under package identity.
- Windows App Certification Kit / Store ingestion and clean Windows consumer-machine testing.
- Interactive picker, real display/microphone/system-audio capture on patched Electron; prior free-release results remain historical in `VERIFICATION.md`.
- Runtime/security maintenance and exact source/license/redistributable obligations; see `LICENSING-AND-STORE-GATES.md`.
- Store privacy/support URLs, verified identity, rating, tax/payout settings, owner-approved terms/paid submission.
- A meaningful paid advantage and genuine customer sale. Successful tests do not establish either.

No third-party accounts, personal recordings or websites were modified. No customer was contacted or charged. The existing free release/public interest page were preserved.
