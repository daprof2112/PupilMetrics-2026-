import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.error,
    this.obscureText = false,
    this.obscureTextInitially = false,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.validator,
    this.onTap,
    this.hint,
    this.icon,
    this.maxLines = 1,
    this.minLines = 1,
    this.enabled = true,
    this.initialValue = '',
    this.onChanged,
    this.autoFocus = false,
    this.onSubmitted,
    this.onClear,
    this.inputFormatters = const [],
    this.cursorColor,
    this.prefix,
    this.postfix,
    this.paddingTop = 8,
    this.style,
    this.fillColor = true,
    this.hintStyle,
    this.textFieldHeight,
    this.backgroundColor,
    this.borderRadius,
    this.borderColor,
    this.textAlign,
    this.onEditingComplete,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.onTapOutside,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? error;
  final bool obscureText;
  final bool obscureTextInitially;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validator;
  final Function()? onTap;
  final Widget? icon;
  final Widget? prefix;
  final Widget? postfix;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final String initialValue;
  final ValueChanged<String>? onChanged;
  final bool autoFocus;
  final ValueChanged<String>? onSubmitted;
  final Function()? onClear;
  final List<TextInputFormatter>? inputFormatters;
  final Color? cursorColor;
  final double paddingTop;
  final TextStyle? style;
  final bool fillColor;
  final TextStyle? hintStyle;
  final double? textFieldHeight;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? borderColor;
  final TextAlign? textAlign;
  final void Function()? onEditingComplete;
  final AutovalidateMode autoValidateMode;
  final void Function(PointerDownEvent)? onTapOutside;

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureTextInitially;
  }

  @override
  Widget build(BuildContext context) {
    final prefixIcon = SizedBox(
      width: 64,
      child: Column(
        mainAxisAlignment:
        widget.maxLines > 1 ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.prefix != null) widget.prefix!,
              if (widget.prefix != null)
                const SizedBox(
                  width: 12,
                ),
              if (widget.prefix != null)
                Container(
                  color: widget.fillColor ? Colors.white : const Color(0xffE4E4E4),
                  width: 1,
                  height: 47,
                )
            ],
          )
        ],
      ),
    );
    return Container(
      alignment: Alignment.center,
      height: widget.textFieldHeight,
      child: TextFormField(
        textAlign: widget.textAlign ?? TextAlign.start,
        controller: widget.controller,
        // focusNode: widget.focusNode,
        autofocus: widget.autoFocus,
        initialValue: widget.controller == null ? widget.initialValue : null,
        keyboardType: widget.inputType,
        textInputAction: widget.inputAction,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backgroundColor ?? (Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.transparent,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          // floatingLabelBehavior: FloatingLabelBehavior.never,
          errorText: widget.error,
          errorStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          // labelStyle: AppTextStyle.textLabel,
          hintStyle: widget.hintStyle,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          suffixIcon: widget.postfix != null
              ? GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText; // Toggle the obscure text state
              });
            },
            child: widget.postfix,
          )
              : null,
          prefixIcon: widget.prefix != null ? prefixIcon : null,
          hintText: widget.hint,
        ),
        cursorColor: widget.cursorColor ?? Colors.grey,
        obscureText: _obscureText, // Use the current state of obscure text
        style: widget.style,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly: widget.onTap != null,
        onTap: widget.onTap,
        maxLines: widget.maxLines > 1 ? null : 1,
        minLines: widget.minLines > 1
            ? widget.minLines
            : widget.maxLines > 1
            ? 20
            : 1,
        autocorrect: widget.obscureText || widget.inputType == TextInputType.emailAddress
            ? false
            : true,
        textCapitalization:
        widget.obscureText || widget.inputType == TextInputType.emailAddress
            ? TextCapitalization.none
            : TextCapitalization.words,
        textAlignVertical:
        widget.maxLines > 1 ? TextAlignVertical.top : TextAlignVertical.center,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        onTapOutside: widget.onTapOutside ??
                (event) {
              FocusManager.instance.primaryFocus?.unfocus();
              FocusScope.of(context).unfocus();
              widget.onSubmitted;
            },
        inputFormatters: widget.inputFormatters,
        onEditingComplete: widget.onEditingComplete,
      ),
    );
  }
}


