# 🏠 Hausbau Finanzübersicht

A personal single-page finance tracker for managing construction (Hausbau) costs, payment schedules, and financing — built for the Gök family home build.

## Features

- **Kostenplan** — Gewerke (trades) with budgets and inline Zahlung management
- **Zahlungsplan** — All payments across all Gewerke sorted by due date, with overdue detection
- **Finanzierung** — Eigenkapital, Kredit, and Geldquellen overview with gap analysis
- **Cloud sync** — Data persisted to Supabase (one row per user, real-time save)
- **Smart save** — Debounced auto-save + manual save button with unsaved-changes modal
- **Undo deletes** — 5-second undo window for any delete action

## Development

### Prerequisites

- A Supabase project (see [README_SUPABASE.md](README_SUPABASE.md) for schema setup)
- Node.js (only needed for local preview server)

### Local preview

```bash
npx serve . -p 5500
# then open http://localhost:5500
```

> Edit `index.html` directly — it is the single source file.

### How build works

There is no build step. `index.html` is the source and is tracked in git. The old `build.sh` is kept for reference but does nothing.

## Deployment

Pushes to `main` automatically deploy to **GitHub Pages** via GitHub Actions.

Live URL: `https://ozanngok-spec.github.io/FinanzUbersichtHausBau/`

> **First-time setup:** Go to repo **Settings → Pages → Source** and set it to **GitHub Actions**.

## Supabase setup

See [README_SUPABASE.md](README_SUPABASE.md) for:
- Database schema (SQL)
- Seeding initial data
- RLS policy recommendations
