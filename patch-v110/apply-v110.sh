#!/usr/bin/env bash
set -euo pipefail
ROOT="${1:-/tmp/lpfh-project}"
cd "$ROOT"
test -f dist/index.html
test -f dist/src/app.js
test -f android/app/build.gradle

cat > 'dist/manifest.webmanifest' <<'LPFH_V111_DIST_1'
{
  "name": "LP/FH Deal & Evidence Cockpit",
  "short_name": "LPFH Cockpit",
  "description": "Offline-first valuation og evidence cockpit",
  "start_url": "./index.html",
  "scope": "./",
  "display": "standalone",
  "background_color": "#0b0f14",
  "theme_color": "#10273d",
  "lang": "da",
  "icons": [
    {"src": "./public/icons/icon-192.png","sizes": "192x192","type": "image/png"},
    {"src": "./public/icons/icon-512.png","sizes": "512x512","type": "image/png"}
  ],
  "version": "1.1.1"
}
LPFH_V111_DIST_1

cat > 'dist/public/manifest.webmanifest' <<'LPFH_V111_DIST_2'
{
  "name": "LP/FH Deal & Evidence Cockpit",
  "short_name": "LPFH Cockpit",
  "description": "Offline-first valuation og evidence cockpit",
  "start_url": "./index.html",
  "scope": "./",
  "display": "standalone",
  "background_color": "#0b0f14",
  "theme_color": "#10273d",
  "lang": "da",
  "icons": [
    {"src": "./public/icons/icon-192.png","sizes": "192x192","type": "image/png"},
    {"src": "./public/icons/icon-512.png","sizes": "512x512","type": "image/png"}
  ],
  "version": "1.1.1"
}
LPFH_V111_DIST_2

