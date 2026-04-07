Supabase integration and seed instructions
======================================

This document explains how to create the minimal table schema in Supabase and how to seed the `hausbau_initial_data.json` into the `project_data` table.

1) Create the table (SQL)

Run the following SQL in the Supabase SQL editor:

```sql
create table if not exists project_data (
  user_id uuid primary key,
  data jsonb not null,
  updated_at timestamptz default now()
);

-- Optional: allow RLS and policies for authenticated users if you want client-side access
```

2) Prepare to seed

- Install dependencies in the project folder:

PowerShell:

```powershell
cd FinanzUbersichtHausbau
npm init -y
npm install @supabase/supabase-js
```

- Set environment variables (use a server-side service_role key for seeding):

PowerShell example:

```powershell
$env:SUPABASE_URL='https://your-project-ref.supabase.co'
$env:SUPABASE_KEY='your_service_role_key'
$env:SEED_USER_ID='00000000-0000-0000-0000-000000000000' # replace with the target user UUID
node seed-to-supabase.js
```

Or in CMD (Windows):

```cmd
set SUPABASE_URL=https://your-project-ref.supabase.co
set SUPABASE_KEY=your_service_role_key
set SEED_USER_ID=00000000-0000-0000-0000-000000000000
node seed-to-supabase.js
```

Notes:
- Use the Supabase `service_role` key for server-side seeding. Keep it secret.
- `SEED_USER_ID` should be the UUID of the user row you want to associate the project with. If you don't have a user yet, you can create a placeholder UUID, or sign up a user via the app and use that user id.

3) Client-side setup

In `hausbau_app.html` replace the `SUPABASE_URL` and `SUPABASE_KEY` placeholders near the top of the file with your Supabase project's URL and the public anon key if you want client-side auth (or use server functions). Example:

```js
const SUPABASE_URL = 'https://your-project-ref.supabase.co';
const SUPABASE_KEY = 'your_anon_key';
```

If you expose the anon key in the browser, secure table policies are required to prevent unauthorized data access. For local development you may use the anon key, but for production configure RLS and policies.

4) What the seed script does

- Reads `hausbau_initial_data.json` from the project folder and upserts it into `project_data` under `user_id = SEED_USER_ID`.
- The app expects `project_data` rows with a `data` JSON object containing the same shape as the JSON file.
