import 'package:be_active/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:be_active/core/themes/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class CustomTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final MaskTextInputFormatter? inputFormatter;
  final String hintText;
  final FormFieldValidator? validator;
  final GlobalKey<FormState> formKey;
  final List<TextInputFormatter> formatters;
  final bool isPassword;
  final TextInputType inputType;
  final bool isOnlyReady;
  final Widget? suffix;
  final Widget? prefix;
  final EdgeInsetsGeometry? padding;
  final int maxLines;
  final bool isAfutoFocus;
  final bool showCheckIcom;
  final bool isClearIcon;
  final Function(String value)? onChanges;
  final int lengthForChek;
  const CustomTextField(
      {Key? key,
      this.title = '',
      required this.controller,
      this.inputFormatter,
      required this.hintText,
      required this.validator,
      required this.formKey,
      required this.formatters,
      this.padding,
      this.prefix,
      this.onChanges,
      this.isPassword = false,
      this.inputType = TextInputType.text,
      this.isOnlyReady = false,
      this.suffix,
      this.isAfutoFocus = false,
      this.showCheckIcom = false,
      this.isClearIcon = false,
      this.lengthForChek = 1,
      this.maxLines = 1})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _textFieldFocus = FocusNode();
  bool _obscureText = true;
  bool isError = false;
  bool isShowCheckIcon = false;

  void _toggle() {
    setState(
      () {
        _obscureText = !_obscureText;
      },
    );
  }

  @override
  void initState() {
    isShowCheckIcon = widget.controller.text.isNotEmpty;
    if (!widget.isPassword) {
      _obscureText = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.title,
              style: textStyleSe15We700.copyWith(
                
              ),
            ),
          ),
        Form(
          key: widget.formKey,
          child: TextFormField(
            onChanged: ((value) {
              if (widget.onChanges != null) {
                widget.onChanges!(value);
              }
              setState(() {
                isShowCheckIcon =
                    value.isNotEmpty && widget.lengthForChek <= value.length;
              });
            }),
            autofocus: widget.isAfutoFocus,
            maxLines: widget.maxLines,
            obscureText: _obscureText,
            keyboardType: widget.inputType,
            inputFormatters: widget.formatters,
            controller: widget.controller,
            validator: widget.validator,
            scrollPadding: EdgeInsets.zero,
            focusNode: _textFieldFocus,
            style: textStyleSe16We600,
            readOnly: widget.isOnlyReady,
            decoration: InputDecoration(
              prefixIcon: widget.prefix,
              suffixIcon: getSuffixIcon(),
              contentPadding: widget.padding ??
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              hintText: widget.hintText,
              hintStyle: textStyleSe12We700.copyWith(
                  color: kBlack.withOpacity(0.4)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kBlack.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kBlack.withOpacity(0.4),
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:  const BorderSide(
                  color: redErrorColor,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:  const BorderSide(
                  color: redErrorColor,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusColor: kBlack.withOpacity(0.1),
              filled: true,
              fillColor: kWhiteColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget getSuffixIcon() {
    // if (widget.showCheckIcom && isShowCheckIcon) {
    //   return SizedBox(
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: SvgPicture.asset(checkIcon),
    //     ),
    //   );
    // }
    // if (widget.isClearIcon && isShowCheckIcon) {
    //   return Padding(
    //     padding: const EdgeInsets.all(12.0),
    //     child: InkWell(
    //       onTap: () {
    //         setState(() {
    //           widget.controller.clear();
    //           isShowCheckIcon = false;
    //           if (widget.onChanges != null) {
    //             widget.onChanges!('');
    //           }
    //         });
    //       },
    //       child: SvgPicture.asset(closeIcon),
    //     ),
    //   );
    // }
    return widget.isPassword
        ? IconButton(
            color: Colors.grey,
            onPressed: _toggle,
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
          )
        : widget.suffix ?? const SizedBox();
  }
}
