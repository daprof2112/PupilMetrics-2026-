import 'package:ai_eye_capture/constant/assets.dart';
import 'package:ai_eye_capture/constant/color.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/main.dart';
import 'package:ai_eye_capture/presentation/widgets/AppTextField.dart';
import 'package:ai_eye_capture/presentation/widgets/primary_button.dart';
import 'package:ai_eye_capture/presentation/widgets/success_toast.dart';
import 'package:ai_eye_capture/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  String? _selectGender = '';

  // Laterality stored as an index so it stays language-agnostic internally.
  // Index 0 = Right-handed (default)
  int _lateralityIndex = 0;

  bool consecutiveNewlines = false;
  final TextEditingController complaintsController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late FocusNode _focusNode;
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focus.removeListener(_onFocusChange);
    _focusNode.dispose();
    _focus.dispose();
    _nameController.dispose();
    _ageController.dispose();
    complaintsController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  List<String> _getLateralityList(AppLocalizations l10n) => [
    l10n.rightHanded,
    l10n.leftHanded,
    l10n.partialLeftHandedness,
    l10n.retrainedLeftHandedness,
    l10n.bilateralBothHands,
  ];

  // English labels used in the email body so the recipient always gets English.
  static const List<String> _lateralityEnglish = [
    'Right-handed',
    'Left-handed',
    'Partial Left-handedness',
    'Retrained Left-handedness',
    'Bilateral use of both hands',
  ];

  /// Send email to eye analyst
  Future<bool> sendEmail() async {
    try {
      final Email email = Email(
        body: 'Personal Information\n'
            'Name:  ${_nameController.text.trim()}\n'
            'Age:  ${_ageController.text.trim()}\n'
            'Sex:  $_selectGender\n'
            'Laterality:  ${_lateralityEnglish[_lateralityIndex]}\n'
            'Complaints: \n${complaintsController.text.trim()}\n'
            '\nFirst is right eye image and second is left eye image.\n',
        subject: 'Eye Analysis',
        recipients: ['analysis@cnri.edu'],
        attachmentPaths: [rightEyePic!, leftEyePic!],
        isHTML: false,
      );
      await FlutterEmailSender.send(email);
      return true;
    } catch (e) {
      debugPrint('[PersonalInfo] sendEmail failed: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final lateralityList = _getLateralityList(l10n);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                  right: 0,
                  child: Image.asset(Assets.bg1, scale: 5)),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(Assets.bg2, scale: 5)),
              Positioned(
                  bottom: 5,
                  right: 10,
                  child: Image.asset(Assets.bg3, scale: 5)),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateWidth(24)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: getProportionateHeight(78)),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: AppColor.primaryColor,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              l10n.personalInfo,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: AppColor.primaryColor,
                                fontFamily: 'Manrope',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateHeight(36)),

                        // ── Name ──────────────────────────────────────────
                        Text(
                          l10n.nameLabel,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff606060),
                              fontFamily: 'Manrope'),
                        ),
                        SizedBox(height: getProportionateHeight(6)),
                        AppTextField(
                          hint: l10n.enterPersonName,
                          style: const TextStyle(color: AppColor.primaryColor),
                          controller: _nameController,
                          borderColor: AppColor.primaryColor,
                          cursorColor: AppColor.primaryColor,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.pleaseEnterName;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: getProportionateHeight(24)),

                        // ── Age + Laterality ──────────────────────────────
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.ageLabel,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff606060),
                                        fontFamily: 'Manrope'),
                                  ),
                                  SizedBox(height: getProportionateHeight(6)),
                                  AppTextField(
                                    style: const TextStyle(
                                        color: AppColor.primaryColor),
                                    inputType: TextInputType.number,
                                    hint: "23",
                                    borderColor: AppColor.primaryColor,
                                    cursorColor: AppColor.primaryColor,
                                    controller: _ageController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return l10n.pleaseEnterAge;
                                      } else if (value.length > 2) {
                                        return l10n.ageMustBe2Digits;
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.typeLabel,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff606060),
                                        fontFamily: 'Manrope'),
                                  ),
                                  SizedBox(height: getProportionateHeight(6)),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: _focusNode.hasFocus
                                            ? AppColor.primaryColor
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: DropdownButton<int>(
                                      focusNode: _focusNode,
                                      value: _lateralityIndex,
                                      onChanged: (int? newIndex) {
                                        if (newIndex != null) {
                                          setState(() => _lateralityIndex = newIndex);
                                        }
                                      },
                                      isExpanded: true,
                                      underline: Container(),
                                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      items: List.generate(
                                        lateralityList.length,
                                        (i) => DropdownMenuItem<int>(
                                          value: i,
                                          child: Text(
                                            lateralityList[i],
                                            style: const TextStyle(
                                                color: AppColor.primaryColor,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateHeight(24)),

                        // ── Gender ────────────────────────────────────────
                        Text(
                          l10n.gender,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff606060),
                              fontFamily: 'Manrope'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: AppColor.primaryColor,
                                  value: 'Male',
                                  groupValue: _selectGender,
                                  onChanged: (value) {
                                    setState(() => _selectGender = value);
                                  },
                                ),
                                Text(
                                  l10n.male,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff344054),
                                      fontFamily: 'Manrope'),
                                ),
                              ],
                            ),
                            const SizedBox(width: 40),
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: AppColor.primaryColor,
                                  value: 'Female',
                                  groupValue: _selectGender,
                                  onChanged: (value) {
                                    setState(() => _selectGender = value);
                                  },
                                ),
                                Text(
                                  l10n.female,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff344054),
                                      fontFamily: 'Manrope'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateHeight(24)),

                        // ── Main Complaints ───────────────────────────────
                        Row(
                          children: [
                            Text(
                              l10n.mainComplaints,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff606060),
                                  fontFamily: 'Manrope'),
                            ),
                            Text(
                              ' ${l10n.optional}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff248479),
                                  fontFamily: 'Manrope'),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateHeight(6)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: _focus.hasFocus
                                    ? AppColor.primaryColor
                                    : Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width,
                                maxWidth: MediaQuery.of(context).size.width,
                                minHeight: MediaQuery.of(context).size.height * 0.12,
                                maxHeight: MediaQuery.of(context).size.height * 0.2,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: TextField(
                                  cursorColor: AppColor.primaryColor,
                                  focusNode: _focus,
                                  controller: complaintsController,
                                  onChanged: (value) {
                                    complaintsController.text = value;
                                    if (value.startsWith('\n')) {
                                      value = value.substring(1);
                                      complaintsController.text = value;
                                      complaintsController.selection =
                                          TextSelection.fromPosition(
                                        TextPosition(offset: value.length),
                                      );
                                    } else if (value.endsWith('\n\n\n')) {
                                      consecutiveNewlines = true;
                                      if (consecutiveNewlines) {
                                        value = value.substring(0, value.length - 1);
                                        complaintsController.text = value;
                                        complaintsController.selection =
                                            TextSelection.fromPosition(
                                          TextPosition(offset: value.length),
                                        );
                                      } else {
                                        consecutiveNewlines = false;
                                      }
                                    } else {
                                      consecutiveNewlines = false;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: l10n.complaintsHint,
                                      counterText: '',
                                      hintStyle: const TextStyle(color: Colors.grey)),
                                  enabled: true,
                                  autofocus: false,
                                  textCapitalization: TextCapitalization.sentences,
                                  textAlign: TextAlign.left,
                                  maxLines: null,
                                  textInputAction: TextInputAction.newline,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: getProportionateHeight(50)),

                        // ── Submit ────────────────────────────────────────
                        PrimaryButton(
                          splashColor: Colors.transparent,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_selectGender!.isEmpty) {
                                showCustomSnackbar(
                                    title: l10n.error,
                                    message: l10n.pleaseSelectGender,
                                    backgroundColor: Colors.red);
                              } else {
                                final result = await sendEmail();
                                debugPrint('[PersonalInfo] sendEmail result: $result');
                                if (!mounted) return;
                                showDialog(
                                  context: context,
                                  builder: (context) => SuccessDialog(
                                    message: l10n.applicationSubmitted,
                                    onTap: () => Navigator.pop(context),
                                  ),
                                );
                              }
                            }
                          },
                          fillColor: AppColor.primaryColor,
                          height: 60,
                          radius: BorderRadius.circular(20),
                          child: Text(
                            l10n.submit,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'Manrope'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
