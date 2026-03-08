// lib/presentation/license_test_screen.dart
// ============================================================================
// TEMPORARY TEST SCREEN - Remove before production release!
// ============================================================================

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_eye_capture/utils/license_manager.dart';
import 'package:ai_eye_capture/presentation/license_dialog.dart';

class LicenseTestScreen extends StatefulWidget {
  const LicenseTestScreen({super.key});

  @override
  State<LicenseTestScreen> createState() => _LicenseTestScreenState();
}

class _LicenseTestScreenState extends State<LicenseTestScreen> {
  LicenseInfo? _license;
  String? _machineId;
  List<String> _generatedKeys = [];

  @override
  void initState() {
    super.initState();
    _loadLicenseInfo();
  }

  Future<void> _loadLicenseInfo() async {
    final license = await LicenseManager().checkLicense();
    final machineId = await LicenseManager().getMachineId();
    setState(() {
      _license = license;
      _machineId = machineId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('🧪 License Test Panel',
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Current Status Card
            _buildStatusCard(),
            const SizedBox(height: 16),

            // Machine ID Card
            _buildMachineIdCard(),
            const SizedBox(height: 16),

            // Action Buttons
            _buildActionButtons(),
            const SizedBox(height: 16),

            // Generated Keys
            if (_generatedKeys.isNotEmpty) _buildGeneratedKeysCard(),
            const SizedBox(height: 16),

            // Pre-made Test Keys
            _buildTestKeysCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    final license = _license;
    final color = license == null
        ? Colors.grey
        : license.isValid
        ? (license.isTrial ? Colors.orange : Colors.green)
        : Colors.red;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                license?.isValid == true ? Icons.check_circle : Icons.info,
                color: color,
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                'Current License Status',
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white24, height: 24),
          _statusRow('Status', license?.status.name ?? 'Unknown'),
          _statusRow('Type', license?.type?.name ?? 'None'),
          _statusRow('Days Remaining', license?.daysRemaining?.toString() ?? 'N/A'),
          _statusRow('Registered To', license?.registeredTo ?? 'Not registered'),
          _statusRow('Message', license?.message ?? ''),
        ],
      ),
    );
  }

  Widget _statusRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: const TextStyle(color: Colors.white54)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildMachineIdCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Machine ID',
            style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  _machineId ?? 'Loading...',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontFamily: 'monospace',
                    fontSize: 12,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy, color: Colors.white54),
                onPressed: () {
                  if (_machineId != null) {
                    Clipboard.setData(ClipboardData(text: _machineId!));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Machine ID copied!')),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Open Registration Dialog
        ElevatedButton.icon(
          onPressed: () async {
            final result = await showLicenseDialog(
              context,
              currentLicense: _license,
            );
            if (result != null) {
              _loadLicenseInfo(); // Refresh status
            }
          },
          icon: const Icon(Icons.vpn_key),
          label: const Text('Open Registration Dialog'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00D9FF),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        const SizedBox(height: 12),

        // Generate Test Key
        ElevatedButton.icon(
          onPressed: _generateTestKey,
          icon: const Icon(Icons.add_circle),
          label: const Text('Generate New License Key'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        const SizedBox(height: 12),

        // Test Buttons Row
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _expireTrialForTesting,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('⏰ Expire Trial'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _resetLicense,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('🔄 Reset All'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Deactivate License
        if (_license?.isValid == true && !(_license?.isTrial ?? true))
          OutlinedButton.icon(
            onPressed: _deactivateLicense,
            icon: const Icon(Icons.remove_circle),
            label: const Text('Deactivate Current License'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
      ],
    );
  }

  Widget _buildGeneratedKeysCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🔑 Generated Keys (This Session)',
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ..._generatedKeys.map((key) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    key,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, color: Colors.white54, size: 20),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: key));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Copied: $key')),
                    );
                  },
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildTestKeysCard() {
    final testKeys = [
      ('Standard (1 Year)', 'CNRI-S8A2-KWJX-P4QN-7VHF'),
      ('Professional (Lifetime)', 'CNRI-P7C4-NQWK-8XJM-5RTB'),
      ('Enterprise (Multi-Machine)', 'CNRI-E5B1-JXPW-6KQC-4MHN'),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '✅ Pre-Made Test Keys (Copy & Use)',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...testKeys.map((entry) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.$1,
                        style: const TextStyle(color: Colors.white54, fontSize: 11),
                      ),
                      Text(
                        entry.$2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'monospace',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, color: Colors.green, size: 20),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: entry.$2));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Copied ${entry.$1} key!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _generateTestKey() {
    final key = LicenseManager.generateLicenseKey(LicenseType.professional);
    setState(() {
      _generatedKeys.insert(0, key);
    });
    Clipboard.setData(ClipboardData(text: key));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Generated & Copied: $key'),
        backgroundColor: Colors.purple,
      ),
    );
  }

  Future<void> _expireTrialForTesting() async {
    final prefs = await SharedPreferences.getInstance();
    final expiredDate = DateTime.now().subtract(const Duration(days: 30));
    await prefs.setString('trial_start', expiredDate.toIso8601String());
    await prefs.remove('license_data');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Trial expired! Restart app to see blocker screen.'),
        backgroundColor: Colors.orange,
      ),
    );
    _loadLicenseInfo();
  }

  Future<void> _resetLicense() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('trial_start');
    await prefs.remove('license_data');
    await prefs.remove('last_validation');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('License reset! Restart app for fresh 14-day trial.'),
        backgroundColor: Colors.blue,
      ),
    );
    _loadLicenseInfo();
  }

  Future<void> _deactivateLicense() async {
    await LicenseManager().deactivateLicense();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('License deactivated. Back to trial mode.'),
        backgroundColor: Colors.red,
      ),
    );
    _loadLicenseInfo();
  }
}