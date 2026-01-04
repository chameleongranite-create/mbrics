
2026-01-04 – Baseline Continuity Setup (MOBILE Project)
Core Development Environment
• IDE: Visual Studio Code (with Local History extension for auto file snapshots)
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
• Ports:
	◦ Frontend → http://localhost:5442
	◦ Backend → http://127.0.0.1:8000
• Routing rules:
	◦ If session exists → /mainmenu
	◦ Else → /login
• Assets:
	◦ Logo → assets/mbrics_logo.png
	◦ ARB files for localization → lib/l10n/
• Baseline modules: tariffs, freight, clearance endpoints in FastAPI
Rituals
• Always update STATUS.md after each milestone
• Always commit + tag before feature work (golden-* for baselines, chk-* for checkpoints)
• Rollback safety: use Git tags or Local History, never manual file deletion
• Keep golden copies of migrations/templates in /db/migrations or /templates
• Use pre‑coded modules first, avoid one‑off hacks