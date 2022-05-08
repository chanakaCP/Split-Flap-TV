import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_flap_tv/config/enums/custom_form_field_state.dart';
import 'package:split_flap_tv/config/enums/enums.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? inputType;
  final bool readOnly;
  final Icon? suffixIcon;
  final int? maxLength;
  final String? regX;
  final EdgeInsetsGeometry? margin;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double marginTop;
  final EdgeInsetsGeometry? padding;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double paddingTop;
  final double? height;
  final Alignment alignment;
  final List<TextInputFormatter>? textInputFormatter;
  final Function? onChange;
  final TextCapitalization? textCapitalization;
  final bool obSecureText;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final String? formTitle;
  final bool autocorrect;
  final bool autofocus;
  final FormInputFieldState fieldState;
  final Widget? prefix;
  final Widget? suffix;

  CustomFormField({
    Key? key,
    required this.controller,
    this.readOnly = false,
    this.hintText,
    this.inputType,
    this.maxLength,
    this.regX,
    this.suffixIcon,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.paddingBottom = 0,
    this.paddingTop = 0,
    this.alignment = Alignment.centerLeft,
    this.margin,
    this.padding,
    this.focusNode,
    this.height = 48,
    this.textInputFormatter,
    this.onChange,
    this.textCapitalization,
    this.obSecureText = false,
    this.textStyle,
    this.hintStyle,
    this.formTitle,
    this.autocorrect = false,
    this.autofocus = false,
    this.fieldState = FormInputFieldState.NONE,
    this.prefix,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: transparent,
      margin: margin ??
          EdgeInsets.fromLTRB(
            marginLeft,
            marginTop,
            marginRight,
            marginBottom,
          ),
      padding: padding ??
          EdgeInsets.fromLTRB(
            paddingLeft,
            paddingTop,
            paddingRight,
            paddingBottom,
          ),
      child: Column(
        children: [
          (formTitle != null)
              ? CustomText(
                  text: formTitle!,
                  textStyle: fontStyle1(),
                  marginBottom: 8,
                )
              : const SizedBox(height: 0, width: 0),
          Container(
            color: transparent,
            height: height!,
            alignment: alignment,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    focusNode: focusNode,
                    obscureText: obSecureText,
                    keyboardType: inputType ?? TextInputType.text,
                    textCapitalization:
                        textCapitalization ?? TextCapitalization.none,
                    style: textStyle ?? fontStyle3(),
                    autocorrect: autocorrect,
                    autofocus: autofocus,
                    maxLength: maxLength,
                    readOnly: readOnly,
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      prefix: prefix,
                      suffix: suffix,
                      hintText: hintText ?? "Input here...",
                      hintStyle:
                          hintStyle ?? fontStyle3(fontColor: hintTextColor),
                      filled: true,
                      fillColor: (fieldState == FormInputFieldState.ERROR)
                          ? white
                          : primaryBlackColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: (fieldState == FormInputFieldState.ERROR)
                                ? primaryRedColor
                                : primaryBlackColor,
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: (fieldState == FormInputFieldState.ERROR)
                                ? primaryRedColor
                                : primaryBlackColor,
                            width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: (fieldState == FormInputFieldState.ERROR)
                                ? primaryRedColor
                                : primaryBlackColor,
                            width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: (fieldState == FormInputFieldState.ERROR)
                                ? primaryRedColor
                                : primaryBlackColor,
                            width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: (fieldState == FormInputFieldState.ERROR)
                                ? primaryRedColor
                                : primaryBlackColor,
                            width: 1),
                      ),
                    ),
                    onChanged: (value) {
                      if (onChange != null) {
                        onChange!(value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
