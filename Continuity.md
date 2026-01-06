# Continuity.md — mBrics Platform (MOBILE Project)

---

## 2026-01-04 – Continuity Extended (MOBILE Project)

### Core Development Environment
- **IDE:** Visual Studio Code (Local History extension active)  
- **Language/Framework:** Flutter (Dart) for cross‑platform mobile/web apps  
- **Backend:** FastAPI (Python) for orchestration and modular endpoints  
- **Version Control:** Git (commits + tags for rollback safety)  

---

### Databases & Services
- **Supabase:**  
  - Auth (login, registration, session persistence)  
  - Database (Postgres with RLS policies)  
  - Profiles table for metadata (user_id, display_name, phone, language, role)  
- **Dutify API:** HS code duty lookup (tariffs)  
- **SeaRates API:** Real‑time LCL/FCL shipping rates and schedules  
- **Agent tables:** Clearance fees + zone‑based trucking costs  

---

### Invariants (must remain stable)
- **Project root path:**  
  - `/Users/m2/Developer/mbrics/MOBILE`  
  - All commands must be executed from this directory to avoid confusion with stray example paths  
- **Ports:**  
  - Frontend → `http://localhost:5442`  
  - Backend → `http://127.0.0.1:8000`  
- **Routing rules:**  
  - If session exists → `/mainmenu`  
  - Else → `/login`  
- **Assets:**  
  - Logo → `assets/mbrics_logo.png`  
  - ARB files for localization → `lib/l10n/`  
- **Baseline modules:**  
  - FastAPI endpoints for tariffs, freight, and clearance  
- **Feature flags:**  
  - `platform_shell`, `profileformsv2`, `errorlocalizationv2`, `analytics_basic`  

---

### Execution Discipline
- **Frontend explicit port binding:**  
  ```bash
  cd /Users/m2/Developer/mbrics/MOBILE
  flutter run -d chrome --web-port=5442

  cd /Users/m2/Developer/mbrics/MOBILE/backend
uvicorn main:app --reload --port 8000
Never omit port flags — ensures invariants remain stable across environments.  
Verify routing invariants after startup:
• Session exists → /mainmenu
• No session → /login

Structure Discipline
• Source of truth:
	◦ Only use /Users/m2/Developer/mbrics/MOBILE as the active Flutter project.
	◦ Do not use /Users/m2/Developer/mbrics/flutter-auth-ui/example/flutter-auth-ui/example (deprecated/cleanup complete).
• Lib structure:
	◦ Use lib/layout for app shell (MasterLayout) and lib/services for AuthService and providers.
	◦ Keep feature modules under lib/<feature>/ with clear ownership and tests.
---
Rituals
• STATUS.md: Update after each milestone with what changed, why, and next steps.
• Commits & Tags: Commit and tag before any feature work (golden-* for baselines, chk-* for checkpoints).
• Rollback safety: Prefer Git tags and Local History; avoid manual deletions without checkpoints.
• Golden copies: Preserve canonical templates and migrations in /db/migrations or /templates.
• Module-first: Use pre‑coded modules first; avoid one‑off hacks that break invariants.
---
Operational Notes
• Localization: Maintain ARB files under lib/l10n/ with English and Chinese entries aligned to UI strings.
• Assets discipline: Replace logos and UI assets via golden-copy workflow with reproducible commands.
• Environment: Keep env.dart minimal; secrets managed via Supabase and local .env where applicable.
• Testing: Use test/ for unit and integration tests; keep web startup consistent with --web-port invariant.
---
Path Correction History (2026-01-04)
• Identified stray files under:
	◦ /Users/m2/Developer/mbrics/flutter-auth-ui/example/flutter-auth-ui/example
• Action:
	◦ Removed lib/layout and lib/services and stray Dart files from deprecated path.
	◦ Re-established canonical files in /Users/m2/Developer/mbrics/MOBILE/lib.
• Purpose:
	◦ Enforce single source of truth and prevent future path drift.
---
2026-01-04 – Shell Split & Login Restoration (MOBILE)
• MasterLayout moved to lib/layout/master_layout.dart; LoginScreen recreated in lib/login/login_screen.dart
• Imports aligned in main.dart; ARB keys added (appTitle, navigation, footerText EN/ZN); l10n regenerated
• State: Demo login (mbrics/mbrics) works; language toggle functional across shell
• Next: Supabase auth wiring with localized error handling; wrap registration and main_menu with MasterLayout
• Tag: chk-2026-01-04-login-shell-split
---
Continuity Entry: Supabase Auth Integration (Planned)
We will integrate a standard, pre-programmed login/register and profile management module using Supabase templates. This includes federated sign-in (Google, Apple, WeChat/Alipay), error messaging, and profile updates. The visuals will inherit from the MasterLayout (admin dashboard style). Localization keys will be aligned with ARB files for bilingual UX.
Checkpoint discipline:
• STATUS.md updated
• Continuity.md mirrored
• Golden copies created
• Git tag applied: chk-2026-01-05-supabase-auth
---
Continuity Entry: Solidity + Hardhat Integration (Planned)
After web2 is stable, we move to the heart of the platform: web3 smart contracts with integration to Bank of China escrow accounts.
We will integrate Solidity smart contracts into the platform using Hardhat as the framework. This includes setting up the Hardhat project structure, importing OpenZeppelin templates for safe and audited contract logic, and connecting Supabase for off-chain data storage. The contracts will encode multipolar trade/payment rules and compliance flows. Deployment routes will be considered for Ethereum, Polygon, and China-compliant chains.
Checkpoint discipline:
• STATUS.md updated
• Continuity.md mirrored
• Golden copies created
• Git tag applied: chk-2026-01-06-hardhat-solidity-init
---
Planned — Supabase Login Integration (2026-01-07)
• Replace demo mbrics/mbrics login with Supabase signInWithPassword
• Handle Supabase error codes with localized ARB messages
• Redirect successful login → /profile
• Checkpoint tag: chk-2026-01-07-supabase-login
---
Continuity Entry: Profile Photo Integration (Deferred – 2026-01-06)
• Issue: file_picker dialog not opening on Flutter web (Chrome/macOS).
• Decision: Defer avatar upload feature for now; placeholder default_avatar.png remains active.
• Planned Changes:
	◦ Add avatar_url field to users table in Supabase
	◦ Create Supabase Storage bucket (avatars) for profile photo uploads
	◦ Update registration flow to allow photo upload and store public URL in avatar_url
	◦ Refactor ProfileScreen to display photo, name, email, phone, company
• Future Extension: Enable “Edit Profile” to change photo and metadata once picker issue resolved.
• Checkpoint Tag: defer-2026-01-06-avatar-picker