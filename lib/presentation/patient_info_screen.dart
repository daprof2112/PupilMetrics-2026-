// lib/presentation/patient_info_screen.dart
// PatientInfo class is imported from pupil_analyzer_fixed.dart - LOCALIZED

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/main.dart';
import 'package:ai_eye_capture/models/patient_info.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';

class PatientInfoScreen extends StatefulWidget {
  final Function(PatientInfo) onContinue;

  const PatientInfoScreen({super.key, required this.onContinue});

  @override
  State<PatientInfoScreen> createState() => _PatientInfoScreenState();
}

class _PatientInfoScreenState extends State<PatientInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _complaintsController = TextEditingController();
  Sex _selectedSex = Sex.male;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _complaintsController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final patientInfo = PatientInfo(
        name: _nameController.text.trim(),
        sex: _selectedSex,
        age: int.parse(_ageController.text.trim()),
        mainComplaints: _complaintsController.text.trim().isEmpty ? null : _complaintsController.text.trim(),
      );

      globalPatientInfo = patientInfo;
      widget.onContinue(patientInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.personInformation, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [const Color(0xFF00D9FF).withOpacity(0.2), const Color(0xFF00D9FF).withOpacity(0.05)]),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF00D9FF).withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.person_outline, color: Color(0xFF00D9FF), size: 40),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.enterPersonDetails, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(l10n.infoIncludedInReport, style: const TextStyle(color: Colors.white60, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Name field
              Text('${l10n.fullName} *', style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: l10n.enterPersonName,
                  hintStyle: const TextStyle(color: Colors.white38),
                  prefixIcon: const Icon(Icons.person, color: Color(0xFF00D9FF)),
                  filled: true,
                  fillColor: const Color(0xFF1D1E33),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.white12)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF00D9FF), width: 2)),
                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red)),
                ),
                validator: (v) => v == null || v.trim().isEmpty ? l10n.nameRequired : null,
              ),
              const SizedBox(height: 24),

              // Sex selector
              Text('${l10n.sex} *', style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedSex = Sex.male),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: _selectedSex == Sex.male ? Colors.blue.withOpacity(0.2) : const Color(0xFF1D1E33),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _selectedSex == Sex.male ? Colors.blue : Colors.white12, width: _selectedSex == Sex.male ? 2 : 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male, color: _selectedSex == Sex.male ? Colors.blue : Colors.white54),
                            const SizedBox(width: 8),
                            Text(l10n.male, style: TextStyle(color: _selectedSex == Sex.male ? Colors.blue : Colors.white54, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedSex = Sex.female),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: _selectedSex == Sex.female ? Colors.pink.withOpacity(0.2) : const Color(0xFF1D1E33),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _selectedSex == Sex.female ? Colors.pink : Colors.white12, width: _selectedSex == Sex.female ? 2 : 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female, color: _selectedSex == Sex.female ? Colors.pink : Colors.white54),
                            const SizedBox(width: 8),
                            Text(l10n.female, style: TextStyle(color: _selectedSex == Sex.female ? Colors.pink : Colors.white54, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Age field
              Text('${l10n.ageYears} *', style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: l10n.enterAge,
                  hintStyle: const TextStyle(color: Colors.white38),
                  prefixIcon: const Icon(Icons.cake, color: Color(0xFF00D9FF)),
                  filled: true,
                  fillColor: const Color(0xFF1D1E33),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.white12)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF00D9FF), width: 2)),
                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red)),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return l10n.ageRequired;
                  final age = int.tryParse(v.trim());
                  if (age == null) return l10n.enterValidNumber;
                  if (age < 0 || age > 120) return l10n.enterValidAge;
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Complaints field (optional)
              Text(l10n.mainComplaintsOptional, style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _complaintsController,
                maxLines: 3,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: l10n.complaintsHint,
                  hintStyle: const TextStyle(color: Colors.white38),
                  prefixIcon: const Padding(padding: EdgeInsets.only(bottom: 48), child: Icon(Icons.medical_information, color: Color(0xFF00D9FF))),
                  filled: true,
                  fillColor: const Color(0xFF1D1E33),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.white12)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF00D9FF), width: 2)),
                ),
              ),
              const SizedBox(height: 40),

              // Continue button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 8,
                    shadowColor: const Color(0xFF00D9FF).withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(l10n.continueToCaptire, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 12),
                      const Icon(Icons.arrow_forward, size: 24),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Info note
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.orange, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.ageImportantNote,
                        style: const TextStyle(color: Colors.orange, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}