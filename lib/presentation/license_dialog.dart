// lib/presentation/license_dialog.dart
// CNRI Eye Capture - License Registration Dialog v1.1
// FIXED: machineeMismatch typo -> machineMismatch
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ai_eye_capture/utils/license_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ai_eye_capture/utils/purchase_links.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
/// Shows the license registration dialog
Future<LicenseInfo?> showLicenseDialog(BuildContext context, {LicenseInfo? currentLicense}) {
  return showDialog<LicenseInfo>(
    context: context,
    barrierDismissible: false,
    builder: (context) => LicenseDialog(currentLicense: currentLicense),
  );
}

class LicenseDialog extends StatefulWidget {
  final LicenseInfo? currentLicense;

  const LicenseDialog({super.key, this.currentLicense});

  @override
  State<LicenseDialog> createState() => _LicenseDialogState();
}

class _LicenseDialogState extends State<LicenseDialog> {
  final _formKey = GlobalKey<FormState>();
  final _keyController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  bool _isActivating = false;
  String? _errorMessage;
  String? _machineId;
  LicenseInfo? _activatedLicense;

  @override
  void initState() {
    super.initState();
    _loadMachineId();
  }

  Future<void> _loadMachineId() async {
    final id = await LicenseManager().getMachineId();
    setState(() => _machineId = id);
  }

