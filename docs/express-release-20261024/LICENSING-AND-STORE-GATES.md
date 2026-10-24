# Licensing and Store release gates

October 24, 2026. Technical/compliance inventory, not legal clearance. **Paid distribution is blocked pending the following documented decisions and evidence.** Do not infer that GPL prohibits charging money, or that every process communicating with a GPL tool must automatically adopt the same license.

## Actual components

| Component | Actual evidence / obligation | Remaining release work |
|---|---|---|
| App source / brand / footage | Existing repository has no root LICENSE grant. Owner is Anthony Ferlazzo; existing public videos are retained | Owner-approved app distribution terms, rights to source/art/footage, and a clear relationship to the free edition. Public GitHub access alone is not a general license grant |
| FFmpeg | `ffmpeg-static` 5.2.0 downloads Gyan's FFmpeg 6.0 essentials. Actual `-L` says GPLv3-or-later; build enables GPL, version3, libx264 and libx265 | Retain license/copyright and provide the exact corresponding sources/build information for distributed binaries and linked components through a compliant route. Current generic upstream links are not proof of fulfillment. Review codec patent obligations for intended commercial distribution; no conclusion about fees owed is made |
| Piper / eSpeak NG | `piper-tts` 1.8.0; [Piper COPYING](https://github.com/OHF-Voice/piper1-gpl/blob/main/COPYING) is GPLv3; eSpeak is included | Retain notices and exact corresponding source; document separate-process boundary/EULA treatment. Decide the compliant commercial model; do not silently impose proprietary restrictions on GPL components |
| Voice | Bundled `en_US-ljspeech-high` MODEL_CARD identifies public-domain LJ Speech data, 22050 Hz | Retain exact model/config/card and provenance; do not turn a dataset statement into blanket legal clearance for the whole product |
| Python | Official CPython 3.12.10 embedded x64 distribution, PSF notices retained | Check its security-maintenance status before a real release; preserve notices and assess supported clean-machine runtime dependencies |
| Speech dependencies | Exact installed inventory recorded in release evidence: ONNX Runtime, NumPy, protobuf, packaging, flatbuffers, pathvalidate | Retain each wheel's license and third-party bundled-library notices, not only top-level package metadata |
| Electron / Chromium | Internal branch patches Electron 42.0.0 to 42.11.18 in response to actual audit findings; MIT/Chromium notices ship | Recheck current security advisories at release. No exploit against this app was demonstrated; advisory counts are not exploit proof |
| Microsoft VC runtime | Original `bundle-speech.ps1` copies three DLLs from System32 | Establish lawful redistributable origin/terms or use the appropriate official deployment route. The internal preview preparer does **not** copy System32 DLLs. Passing on this host does not prove a clean machine has needed runtimes |

[FFmpeg's legal guidance](https://ffmpeg.org/legal.html) distinguishes LGPL/GPL build configurations, corresponding source and codec concerns. Its LGPL linking checklist must not be mislabeled as a complete solution for this actual GPL static binary. Retaining an upstream URL and license text does not alone settle every source obligation. No source license was changed and no signed legal agreement was accepted.

## Microsoft Store

- [Current registration documentation](https://learn.microsoft.com/en-us/windows/apps/publish/partner-center/open-a-developer-account) says registration is free under the current onboarding flow; identity/company verification still applies. Do not budget an obsolete universal $19 signup fee. No account was created, payment made or terms accepted here.
- Partner Center was checked read-only and redirected to Microsoft sign-in. No available authenticated publisher account, app reservation or assigned package identity was established. This does not mean the owner lacks an account elsewhere.
- The candidate identity is **`demoMaker.InternalPreview`**, publisher **`CN=demoMaker Internal Preview`**. It is deliberately a test identity and is **not valid evidence of a Store reservation**. Real Identity.Name, publisher CN and publisher display name must match Partner Center. See [package requirements](https://learn.microsoft.com/en-us/windows/apps/publish/publish-your-app/msix/app-package-requirements).
- Package format validation, unpacked execution and media export are separate from signed installation, update/uninstall, Windows App Certification Kit and Store certification. No trusted certificate was installed, developer mode/security protection weakened, or unsigned package registered.
- Before submission: correct Store identity, complete source/licensing route, validated clean Windows install/update/uninstall and permissions, appropriate age rating, privacy/support URLs, truthful feature listing, $19.99 price/markets/tax/payout settings, and explicit owner approval to publish the paid product.
- [MSIX submission instructions](https://learn.microsoft.com/en-us/windows/apps/publish/publish-your-app/msix/create-app-submission) support draft submission after reserving an app name. No reservation, upload, paid listing, checkout, charge or customer communication was performed here.

**Next owner-only gates when commercially justified:** connect the existing Partner Center session or complete identity verification; approve the licensing/distribution decisions and any binding terms; approve the concrete paid submission. Passwords, IDs, selfies, tax and bank information must stay out of source and reports. No broad credential or purchase request is made now.
