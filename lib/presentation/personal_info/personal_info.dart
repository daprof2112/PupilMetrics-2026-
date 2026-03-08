import 'package:ai_eye_capture/constant/assets.dart';
import 'package:ai_eye_capture/constant/color.dart';
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
  bool consecutiveNewlines = false;
  final TextEditingController complaintsController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> lateralitylist = <String>[
    "Right-handed",
    "Left-handed",
    "Partial Left-handedness",
    "Retrained Left-handedness",
    "Bilateral use of both hands"
  ];
  String laterality = "Right-handed";

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
    // _phoneController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  /// send email to eye analyst
  Future<bool> sendEmail() async {
    try {
      final Email sendEmail = Email(
        body: 'Personal Information\n'
            'Name:  ${_nameController.text.trim()}\n'
            'Age:  ${_ageController.text.trim()}\n'
            'Sex:  $_selectGender\n'
            'Laterality:  $laterality\n'
            'Complaints: \n${complaintsController.text.trim()}\n'
            '\nFirst is right eye image and second is left eye image.\n',
        subject: 'Eye Analysis',
        recipients: ['analysis@cnri.edu'],
        // cc: ['example_cc@ex.com'],
        // bcc: ['example_bcc@ex.com'],
        attachmentPaths: [rightEyePic!, leftEyePic!],
        isHTML: false,
      );
      await FlutterEmailSender.send(sendEmail);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(
                    Assets.bg1,
                    scale: 5,
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    Assets.bg2,
                    scale: 5,
                  )),
              Positioned(
                  bottom: 5,
                  right: 10,
                  child: Image.asset(
                    Assets.bg3,
                    scale: 5,
                  )),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateWidth(24)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getProportionateHeight(78),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColor.primaryColor),
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
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Personal Info',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: AppColor.primaryColor,
                                fontFamily: 'Manrope',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateHeight(36),
                        ),
                        const Text(
                          'Name:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff606060),
                              fontFamily: 'Manrope'),
                        ),
                        SizedBox(
                          height: getProportionateHeight(6),
                        ),
                        AppTextField(
                          hint: "Johan Doe",
                          style: const TextStyle(color: AppColor.primaryColor),
                          controller: _nameController,
                          borderColor: AppColor.primaryColor,
                          cursorColor: AppColor.primaryColor,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: getProportionateHeight(24),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Age:',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff606060),
                                      fontFamily: 'Manrope'),
                                ),
                                SizedBox(
                                  height: getProportionateHeight(6),
                                ),
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
                                      return 'Please enter age';
                                    } else if (value.length > 2) {
                                      return 'Age must contain 2 or 1 digit';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Type:',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff606060),
                                      fontFamily: 'Manrope'),
                                ),
                                SizedBox(
                                  height: getProportionateHeight(6),
                                ),
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
                                  child: DropdownButton<String>(
                                    focusNode: _focusNode,
                                    value: laterality,
                                    hint: Text(
                                      laterality,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        // Change the color of the hint text here
                                        fontSize: 14,
                                      ),
                                    ),

                                    onChanged: (String? newValue) {
                                      setState(() {
                                        laterality = newValue!;
                                      });
                                    },
                                    isExpanded: true,
                                    underline: Container(),
                                    // This removes the underline
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    items: lateralitylist
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                              color: AppColor.primaryColor,
                                              fontSize: 12),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            )),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateHeight(24),
                        ),
                        const Text(
                          'Gender:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff606060),
                              fontFamily: 'Manrope'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: AppColor.primaryColor,
                                  value: 'Male',
                                  groupValue: _selectGender,
                                  onChanged: (value) {
                                    print("gggg");
                                    setState(() {
                                      _selectGender = value;
                                    });
                                  },
                                ),
                                const Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff344054),
                                      fontFamily: 'Manrope'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: AppColor.primaryColor,
                                  value: 'Female',
                                  groupValue: _selectGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectGender = value;
                                    });
                                  },
                                ),
                                const Text(
                                  'Female',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff344054),
                                      fontFamily: 'Manrope'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateHeight(24),
                        ),
                        const Row(
                          children: [
                            Text(
                              'Main Complaints',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff606060),
                                  fontFamily: 'Manrope'),
                            ),
                            Text(
                              ' (Optional)',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff248479),
                                  fontFamily: 'Manrope'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateHeight(6),
                        ),
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
                                minHeight:
                                    MediaQuery.of(context).size.height * 0.12,
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextField(
                                  cursorColor: AppColor.primaryColor,
                                  focusNode: _focus,
                                  controller: complaintsController,
                                  onChanged: (value) {
                                    complaintsController.text = value;

                                    // Handle newline behavior:
                                    if (value.startsWith('\n')) {
                                      // Prevent new line at the start
                                      value = value.substring(1);
                                      complaintsController.text = value;
                                      complaintsController.selection =
                                          TextSelection.fromPosition(
                                        TextPosition(offset: value.length),
                                      );
                                    } else if (value.endsWith('\n\n\n')) {
                                      consecutiveNewlines = true;
                                      if (consecutiveNewlines) {
                                        // Prevent moving to the next line for the third and subsequent newlines
                                        value = value.substring(
                                            0, value.length - 1);
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
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter",
                                      counterText: '',
                                      hintStyle: TextStyle(color: Colors.grey)),
                                  enabled: true,
                                  autofocus: false,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  textAlign: TextAlign.left,
                                  maxLines: null,
                                  textInputAction: TextInputAction.newline,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateHeight(50),
                        ),
                        PrimaryButton(
                          splashColor: Colors.transparent,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_selectGender!.isEmpty) {
                                showCustomSnackbar(
                                    title: 'Error',
                                    message: 'Please select gender!',
                                    backgroundColor: Colors.red);
                              } else {
                                try {
                                  final result = await sendEmail();
                                  print("result: $result");
                                  showDialog(
                                    context: context,
                                    builder: (context) => SuccessDialog(
                                      message:
                                          'Your application has been successfully submitted.',
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                } catch (e) {
                                  /// An error occurred while sending the email
                                  print("Failed to send email: $e");
                                }
                              }
                            }
                          },
                          fillColor: AppColor.primaryColor,
                          height: 60,
                          radius: BorderRadius.circular(20),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'Manrope'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