  @override
  void dispose() {
    _keyController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1D1E33),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 500,
        constraints: const BoxConstraints(maxHeight: 700),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                if (widget.currentLicense != null) ...[
                  _buildCurrentLicenseStatus(),
                  const SizedBox(height: 24),
                ],
                _buildRegistrationForm(),
                const SizedBox(height: 16),
                if (_errorMessage != null) _buildErrorMessage(),
                if (_activatedLicense != null) _buildSuccessMessage(),
                const SizedBox(height: 24),
                _buildActions(),
                const SizedBox(height: 16),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00D9FF).withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(Icons.verified_user, size: 40, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.appTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l10n.licenseRegistration,
          style: const TextStyle(color: Colors.white60, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildCurrentLicenseStatus() {
    final license = widget.currentLicense!;
    final color = license.isValid
        ? Colors.green
        : license.isTrial
            ? Colors.orange
            : Colors.red;
    final icon = license.isValid
        ? Icons.check_circle
        : license.isTrial
            ? Icons.rocket_launch
            : Icons.error;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getStatusTitle(license.status),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      license.message,
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              if (license.daysRemaining != null && license.isTrial)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${license.daysRemaining} days',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
          if (license.registeredTo != null && !license.isTrial) ...[
            const Divider(color: Colors.white24, height: 24),
            Row(
              children: [
                const Icon(Icons.person, color: Colors.white54, size: 16),
                const SizedBox(width: 8),
                Text(
                  license.registeredTo!,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRegistrationForm() {
    final l10n = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.licenseEnterKeyTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          // License Key Field
          TextFormField(
            controller: _keyController,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'monospace',
              fontSize: 16,
              letterSpacing: 2,
            ),
            decoration: InputDecoration(
              hintText: l10n.licenseKeyPlaceholder,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
              prefixIcon: const Icon(Icons.vpn_key, color: Color(0xFF00D9FF)),
              filled: true,
              fillColor: Colors.black26,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF00D9FF), width: 2),
              ),
            ),
            textCapitalization: TextCapitalization.characters,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9-]')),
              _LicenseKeyFormatter(),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.licenseValidationKeyRequired;
              }
              final cleaned = value.replaceAll('-', '');
              if (cleaned.length != 20) {
                return l10n.licenseValidationKeyFormat;
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Name Field
          TextFormField(
            controller: _nameController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: l10n.licenseYourName,
              labelStyle: const TextStyle(color: Colors.white54),
              prefixIcon: const Icon(Icons.person, color: Colors.white54),
              filled: true,
              fillColor: Colors.black26,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF00D9FF), width: 2),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.licenseValidationNameRequired;
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Email Field
          TextFormField(
            controller: _emailController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: l10n.licenseEmailAddress,
              labelStyle: const TextStyle(color: Colors.white54),
              prefixIcon: const Icon(Icons.email, color: Colors.white54),
              filled: true,
              fillColor: Colors.black26,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF00D9FF), width: 2),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.licenseValidationEmailRequired;
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return l10n.licenseValidationEmailInvalid;
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Machine ID Display
          if (_machineId != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.computer, color: Colors.white38, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.licenseMachineId,
                          style: const TextStyle(color: Colors.white38, fontSize: 10),
                        ),
                        Text(
                          _machineId!,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 11,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.white38, size: 18),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _machineId!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.licenseMachineIdCopied),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    tooltip: l10n.licenseCopyMachineId,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error, color: Colors.red, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).licenseActivatedSuccess,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  _activatedLicense!.message,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Column(
      children: [
        // Activate Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isActivating ? null : _activateLicense,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D9FF),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: _isActivating
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(Colors.black),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.verified),
                      const SizedBox(width: 8),
                      Text(
                        AppLocalizations.of(context).licenseActivate,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          ),
        ),

        const SizedBox(height: 12),

        // Secondary Actions Row
        Row(
          children: [
            // Continue Trial / Close Button
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(_activatedLicense),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white70,
                  side: const BorderSide(color: Colors.white24),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _activatedLicense != null
                      ? AppLocalizations.of(context).close
                      : (widget.currentLicense?.isTrial == true
                          ? AppLocalizations.of(context).licenseContinueTrial
                          : AppLocalizations.of(context).cancel),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Buy License Button
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _openPurchasePage,
                icon: const Icon(Icons.shopping_cart, size: 18),
                label: Text(AppLocalizations.of(context).licenseBuyLicense),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green,
                  side: const BorderSide(color: Colors.green),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Divider(color: Colors.white12),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _openSupportPage,
              child: Text(
                AppLocalizations.of(context).licenseNeedHelp,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
            const Text('•', style: TextStyle(color: Colors.white24)),
            TextButton(
              onPressed: _openEULA,
              child: Text(
                AppLocalizations.of(context).licenseLicenseAgreement,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // FIXED: Changed machineeMismatch to machineMismatch (single 'e')
  String _getStatusTitle(LicenseStatus status) {
    final l10n = AppLocalizations.of(context);
    return switch (status) {
      LicenseStatus.valid => l10n.licenseStatusValid,
      LicenseStatus.trialActive => l10n.licenseStatusTrialActive,
      LicenseStatus.trialExpired => l10n.licenseStatusTrialExpired,
      LicenseStatus.expired => l10n.licenseStatusExpired,
      LicenseStatus.invalid => l10n.licenseStatusInvalid,
      LicenseStatus.unregistered => l10n.licenseStatusUnregistered,
      LicenseStatus.machineMismatch => l10n.licenseStatusMachineMismatch, // FIXED: was machineeMismatch
      LicenseStatus.networkError => l10n.licenseStatusNetworkError,
    };
  }

  Future<void> _activateLicense() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isActivating = true;
      _errorMessage = null;
      _activatedLicense = null;
    });

    try {
      final result = await LicenseManager().activateLicense(
        _keyController.text,
        _emailController.text,
        _nameController.text,
      );

      setState(() {
        _isActivating = false;
        if (result.isValid) {
          _activatedLicense = result;
        } else {
          _errorMessage = result.message;
        }
      });
    } catch (e) {
      setState(() {
        _isActivating = false;
        _errorMessage = AppLocalizations.of(context).licenseMsgUnableToActivate;
      });
    }
  }

  Future<void> _openPurchasePage() async {
    await launchUrl(Uri.parse('https://cnri.edu/pricing/')); // Your purchase page
  }

  void _openSupportPage() {
    launchUrl(Uri.parse('mailto:helpdesk@cnri.edu')); // Your support email
  }

  void _openEULA() {
    launchUrl(Uri.parse('https://cnri.edu/pupilmetrics-research-only-software-license-agreement/')); // Your terms page
  }
}

/// Formatter for license key input (auto-adds dashes)
class _LicenseKeyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.toUpperCase().replaceAll('-', '');
    if (text.length > 20) {
      return oldValue;
    }

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write('-');
      }
      buffer.write(text[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
