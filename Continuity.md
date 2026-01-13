Continuity.md — mBrics Platform (MOBILE Project)
Core Environment
• IDE: VS Code (Local History active)
• Framework: Flutter (Dart) for mobile/web
• Backend: FastAPI (Python)
• Version Control: Git with commits + tags for rollback
Databases & Services
• Supabase: Auth, Postgres (RLS), Profiles table
• Dutify API: HS code duty lookup
• SeaRates API: LCL/FCL shipping rates
• Agent tables: clearance fees + trucking costs
Invariants
• Root path: /Users/m2/Developer/mbrics/MOBILE
• Ports: Frontend http://localhost:5442, Backend http://127.0.0.1:8000
• Routing: session → mainmenu, else → login
• Assets: logo assets/mbrics_logo.png (white background, 140px height), ARB files in lib/l10n/
• Feature flags: platform_shell, profileformsv2, errorlocalizationv2, analytics_basic
UI Discipline
• Headings:
	◦ Core functions → “Hi {user_name}, ready to get started?”
	◦ Utilities → “Or, manage your tools and settings…”
• Colors:
	◦ Platinum (#E5E4E2) → core cards
	◦ White (#FFFFFF) → utility cards
	◦ Gold (#C2994B) → primary buttons/icons
	◦ Silver (#A7A9AC) → secondary accents
	◦ Charcoal Navy (#343A40) → headings/text
• Logo: top of all pages, pure white background, 140px height
• Microcopy under logo: “Built for global trade. Designed for trust.”
• MasterLayout: enforced across all modules for consistency
Execution Discipline
• Frontend: flutter run -d chrome --web-port=5442
• Backend: uvicorn main:app --reload --port=8000
Rituals
• Update STATUS.md after each milestone
• Commit + tag checkpoints (chk-YYYY-MM-DD-description)
• Preserve golden copies in /templates and /db/migrations
• Update Continuity.md whenever headings, palette, or grouping logic change
Localization Discipline
• ARB files: maintained in lib/l10n/ (EN/zh)
• Keys: CamelCase, no spaces (e.g. feature1Title, feature1Line1)
• Placeholders: use {variable} for dynamic values (e.g. "loginFailed": "Login failed: {reason}")
• Consistency: English and Chinese ARBs must mirror each other in structure
• Narrative polish: error messages and slogans remain friendly, trust‑enhancing, reproducible
Current Checkpoints
• Logos confirmed working across all pages
• ARB design rules locked
• Remaining work: integrate language toggle + ARB text for registration, forex, escrow, pay, profile, edit_profile, settings
• After polish and translation, publish live in China for validation