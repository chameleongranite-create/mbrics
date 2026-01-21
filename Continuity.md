# mBrics Web3 Engine: Ultimate Master Specification
# Version: 2026.01.21-Apex | Status: Institutional Grade | Operational Lock

---

## 1. PROJECT IDENTITY & STRATEGIC VISION
* **Official Name:** mBrics (Strictly capital 'B', all others lowercase). Never generic "BRICS".
* **Mission:** Institutional trade gateway replacing bank LCs with Blockchain Smart Escrow.
* **The "Digital Policeman" Concept:** Decentralized trust verification to replace legacy banking friction and "Paper & Trust" with "Digital & Code."
* **The "Non-Custodial" Mandate:** mBrics acts as the Instruction Layer; funds remain in Bank of China (BoC) escrow.
* **Official Slogan:** “THE GLOBAL TRADE STANDARD” (Gold, 10.5pt, 5.0 Letter Spacing).
* **Target Tone:** Simple language for everyday users; impressive/technical for institutional partners.

---

## 2. TECHNICAL INFRASTRUCTURE & DEVELOPMENT
* **Local Root Path:** /Users/m2/Developer/mbrics/MOBILE
* **Key Identity File:** /Users/m2/Developer/mbrics/mBrics-key.pem (chmod 400)
* **Development IDE:** VS Code (Local History Active).
* **Stack:** Flutter Web + Supabase Auth/Postgres (RLS) + FastAPI (Python).
* **External Integrations:** Dutify API (HS Codes), SeaRates API (Shipping), Agent Tables (Logistics).
* **Localization:** Physical/Direct (synthetic-package: false) in `lib/l10n/`.

---

## 3. SUPABASE ARCHITECTURE & DATABASE SCHEMA
* **public.profiles:** Partner data (id, display_name, company, role) linked to auth.uid().
* **public.visitors:** Guest logs (id, created_at, full_name, metadata). Needs 'anon' INSERT permissions.
* **public.trades:** Trade records (trade_id, exporter_id, importer_id, amount, verification_hash).
* **Proprietary Moat:** `public.sa_tariffs` (To be initialized for SA Govt Document digitization).

---

## 4. UI/UX "GOLDEN COPY" DISCIPLINE
* **Branding:** * Logo: assets/mbrics_logo.png (Pure white background, 100px height, top-centered).
    * Palette: Gold (#C2994B), Terminal Black (#121212), Platinum (#E5E4E2).
* **Typography (Local Assets Only):**
    * Prose: Inter (assets/fonts/Inter_24pt-Regular.ttf).
    * Data: ShareTechMono (assets/fonts/ShareTechMono-Regular.ttf).
* **Component Standards:**
    * Medallion: 70px–80px CircleAvatar with 1px Gold border. Divider Dot offset: 85px.
    * Toggle: EN/中文 labels, 11px Bold, 1.2px Gold border.
    * Stability: ClampingScrollPhysics() + SingleChildScrollView + LayoutBuilder.

---

## 5. REMOTE INFRASTRUCTURE (ALIBABA CLOUD HK)
* **Instance:** ecs.t6-c2m1.large (Region: HK - Zone D).
* **IPs:** Public: 47.86.81.128 | Private: 172.31.208.125
* **OS:** Ubuntu 24.04.3 LTS.
* **Web Engine:** Nginx (Serving from `/var/www/mbrics/`).
* **Flicker-Fix:** Custom `try_files` logic in Nginx config to handle SPA routing and white-screens.
* **DNS:** Dynadot A-Records (@ & www) pointing to 47.86.81.128.
Update for Section 5: REMOTE INFRASTRUCTURE
Priority Lock: The factory configuration /etc/nginx/sites-enabled/default must be deleted to prevent 404 overrides.

Active Config: Use /etc/nginx/sites-available/mbrics linked to sites-enabled.

Cache-Control: Headers set to no-store, no-cache to force "Latest-First" delivery for mobile users.

---

6. THE MASTER PUBLISHING RITUAL (STABLE VERSION)
To ensure the update is live, has the correct permissions, and bypasses the 404 "Imposter" config, execute this full sequence:

```bash
# Part 1: Clean, Generate, Build, and Upload (PWA disabled for Latest-First)
flutter clean && flutter pub get && flutter gen-l10n && flutter build web --release --pwa-strategy none && scp -i ../mBrics-key.pem -r build/web/* root@47.86.81.128:/var/www/mbrics/

# Part 2: Flatten Directory, Permissions Sync & Nginx Hot Reload
ssh -i ../mBrics-key.pem root@47.86.81.128 "mv /var/www/mbrics/web/* /var/www/mbrics/ 2>/dev/null || true; chown -R www-data:www-data /var/www/mbrics && chmod -R 755 /var/www/mbrics && systemctl restart nginx"

7. INVESTOR ROADMAP & HISTORY
[2026-01-20]: Provisioned Alibaba HK Instance & Nginx "Flicker-Fix."

[2026-01-21]: UI Lock: 100px Logo and "Global Trade Standard" Slogan verified live.

[2026-01-21]: Permissions Protocol established (www-data ownership) to solve 404 errors.

Phase 2 (Next): FastAPI middleware integration and SA Tariff digitization.