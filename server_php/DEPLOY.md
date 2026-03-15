# Deploying the PupilMetrics License Server on cPanel/WHM

This is a step-by-step guide for deploying on a WHM server (AlmaLinux 8).
No root access or command line needed — everything is done through cPanel.

---

## Step 1 — Create a Subdomain

This gives the server its own clean URL like `https://licenses.yoursite.com`.

1. Log into **cPanel** for the domain you want to use
2. Go to **Domains** → **Subdomains**
3. Create subdomain: `licenses` (or `api`, `activate` — your choice)
4. The document root will be something like `/home/username/licenses.yoursite.com`
5. Click **Create**

---

## Step 2 — Create a MySQL Database

1. In cPanel, go to **Databases** → **MySQL Databases**
2. Under "Create New Database", type `licenses` → click **Create Database**
   - Full name will be `yourusername_licenses`
3. Under "MySQL Users" → "Add New User":
   - Username: `licuser`, strong password → click **Create User**
   - Full username will be `yourusername_licuser`
4. Under "Add User To Database":
   - Select your new user + your new database → **Add**
   - On the next screen: tick **ALL PRIVILEGES** → **Make Changes**
5. Write down the database name, username, and password — you'll need them in Step 4

---

## Step 3 — Create the Database Tables

1. In cPanel, go to **Databases** → **phpMyAdmin**
2. Click your new database in the left sidebar (`yourusername_licenses`)
3. Click the **SQL** tab at the top
4. Open `schema.sql` from this folder, copy its entire contents, paste into the SQL box
5. Click **Go** — you should see "2 queries executed successfully"

---

## Step 4 — Configure the Server

1. Open `config.php` in a text editor
2. Fill in your values:

```php
define('DB_NAME', 'yourusername_licenses');   // from Step 2
define('DB_USER', 'yourusername_licuser');     // from Step 2
define('DB_PASS', 'the_password_you_set');     // from Step 2

define('API_SECRET',   'paste_the_same_value_as_flutter_apiSecret_here');
define('ADMIN_SECRET', 'make_up_a_long_random_string_for_yourself');
define('LICENSE_SECRET', 'J7hhJkReFF-CNRI-2026-JPz123Z883!'); // must match _secretKey in app
```

> **How to generate a good random secret:**
> In cPanel → Terminal (or any online tool):
> `openssl rand -hex 32`
> This gives you a 64-character random string. Use one for API_SECRET and
> a different one for ADMIN_SECRET.

3. Save the file.

---

## Step 5 — Upload the Files

1. In cPanel, go to **Files** → **File Manager**
2. Navigate to your subdomain's folder (e.g. `licenses.yoursite.com/public_html`)
3. Upload ALL files from this `server_php/` folder:
   - `.htaccess`
   - `activate.php`
   - `admin.php`
   - `auth.php`
   - `config.php`
   - `db.php`
   - `deactivate.php`
   - `health.php`
   - `key_validator.php`
   - `validate.php`

   > **Do NOT upload**: `schema.sql`, `DEPLOY.md`, `README.md`

4. Make sure `.htaccess` uploaded (cPanel sometimes hides dot-files — tick
   "Show Hidden Files" in File Manager settings if needed)

---

## Step 6 — Enable SSL (HTTPS)

1. In cPanel, go to **Security** → **SSL/TLS**
2. Click **Run AutoSSL** (or go to SSL/TLS Status and run it there)
3. Wait ~2 minutes — your subdomain will get a free Let's Encrypt certificate
4. Test it: open `https://licenses.yoursite.com/health` in your browser
   - You should see: `{"status":"ok","db":"connected","licenses":0,...}`
   - If you see an error, go to Step 7 (troubleshooting)

---

## Step 7 — Connect the Flutter App

Open `lib/utils/license_manager.dart` and change these two lines:

```dart
static const String _activationServer = 'https://licenses.yoursite.com';
static const String _apiSecret = 'paste_your_API_SECRET_here';
```

Rebuild and test. The app will now register activations with your server.

---

## Step 8 — Test Everything

**Test health check:**
Open in browser: `https://licenses.yoursite.com/health`
→ Should return `{"status":"ok",...}`

**Test admin list (no licenses yet):**
```
curl https://licenses.yoursite.com/admin/licenses \
  -H "X-Admin-Secret: your_admin_secret"
```
→ Should return `{"count":0,"licenses":[]}`

**Activate a license** from the app using a real key — then check admin/licenses
again to see it recorded with the machine ID.

---

## Admin Operations

All admin commands require the `X-Admin-Secret` header.

**List all licenses and activations:**
```bash
curl https://licenses.yoursite.com/admin/licenses \
  -H "X-Admin-Secret: YOUR_ADMIN_SECRET"
```

**Revoke a license** (e.g. stolen key, chargeback):
```bash
curl -X POST https://licenses.yoursite.com/admin/revoke \
  -H "X-Admin-Secret: YOUR_ADMIN_SECRET" \
  -H "Content-Type: application/json" \
  -d '{"key":"CNRI-XXXX-XXXX-XXXX-XXXX","reason":"Refund requested"}'
```

**Pre-register a key** (before sending to customer):
```bash
curl -X POST https://licenses.yoursite.com/admin/issue \
  -H "X-Admin-Secret: YOUR_ADMIN_SECRET" \
  -H "Content-Type: application/json" \
  -d '{"key":"CNRI-XXXX-XXXX-XXXX-XXXX","type":"professional","email":"john@example.com","registeredTo":"John Doe"}'
```

---

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| Browser shows PHP source code | PHP not enabled on subdomain — contact host or enable PHP in cPanel |
| `{"error":"Unauthorized"}` from admin | Wrong `X-Admin-Secret` header value |
| App shows "Unable to activate" | Check API_SECRET matches `_apiSecret` in Flutter app exactly |
| DB connection error in /health | Check DB_NAME, DB_USER, DB_PASS in config.php |
| `.htaccess` not working | Ensure mod_rewrite is enabled — WHM → Apache Configuration |
| Files upload but /health returns 404 | Check the subdomain document root is correct in cPanel |

---

## Security Notes

- `config.php` is blocked from web access by `.htaccess` — never make it readable
- Error logs go to `logs/error.log` (also not web-accessible)
- All API requests are HMAC-signed — random curl calls are rejected
- Admin endpoints require a separate secret
- Always use HTTPS — never HTTP for the activation server URL
