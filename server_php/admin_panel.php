<?php
// admin_panel.php — PupilMetrics License Admin Dashboard
// Access: https://licenses.cnri.edu/admin_panel.php
// Auth:   Session login with ADMIN_SECRET from config.php
// ============================================================================

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/key_validator.php';

session_start();

// ── Authentication ───────────────────────────────────────────────────────────

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {

    // Login
    if ($_POST['action'] === 'login') {
        $entered = trim($_POST['secret'] ?? '');
        if (hash_equals(ADMIN_SECRET, $entered)) {
            $_SESSION['pm_admin'] = true;
            header('Location: ' . $_SERVER['PHP_SELF']);
            exit;
        } else {
            $error = 'Invalid admin secret. Please try again.';
        }
    }

    // Logout
    if ($_POST['action'] === 'logout') {
        session_destroy();
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit;
    }

    // Only admins past this point
    if (!isset($_SESSION['pm_admin'])) {
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit;
    }

    // Generate key
    if ($_POST['action'] === 'generate') {
        $type  = trim($_POST['type']  ?? '');
        $name  = trim($_POST['name']  ?? '');
        $email = trim($_POST['email'] ?? '');
        $days  = trim($_POST['days']  ?? '');

        if (!in_array($type, ['standard', 'professional', 'enterprise'])) {
            $error = 'Invalid license type.';
        } elseif (empty($name) || empty($email)) {
            $error = 'Name and email are required.';
        } else {
            $key      = generateLicenseKey($type);
            $expires  = (!empty($days) && is_numeric($days))
                      ? date('Y-m-d H:i:s', strtotime("+{$days} days"))
                      : null;

            insertLicense([
                'key'           => $key,
                'type'          => $type,
                'email'         => $email,
                'registered_to' => $name,
                'expires_at'    => $expires,
            ]);

            $success = "License key generated and saved: <strong>{$key}</strong>";
        }
    }

    // Revoke key
    if ($_POST['action'] === 'revoke') {
        $key    = strtoupper(trim($_POST['key']    ?? ''));
        $reason = trim($_POST['reason'] ?? 'Revoked via admin panel');
        if (empty($key)) {
            $error = 'Key is required to revoke.';
        } else {
            revokeLicense($key, $reason);
            $success = "License <strong>{$key}</strong> has been revoked.";
        }
    }

    // Unrevoke / restore key
    if ($_POST['action'] === 'restore') {
        $key = strtoupper(trim($_POST['key'] ?? ''));
        if (!empty($key)) {
            restoreLicense($key);
            $success = "License <strong>{$key}</strong> has been restored.";
        }
    }

    // Delete all activations for a key (force re-activation)
    if ($_POST['action'] === 'clear_activations') {
        $key = strtoupper(trim($_POST['key'] ?? ''));
        if (!empty($key)) {
            clearActivations($key);
            $success = "All activations cleared for <strong>{$key}</strong>. User must re-activate.";
        }
    }
}

// ── Helper: generate key (mirrors Dart generateLicenseKey) ───────────────────

function generateLicenseKey(string $type): string {
    $typeCode = strtoupper($type[0]); // S / P / E
    $chars    = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $random   = '';
    for ($i = 0; $i < 7; $i++) {
        $random .= $chars[random_int(0, strlen($chars) - 1)];
    }
    $checksum = strtoupper(substr(
        hash_hmac('sha256', $typeCode . $random, LICENSE_SECRET),
        0, 8
    ));
    $raw = 'CNRI' . $typeCode . $checksum . $random; // 20 chars
    return substr($raw, 0, 4) . '-' . substr($raw, 4, 4) . '-'
         . substr($raw, 8, 4) . '-' . substr($raw, 12, 4) . '-'
         . substr($raw, 16, 4);
}

// ── Helper: restore revoked license ─────────────────────────────────────────

function restoreLicense(string $key): void {
    global $pdo;
    if (!isset($pdo)) {
        $pdo = new PDO(
            'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8mb4',
            DB_USER, DB_PASS,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
        );
    }
    $stmt = $pdo->prepare('UPDATE licenses SET revoked = 0, revoke_reason = NULL WHERE license_key = ?');
    $stmt->execute([$key]);
}

// ── Helper: clear all activations ───────────────────────────────────────────

