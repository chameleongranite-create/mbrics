2026-01-04 – Continuity Extended (MOBILE Project)

Core Development Environment
• IDE: Visual Studio Code (Local History extension active)
• Language/Framework: Flutter (Dart) for cross‑platform mobile/web apps
• Backend: FastAPI (Python) for orchestration and modular endpoints
• Version Control: Git (commits + tags for rollback safety)

Databases & Services
• Supabase:
  ◦ Auth (login, registration, session persistence)
  ◦ Database (Postgres with RLS policies)
  ◦ Profiles table for metadata (user_id, display_name, phone, language, role)
• Dutify API: HS code duty lookup (tariffs)
• SeaRates API: Real‑time LCL/FCL shipping rates and schedules
• Agent tables: Clearance fees + zone‑based trucking costs

Invariants (must remain stable)
• Project root path:
  ◦ /Users/m2/Developer/mbrics/MOBILE
  ◦ All commands must be executed from this directory to avoid confusion with stray example paths
• Ports:
  ◦ Frontend → http://localhost:5442
  ◦ Backend → http://127.0.0.1:8000
• Routing rules:
  ◦ If session exists → /mainmenu
  ◦ Else → /login
• Assets:
  ◦ Logo → assets/mbrics_logo.png
  ◦ ARB files for localization → lib/l10n/
• Baseline modules:
  ◦ FastAPI endpoints for tariffs, freight, and clearance
• Feature flags:
  ◦ platform_shell, profileformsv2, errorlocalizationv2, analytics_basic

Execution Discipline
• Frontend explicit port binding:
  cd /Users/m2/Developer/mbrics/MOBILE
  flutter run -d chrome --web-port=5442

• Backend explicit port binding:
  cd /Users/m2/Developer/mbrics/MOBILE/backend
  uvicorn main:app --reload --port 8000

• Never omit port flags — ensures invariants remain stable across environments.
• Verify routing invariants after startup:
  ◦ Session exists → /mainmenu
  ◦ No session → /login

Structure Discipline
• Source of truth:
  ◦ Only use /Users/m2/Developer/mbrics/MOBILE as the active Flutter project.
  ◦ Do not use /Users/m2/Developer/mbrics/flutter-auth-ui/example/flutter-auth-ui/example (deprecated/cleanup complete).
• Lib structure:
  ◦ Use lib/layout for app shell (MasterLayout) and lib/services for AuthService and providers.
  ◦ Keep feature modules under lib/<feature>/ with clear ownership and tests.

Rituals
• STATUS.md:
  ◦ Update after each milestone with what changed, why, and next steps.
• Commits & Tags:
  ◦ Commit and tag before any feature work (golden-* for baselines, chk-* for checkpoints).
• Rollback safety:
  ◦ Prefer Git tags and Local History; avoid manual deletions without checkpoints.
• Golden copies:
  ◦ Preserve canonical templates and migrations in /db/migrations or /templates.
• Module-first:
  ◦ Use pre‑coded modules first; avoid one‑off hacks that break invariants.

Operational Notes
• Localization:
  ◦ Maintain ARB files under lib/l10n/ with English and Chinese entries aligned to UI strings.
• Assets discipline:
  ◦ Replace logos and UI assets via golden-copy workflow with reproducible commands.
• Environment:
  ◦ Keep env.dart minimal; secrets managed via Supabase and local .env where applicable.
• Testing:
  ◦ Use test/ for unit and integration tests; keep web startup consistent with --web-port invariant.

Path Correction History (2026-01-04)
• Identified stray files under:
  ◦ /Users/m2/Developer/mbrics/flutter-auth-ui/example/flutter-auth-ui/example
• Action:
  ◦ Removed lib/layout and lib/services and stray Dart files from deprecated path.
  ◦ Re-established canonical files in /Users/m2/Developer/mbrics/MOBILE/lib.
• Purpose:
  ◦ Enforce single source of truth and prevent future path drift.
  2026-01-04 – Shell split & login restoration (MOBILE)
• MasterLayout moved to lib/layout/master_layout.dart; LoginScreen recreated in lib/login/login_screen.dart
• Imports aligned in main.dart; ARB keys added (appTitle, navigation, footerText EN/ZN); l10n regenerated
• State: Demo login (mbrics/mbrics) works; language toggle functional across shell
• Next: Supabase auth wiring with localized error handling; wrap registration and main_menu with MasterLayout
• Tag: chk-2026-01-04-login-shell-split