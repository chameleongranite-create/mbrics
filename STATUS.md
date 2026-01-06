STATUS.md — mBrics Platform (MOBILE Project)
---
2026-01-04 – Continuity Activated in MOBILE
• Checkpoint: Continuity anchors created in MOBILE project
• Changes: STATUS.md and Continuity.md added at project root
• State: Baseline established, Git initialized
• Next: Begin MasterLayout shell integration
• Tag: golden-2026-01-04-mobile
---
Platform Polish Checklist
• MasterLayout shell (AppBar, Drawer, Footer) wrapped around all pages
• Design tokens centralized (colors, spacing, typography, radii)
• Component library (buttons, inputs, feedback widgets)
• go_router navigation with named routes + breadcrumbs
• Environment/version badge in AppBar
• AuthService wrapper for Supabase calls (login, registration, session)
• Error localization via ARB (friendly messages for Supabase codes)
• Profiles table with RLS policies (secure metadata storage)
• ProfileForm UI with optimistic updates + rollback safety
• Accessibility pass (contrast, focus rings, semantics, keyboard nav)
• Microcopy + empty states (friendly messages, CTAs)
• Skeleton loaders + success banners
• LoadingOverlay for smoother transitions
• Performance improvements (lazy load, caching, debounce requests)
• Reliability guardrails (error boundaries, audit logs)
• Security hardening (JWT handling, rate limiting middleware)
• Analytics (screen views, error tracking, opt‑in privacy)
• Help tray (FAQ + contact links)
• Centralized content management (ARB + markdown snippets)
---
Rituals
• Update STATUS.md after each completed item
• Commit + tag checkpoint (chk-YYYY-MM-DD-description)
• Rollback safety: git checkout or VS Code Local History
• Preserve golden copies in /templates and /db/migrations
---
2026-01-04 – Platform Polish Integration Kickoff (MOBILE Project)
• Checkpoint: MasterLayout shell + platform polish roadmap defined
• Changes: Added /layout/master_layout.dart scaffold, feature flag (platform_shell), design_tokens.dart plan
• State: Baseline flows intact, shell integration staged under feature flag
• Next: Page-by-page rollout (login → registration → main_menu → ddp → forex → escrow → pay → settings → jobcard)
• Tag: v0.9.0-shell
---
2026-01-04 – MasterLayout Split and Login Restoration (MOBILE)
• Changes: Moved MasterLayout to lib/layout/master_layout.dart; recreated lib/login/login_screen.dart; imports aligned in main.dart; ARB updated (appTitle, navigation, footerText EN/ZN); l10n regenerated
• State: Splash → Login → MainMenu works (demo credentials mbrics/mbrics); language toggle functional across shell
• Next: Replace demo auth with Supabase signInWithPassword; localize Supabase errors; wrap registration and main_menu with MasterLayout
• Tag: chk-2026-01-04-login-shell-split
---
2026-01-05 – Auth Cycle & Profile Screen
• Checkpoint: Login and Register screens aligned under MasterLayout
• Changes: ProfileScreen scaffolded with Supabase user metadata + logout; routes in main.dart corrected to use ProfileScreen (removed ProfilePage); SplashScreen redirect confirmed (session → /mainmenu, else → /login)
• State: Verified login flow works; ProfileScreen shows “Dashboard” with empty state when no metadata/session
• Next: Wire ProfileScreen to fetch user details from Supabase users table for richer dashboard
• Tag: chk-2026-01-05-auth-profile
---
2026-01-06 – Project Scaffold
• Changes: Created folders: screens, layout, l10n, services, widgets; added placeholder files for login, register, profile, master layout, auth service, header/footer widgets
• Checkpoint Tag: chk-2026-01-06-project-scaffold
---
2026-01-06 – Completed Profile Screen
• Changes: Added ProfileScreen with user info + logout; integrated Supabase currentUser metadata; wrapped in MasterLayout for layout consistency
• Checkpoint Tag: chk-2026-01-06-profile-screen
---
2026-01-06 – Layout Discipline for New Pages
• Note: All new screens (login, register, profile, ddp, forex, escrow, pay, settings, jobcard, etc.) must be wrapped in MasterLayout
• Rule: Avoid standalone Scaffold definitions inside child pages — use MasterLayout as the single scaffold
• Guarantee: Consistency in navigation, language toggle, and footer messaging across the platform
• Checkpoint Tag: chk-2026-01-06-masterlayout-discipline
---
2026-01-06 – Upcoming Task: Profile Photo Integration
• Changes Planned:
	◦ Add avatar_url field to users table in Supabase
	◦ Create Supabase Storage bucket (avatars) for profile photo uploads
	◦ Update registration flow to allow photo upload and store public URL in avatar_url
	◦ Refactor ProfileScreen to display photo, name, email, phone, company
	◦ Wrap profile screen in MasterLayout for consistent header/footer
• Future Extension: Enable “Edit Profile” to change photo and metadata
• Checkpoint Tag: todo-2026-01-06-profile-photo
---
2026-01-06 – Deferred Task: Avatar Picker (Web)
• Issue: file_picker dialog not opening in Flutter web (Chrome/macOS)
• Decision: Defer avatar upload feature for now; placeholder default_avatar.png remains active
• Workflow Discipline: Logged in STATUS.md; revisit post-demo with fallback (URL input or isolated test page)
• Checkpoint Tag: defer-2026-01-06-avatar-picker
---
Planned – Solidity + Hardhat Integration
• Objective: Prepare for smart contract development using Solidity and Hardhat
• Scope:
	◦ Set up Hardhat project structure (contracts/, scripts/, tests/)
	◦ Integrate OpenZeppelin templates (ERC-20, ERC-721, access control)
	◦ Connect Supabase backend for off-chain data (profiles, trade metadata)
	◦ Plan deployment routes (Ethereum, Polygon, or China-compliant chains)
• Workflow Discipline: Golden copies created after initial Hardhat setup; STATUS.md and Continuity.md updated in sync
• Next Steps: Scaffold Hardhat project and import Solidity templates for editing
• Tag: chk-2026-01-06-hardhat-solidity-init