function clearActivations(string $key): void {
    global $pdo;
    if (!isset($pdo)) {
        $pdo = new PDO(
            'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8mb4',
            DB_USER, DB_PASS,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
        );
    }
    $stmt = $pdo->prepare('DELETE FROM activations WHERE license_key = ?');
    $stmt->execute([$key]);
}

// ── Redirect if not logged in ────────────────────────────────────────────────
$loggedIn = isset($_SESSION['pm_admin']);

// ── Load data (only when logged in) ─────────────────────────────────────────
$licenses   = [];
$totalKeys  = 0;
$activeKeys = 0;
$revokedKeys= 0;
$totalActs  = 0;

if ($loggedIn) {
    $licenses = getAllLicenses();
    foreach ($licenses as &$lic) {
        $lic['activations'] = getActivations($lic['license_key']);
        $totalActs += count($lic['activations']);
        if ($lic['revoked']) $revokedKeys++;
        else $activeKeys++;
    }
    unset($lic);
    $totalKeys = count($licenses);
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PupilMetrics — License Admin</title>
<style>
  :root {
    --bg:       #0a0e21;
    --bg2:      #1d1e33;
    --bg3:      #252742;
    --accent:   #00d9ff;
    --accent2:  #00ffcc;
    --green:    #00e676;
    --red:      #ff5252;
    --orange:   #ffab40;
    --purple:   #ce93d8;
    --text:     #e8eaf6;
    --text2:    #9e9eb8;
    --border:   rgba(0,217,255,0.18);
  }
  * { box-sizing: border-box; margin: 0; padding: 0; }
  body { font-family: 'Segoe UI', system-ui, sans-serif; background: var(--bg); color: var(--text); min-height: 100vh; }

  /* ── Login ── */
  .login-wrap { display: flex; align-items: center; justify-content: center; min-height: 100vh; }
  .login-card { background: var(--bg2); border: 1px solid var(--border); border-radius: 16px; padding: 40px; width: 380px; text-align: center; }
  .login-card .eye { font-size: 48px; margin-bottom: 12px; }
  .login-card h1 { color: var(--accent); font-size: 22px; margin-bottom: 4px; }
  .login-card p  { color: var(--text2); font-size: 13px; margin-bottom: 24px; }
  .form-group { text-align: left; margin-bottom: 16px; }
  .form-group label { display: block; color: var(--text2); font-size: 12px; margin-bottom: 6px; text-transform: uppercase; letter-spacing: 0.8px; }
  .form-group input, .form-group select { width: 100%; background: var(--bg3); border: 1px solid var(--border); border-radius: 8px; padding: 10px 14px; color: var(--text); font-size: 14px; outline: none; transition: border-color .2s; }
  .form-group input:focus, .form-group select:focus { border-color: var(--accent); }
  .btn { display: inline-flex; align-items: center; gap: 8px; padding: 10px 20px; border-radius: 8px; border: none; cursor: pointer; font-size: 14px; font-weight: 600; transition: opacity .2s, transform .1s; }
  .btn:hover { opacity: .85; transform: translateY(-1px); }
  .btn-primary   { background: var(--accent); color: #000; }
  .btn-danger    { background: var(--red); color: #fff; }
  .btn-success   { background: var(--green); color: #000; }
  .btn-secondary { background: var(--bg3); color: var(--text2); border: 1px solid var(--border); }
  .btn-warn      { background: var(--orange); color: #000; }
  .btn-sm { padding: 5px 12px; font-size: 12px; border-radius: 6px; }
  .btn-full { width: 100%; justify-content: center; }

  /* ── Layout ── */
  .topbar { background: var(--bg2); border-bottom: 1px solid var(--border); display: flex; align-items: center; justify-content: space-between; padding: 0 24px; height: 56px; }
  .topbar-brand { display: flex; align-items: center; gap: 10px; }
  .topbar-brand .icon { color: var(--accent); font-size: 22px; }
  .topbar-brand h1 { color: var(--accent); font-size: 18px; font-weight: 700; }
  .topbar-brand span { color: var(--text2); font-size: 12px; }
  .main { max-width: 1300px; margin: 0 auto; padding: 24px; }

  /* ── Cards ── */
  .card { background: var(--bg2); border: 1px solid var(--border); border-radius: 12px; padding: 20px; }
  .card-title { color: var(--accent); font-size: 13px; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 16px; display: flex; align-items: center; gap: 8px; }

  /* ── Stats row ── */
  .stats { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; margin-bottom: 24px; }
  .stat { background: var(--bg2); border: 1px solid var(--border); border-radius: 12px; padding: 18px 20px; }
  .stat-value { font-size: 32px; font-weight: 700; line-height: 1; }
  .stat-label { color: var(--text2); font-size: 12px; margin-top: 6px; }
  .stat-accent  { border-color: rgba(0,217,255,.4);  }
  .stat-green   { border-color: rgba(0,230,118,.4);  }
  .stat-red     { border-color: rgba(255,82,82,.4);  }
  .stat-orange  { border-color: rgba(255,171,64,.4); }

  /* ── Grid ── */
  .grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 24px; }
  @media(max-width:800px){ .grid-2 { grid-template-columns: 1fr; } .stats { grid-template-columns: 1fr 1fr; } }

  /* ── Alerts ── */
  .alert { padding: 12px 16px; border-radius: 8px; font-size: 13px; margin-bottom: 20px; }
  .alert-error   { background: rgba(255,82,82,.12); border: 1px solid rgba(255,82,82,.4); color: var(--red); }
  .alert-success { background: rgba(0,230,118,.10); border: 1px solid rgba(0,230,118,.35); color: var(--green); }

  /* ── Table ── */
  .table-wrap { overflow-x: auto; }
  table { width: 100%; border-collapse: collapse; font-size: 13px; }
  th { color: var(--text2); font-size: 11px; text-transform: uppercase; letter-spacing: .8px; padding: 8px 12px; text-align: left; border-bottom: 1px solid var(--border); white-space: nowrap; }
  td { padding: 11px 12px; border-bottom: 1px solid rgba(255,255,255,.05); vertical-align: top; }
  tr:last-child td { border-bottom: none; }
  tr:hover td { background: rgba(255,255,255,.02); }
  .key-cell { font-family: monospace; font-size: 13px; color: var(--accent); letter-spacing: 1px; white-space: nowrap; }
  .badge { display: inline-flex; align-items: center; padding: 3px 9px; border-radius: 20px; font-size: 11px; font-weight: 600; white-space: nowrap; }
  .badge-green  { background: rgba(0,230,118,.15); color: var(--green); }
  .badge-red    { background: rgba(255,82,82,.15);  color: var(--red); }
  .badge-orange { background: rgba(255,171,64,.15); color: var(--orange); }
  .badge-blue   { background: rgba(0,217,255,.12);  color: var(--accent); }
  .badge-purple { background: rgba(206,147,216,.15); color: var(--purple); }
  .act-list { list-style: none; margin: 0; padding: 0; }
  .act-list li { font-size: 11px; color: var(--text2); padding: 1px 0; }
  .act-list li::before { content: '⬤ '; color: var(--green); font-size: 8px; }
  .actions-cell { display: flex; gap: 6px; flex-wrap: wrap; }
  .empty-row td { text-align: center; color: var(--text2); padding: 40px; }

  /* ── Generate form ── */
  .gen-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
  @media(max-width:600px){ .gen-grid { grid-template-columns: 1fr; } }

  /* ── Search ── */
  .search-bar { display: flex; gap: 12px; margin-bottom: 16px; }
  .search-bar input { flex: 1; background: var(--bg3); border: 1px solid var(--border); border-radius: 8px; padding: 9px 14px; color: var(--text); font-size: 13px; outline: none; }
  .search-bar input:focus { border-color: var(--accent); }

  /* ── Confirm modal ── */
  .modal-bg { display:none; position:fixed; inset:0; background:rgba(0,0,0,.7); z-index:1000; align-items:center; justify-content:center; }
  .modal-bg.open { display:flex; }
  .modal { background:var(--bg2); border:1px solid var(--border); border-radius:12px; padding:28px; max-width:400px; width:100%; }
  .modal h3 { color:var(--red); margin-bottom:12px; }
  .modal p { color:var(--text2); font-size:13px; margin-bottom:20px; }
  .modal-btns { display:flex; gap:10px; justify-content:flex-end; }
</style>
</head>
<body>

<?php if (!$loggedIn): ?>
<!-- ════════════════════════════ LOGIN PAGE ════════════════════════════════ -->
<div class="login-wrap">
  <div class="login-card">
    <div class="eye">👁️</div>
    <h1>PupilMetrics</h1>
    <p>License Administration Panel</p>
    <?php if ($error): ?>
      <div class="alert alert-error"><?= htmlspecialchars($error) ?></div>
    <?php endif; ?>
    <form method="POST">
      <input type="hidden" name="action" value="login">
      <div class="form-group">
        <label>Admin Secret</label>
        <input type="password" name="secret" placeholder="Enter admin secret" autofocus required>
      </div>
      <button type="submit" class="btn btn-primary btn-full">Sign In</button>
    </form>
  </div>
</div>

<?php else: ?>
<!-- ════════════════════════════ DASHBOARD ════════════════════════════════ -->

<div class="topbar">
  <div class="topbar-brand">
    <span class="icon">👁️</span>
    <div>
      <h1>PupilMetrics Admin</h1>
    </div>
    <span>License Management</span>
  </div>
  <form method="POST" style="margin:0">
    <input type="hidden" name="action" value="logout">
    <button type="submit" class="btn btn-secondary btn-sm">Sign Out</button>
  </form>
</div>

<div class="main">

  <?php if ($error): ?>
    <div class="alert alert-error"><?= htmlspecialchars($error) ?></div>
  <?php endif; ?>
  <?php if ($success): ?>
    <div class="alert alert-success"><?= $success ?></div>
  <?php endif; ?>

  <!-- Stats -->
  <div class="stats">
    <div class="stat stat-accent">
      <div class="stat-value" style="color:var(--accent)"><?= $totalKeys ?></div>
      <div class="stat-label">Total Licenses</div>
    </div>
    <div class="stat stat-green">
      <div class="stat-value" style="color:var(--green)"><?= $activeKeys ?></div>
      <div class="stat-label">Active</div>
    </div>
    <div class="stat stat-red">
      <div class="stat-value" style="color:var(--red)"><?= $revokedKeys ?></div>
      <div class="stat-label">Revoked</div>
    </div>
    <div class="stat stat-orange">
      <div class="stat-value" style="color:var(--orange)"><?= $totalActs ?></div>
      <div class="stat-label">Active Machines</div>
    </div>
  </div>

  <!-- Generate Key + Quick Revoke -->
  <div class="grid-2">

    <!-- Generate -->
    <div class="card">
      <div class="card-title">🔑 Generate License Key</div>
      <form method="POST">
        <input type="hidden" name="action" value="generate">
        <div class="gen-grid">
          <div class="form-group">
            <label>License Type</label>
            <select name="type">
              <option value="professional">Professional (1 machine, lifetime)</option>
              <option value="standard">Standard (2 machines, 1 year)</option>
              <option value="enterprise">Enterprise (10 machines, lifetime)</option>
            </select>
          </div>
          <div class="form-group">
            <label>Days Until Expiry</label>
            <input type="number" name="days" placeholder="Leave blank = lifetime" min="1">
          </div>
          <div class="form-group">
            <label>Customer Name</label>
            <input type="text" name="name" placeholder="Dr. Jane Smith" required>
          </div>
          <div class="form-group">
            <label>Customer Email</label>
            <input type="email" name="email" placeholder="jane@hospital.org" required>
          </div>
        </div>
        <button type="submit" class="btn btn-primary" style="margin-top:4px">
          ✨ Generate &amp; Save Key
        </button>
      </form>
    </div>

    <!-- Quick Revoke -->
    <div class="card">
      <div class="card-title">🚫 Revoke / Restore License</div>
      <form method="POST" id="revokeForm">
        <input type="hidden" name="action" value="revoke">
        <div class="form-group">
          <label>License Key</label>
          <input type="text" name="key" id="revokeKey" placeholder="CNRI-XXXX-XXXX-XXXX-XXXX"
                 style="font-family:monospace;letter-spacing:1px" required>
        </div>
        <div class="form-group">
          <label>Reason (optional)</label>
          <input type="text" name="reason" placeholder="e.g. Refund requested">
        </div>
        <div style="display:flex;gap:10px;flex-wrap:wrap">
          <button type="button" class="btn btn-danger" onclick="confirmRevoke()">🚫 Revoke</button>
          <button type="button" class="btn btn-success" onclick="restoreKey()">✅ Restore</button>
          <button type="button" class="btn btn-warn" onclick="clearActs()">🔄 Clear Activations</button>
        </div>
      </form>

      <!-- Restore form (hidden) -->
      <form method="POST" id="restoreForm" style="display:none">
        <input type="hidden" name="action" value="restore">
        <input type="hidden" name="key" id="restoreKey">
      </form>
      <!-- Clear activations form (hidden) -->
      <form method="POST" id="clearForm" style="display:none">
        <input type="hidden" name="action" value="clear_activations">
        <input type="hidden" name="key" id="clearKey">
      </form>
    </div>

  </div>

  <!-- License Table -->
  <div class="card">
    <div class="card-title">📋 All Licenses</div>
    <div class="search-bar">
      <input type="text" id="searchInput" placeholder="Search by key, name, email, or type…" oninput="filterTable()">
    </div>
    <div class="table-wrap">
      <table id="licenseTable">
        <thead>
          <tr>
            <th>License Key</th>
            <th>Type</th>
            <th>Registered To</th>
            <th>Email</th>
            <th>Activations</th>
            <th>Issued</th>
            <th>Expires</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
        <?php if (empty($licenses)): ?>
          <tr class="empty-row"><td colspan="9">No licenses found. Generate one above!</td></tr>
        <?php else: ?>
          <?php foreach ($licenses as $lic):
            $key       = $lic['license_key'];
            $type      = $lic['type'] ?? 'standard';
            $name      = htmlspecialchars($lic['registered_to'] ?? '—');
            $email     = htmlspecialchars($lic['email'] ?? '—');
            $revoked   = !empty($lic['revoked']);
            $issuedAt  = $lic['created_at']  ?? null;
            $expiresAt = $lic['expires_at']  ?? null;
            $acts      = $lic['activations'] ?? [];
            $maxActs   = maxActivations($type);
            $actCount  = count($acts);
            $isExpired = $expiresAt && strtotime($expiresAt) < time();

            if ($revoked) {
                $badge = '<span class="badge badge-red">Revoked</span>';
            } elseif ($isExpired) {
                $badge = '<span class="badge badge-orange">Expired</span>';
            } elseif ($actCount > 0) {
                $badge = '<span class="badge badge-green">Active</span>';
            } else {
                $badge = '<span class="badge badge-blue">Unused</span>';
            }

            $typeBadge = match($type) {
                'professional' => '<span class="badge badge-purple">Professional</span>',
                'enterprise'   => '<span class="badge badge-orange">Enterprise</span>',
                default        => '<span class="badge badge-blue">Standard</span>',
            };
          ?>
          <tr>
            <td class="key-cell" title="Click to copy" onclick="copyKey('<?= $key ?>')" style="cursor:pointer"><?= $key ?></td>
            <td><?= $typeBadge ?></td>
            <td><?= $name ?></td>
            <td style="color:var(--text2);font-size:12px"><?= $email ?></td>
            <td>
              <div style="font-size:12px;margin-bottom:4px">
                <?= $actCount ?>/<?= $maxActs ?> machines
              </div>
              <?php if (!empty($acts)): ?>
              <ul class="act-list">
                <?php foreach ($acts as $act): ?>
                  <li title="<?= htmlspecialchars($act['machine_id'] ?? '') ?>">
                    <?= substr(htmlspecialchars($act['machine_id'] ?? 'unknown'), 0, 12) ?>…
                    <span style="color:var(--text2)">(<?= date('M j', strtotime($act['activated_at'] ?? 'now')) ?>)</span>
                  </li>
                <?php endforeach; ?>
              </ul>
              <?php endif; ?>
            </td>
            <td style="color:var(--text2);font-size:12px;white-space:nowrap">
              <?= $issuedAt ? date('Y-m-d', strtotime($issuedAt)) : '—' ?>
            </td>
            <td style="font-size:12px;white-space:nowrap;color:<?= $isExpired ? 'var(--red)' : 'var(--text2)' ?>">
              <?= $expiresAt ? date('Y-m-d', strtotime($expiresAt)) : 'Lifetime' ?>
            </td>
            <td><?= $badge ?></td>
            <td>
              <div class="actions-cell">
                <button class="btn btn-secondary btn-sm" onclick="fillKey('<?= $key ?>')" title="Fill into revoke form">✏️</button>
                <?php if (!$revoked): ?>
                  <button class="btn btn-danger btn-sm" onclick="quickRevoke('<?= $key ?>')" title="Revoke">🚫</button>
                <?php else: ?>
                  <button class="btn btn-success btn-sm" onclick="quickRestore('<?= $key ?>')" title="Restore">✅</button>
                <?php endif; ?>
                <?php if ($actCount > 0): ?>
                  <button class="btn btn-warn btn-sm" onclick="quickClearActs('<?= $key ?>')" title="Clear activations">🔄</button>
                <?php endif; ?>
              </div>
            </td>
          </tr>
          <?php endforeach; ?>
        <?php endif; ?>
        </tbody>
      </table>
    </div>
  </div>

</div><!-- /main -->

<!-- Confirm Modal -->
<div class="modal-bg" id="confirmModal">
  <div class="modal">
    <h3 id="modalTitle">Confirm Action</h3>
    <p id="modalMsg">Are you sure?</p>
    <div class="modal-btns">
      <button class="btn btn-secondary" onclick="closeModal()">Cancel</button>
      <button class="btn btn-danger" id="modalConfirmBtn" onclick="modalConfirm()">Confirm</button>
    </div>
  </div>
</div>

<script>
let _pendingAction = null;

function confirmRevoke() {
  const key = document.getElementById('revokeKey').value.trim();
  if (!key) { alert('Enter a license key first.'); return; }
  showModal('Revoke License', `Revoke <strong style="color:#ff5252">${key}</strong>? The user will lose access immediately.`, () => {
    document.getElementById('revokeForm').submit();
  }, 'btn-danger');
}

function restoreKey() {
  const key = document.getElementById('revokeKey').value.trim();
  if (!key) { alert('Enter a license key first.'); return; }
  document.getElementById('restoreKey').value = key;
  showModal('Restore License', `Restore <strong style="color:#00e676">${key}</strong>?`, () => {
    document.getElementById('restoreForm').submit();
  }, 'btn-success');
}

function clearActs() {
  const key = document.getElementById('revokeKey').value.trim();
  if (!key) { alert('Enter a license key first.'); return; }
  document.getElementById('clearKey').value = key;
  showModal('Clear Activations', `Clear all machine activations for <strong>${key}</strong>? The user will need to re-activate.`, () => {
    document.getElementById('clearForm').submit();
  }, 'btn-warn');
}

function fillKey(key) {
  document.getElementById('revokeKey').value = key;
  document.querySelector('.card:nth-child(2)').scrollIntoView({behavior:'smooth', block:'center'});
}

function quickRevoke(key) {
  document.getElementById('revokeKey').value = key;
  confirmRevoke();
}

function quickRestore(key) {
  document.getElementById('revokeKey').value = key;
  restoreKey();
}

function quickClearActs(key) {
  document.getElementById('revokeKey').value = key;
  clearActs();
}

function copyKey(key) {
  navigator.clipboard.writeText(key).then(() => {
    showToast('Key copied: ' + key);
  });
}

function showModal(title, msg, onConfirm, btnClass) {
  document.getElementById('modalTitle').textContent = title;
  document.getElementById('modalMsg').innerHTML = msg;
  const btn = document.getElementById('modalConfirmBtn');
  btn.className = 'btn ' + (btnClass || 'btn-danger');
  _pendingAction = onConfirm;
  document.getElementById('confirmModal').classList.add('open');
}

function closeModal() {
  document.getElementById('confirmModal').classList.remove('open');
  _pendingAction = null;
}

function modalConfirm() {
  closeModal();
  if (_pendingAction) _pendingAction();
}

function showToast(msg) {
  const t = document.createElement('div');
  t.textContent = msg;
  t.style.cssText = 'position:fixed;bottom:20px;left:50%;transform:translateX(-50%);background:#00d9ff;color:#000;padding:10px 20px;border-radius:8px;font-size:13px;font-weight:600;z-index:9999;transition:opacity .4s';
  document.body.appendChild(t);
  setTimeout(() => { t.style.opacity = '0'; setTimeout(() => t.remove(), 400); }, 2500);
}

function filterTable() {
  const q = document.getElementById('searchInput').value.toLowerCase();
  document.querySelectorAll('#licenseTable tbody tr').forEach(row => {
    row.style.display = row.textContent.toLowerCase().includes(q) ? '' : 'none';
  });
}

// Close modal on background click
document.getElementById('confirmModal').addEventListener('click', function(e) {
  if (e.target === this) closeModal();
});
</script>

<?php endif; ?>
</body>
</html>