cat > 'dist/src/styles/tokens.css' <<'LPFH_V111_DIST_3'
:root{color-scheme:dark;--bg:#0b1016;--bg2:#101820;--surface:#161d25;--surface2:#202a34;--text:#f4f7f9;--muted:#9ba9b5;--border:#2d3944;--navy:#16334a;--navy2:#234e70;--gold:#d4b35a;--gold2:#8e732b;--blue:#557eaa;--green:#6f9a7c;--danger:#b96a5f;--warn:#b99249;--radius:16px;--shadow:0 16px 42px rgba(0,0,0,.18)}
LPFH_V111_DIST_3

cat > 'dist/src/styles/screens.css' <<'LPFH_V111_DIST_4'
#app-shell{min-height:100vh;background:radial-gradient(circle at 90% 0,#1b3347 0,transparent 30%),linear-gradient(180deg,var(--bg2),var(--bg) 38%)}.app-header{position:sticky;top:0;z-index:40;background:rgba(11,16,22,.94);backdrop-filter:blur(14px);border-bottom:1px solid #232c34;padding:10px 14px}.header-row{max-width:1180px;margin:auto;display:flex;align-items:center;justify-content:space-between;gap:12px}.brand{display:flex;align-items:center;gap:10px}.brand-mark{width:38px;height:38px;border-radius:12px;background:linear-gradient(135deg,#244f77,#b19143);display:grid;place-items:center;font-weight:1000}.brand h1{font-size:14px;margin:0}.brand p{font-size:9px;margin:2px 0 0;color:var(--muted)}.mode-switch{display:flex;gap:5px}.mode-btn{font-size:10px;min-height:36px;padding:7px 9px}.main{max-width:1180px;margin:auto;padding:16px 14px 92px}.hero-card{background:linear-gradient(135deg,#16334a,#1f425d 62%,#3b311d);border:1px solid #234e70;border-radius:18px;padding:20px;position:relative;overflow:hidden}.hero-card:after{content:"";position:absolute;width:280px;height:280px;border-radius:50%;right:-120px;top:-145px;background:radial-gradient(circle,rgba(217,184,95,.26),transparent 68%)}.hero-card h2{margin:0;font-size:23px}.hero-card .deal-total{font-size:34px;font-weight:950;color:#f0cb6e;margin-top:10px}.hero-card .deal-sub{font-size:11px;color:#d8e1e7}.dashboard-grid{display:grid;grid-template-columns:1.1fr .9fr;gap:14px;margin-top:14px}.metrics-4{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:9px}.deal-layout{display:grid;grid-template-columns:1fr 1fr;gap:14px}.evidence-grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:11px}.evidence-card .top{display:flex;justify-content:space-between;gap:8px;align-items:start}.evidence-card h3{font-size:13px;margin:0}.evidence-card p{font-size:11px;line-height:1.45;color:var(--muted)}.scenario-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:11px}.scenario-card{display:grid;gap:10px}.scenario-card .price{font-size:20px;font-weight:900}.bottom-nav{position:fixed;z-index:50;bottom:0;left:0;right:0;background:rgba(13,19,26,.97);backdrop-filter:blur(14px);border-top:1px solid #2d3944;display:grid;grid-template-columns:repeat(5,1fr);padding:6px max(6px,env(safe-area-inset-right)) calc(6px + env(safe-area-inset-bottom)) max(6px,env(safe-area-inset-left))}.nav-btn{border:0;background:transparent;color:var(--muted);display:grid;place-items:center;gap:2px;font-size:9px;min-height:50px;border-radius:10px}.nav-btn strong{font-size:17px}.nav-btn.active{background:#16334a;color:#fff}.auth-shell{min-height:100vh;display:grid;place-items:center;padding:18px;background:radial-gradient(circle at 50% 10%,#1b3851,transparent 35%),var(--bg)}.auth-card{width:min(430px,100%);background:var(--surface);border:1px solid #35424e;border-radius:22px;padding:22px;box-shadow:var(--shadow)}.auth-logo{width:64px;height:64px;border-radius:19px;background:linear-gradient(135deg,#2b5c86,#b08d3f);display:grid;place-items:center;font-weight:950;font-size:20px;margin-bottom:15px}.onboarding{display:grid;gap:14px}.slide-stage{border-radius:16px;background:#0f171f;border:1px solid #33404b;overflow:hidden;min-height:250px;display:grid;place-items:center;position:relative}.slide-stage img{width:100%;height:260px;object-fit:cover}.slide-caption{position:absolute;left:0;right:0;bottom:0;padding:18px;background:linear-gradient(transparent,rgba(0,0,0,.88));text-align:center}.slide-caption h3{margin:0;font-size:18px}.slide-caption p{margin:4px 0 0;font-size:11px;color:#d7e0e7}.buyer-banner{background:#203228;border:1px solid #3d6048;padding:10px 13px;border-radius:12px;font-size:11px;margin-bottom:12px}.presentation-banner{background:#372f1a;border:1px solid #665a2c;padding:10px 13px;border-radius:12px;font-size:11px;margin-bottom:12px}@media(max-width:860px){.dashboard-grid,.deal-layout{grid-template-columns:1fr}.metrics-4{grid-template-columns:repeat(2,minmax(0,1fr))}.scenario-grid{grid-template-columns:repeat(2,minmax(0,1fr))}}@media(max-width:600px){.kpi-grid{grid-template-columns:1fr}.evidence-grid,.scenario-grid{grid-template-columns:1fr}.mode-switch{overflow:auto;max-width:180px}.mode-btn{font-size:9px}.hero-card h2{font-size:19px}.hero-card .deal-total{font-size:29px}.main{padding-left:10px;padding-right:10px}.card{padding:13px}.metrics-4{grid-template-columns:1fr 1fr}.header-row{align-items:center}.brand p{display:none}}@media(max-width:360px){.metrics-4{grid-template-columns:1fr}.brand h1{font-size:12px}.mode-switch{max-width:150px}.ring{width:62px;height:62px}}@media(prefers-reduced-motion:reduce){*{scroll-behavior:auto!important;transition:none!important;animation:none!important}}
LPFH_V111_DIST_4

cat > 'android/app/build.gradle' <<'LPFH_V111_DIST_5'
plugins { id 'com.android.application' }

android {
    namespace 'dk.ruko.lpfhdeal'
    compileSdk 35
    defaultConfig {
        applicationId 'dk.ruko.lpfhdeal'
        minSdk 26
        targetSdk 35
        versionCode 12
        versionName '1.1.1'
    }
}
LPFH_V111_DIST_5

node - <<'NODE'
const fs=require('fs');const p='dist/BUILD_INFO.json';const j=JSON.parse(fs.readFileSync(p,'utf8'));j.version='1.1.1';j.built_at=new Date().toISOString();fs.writeFileSync(p,JSON.stringify(j,null,2));
NODE
grep -q '"version": "1.1.1"' dist/BUILD_INFO.json
grep -q "versionName '1.1.1'" android/app/build.gradle
grep -q 'versionCode 12' android/app/build.gradle
grep -q -- '--gold:#d4b35a' dist/src/styles/tokens.css
grep -q 'linear-gradient(135deg,#16334a' dist/src/styles/screens.css
node --check dist/src/app.js
echo 'LPFH_V111_DIST_PATCH_OK'
