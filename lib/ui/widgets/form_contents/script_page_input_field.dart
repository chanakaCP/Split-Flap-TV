import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/extensions/border_radius_ex.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class ScriptPageInputFiled extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLength;
  final Color contentColor;
  final int index;

  const ScriptPageInputFiled({
    Key? key,
    required this.controller,
    required this.index,
    this.contentColor = white,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: transparent,
      margin: const EdgeInsets.only(top: 12),
      height: 32,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: fontStyle9(fontColor: contentColor),
              maxLength: maxLength,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                filled: true,
                fillColor: transparent,
                hintText: "Write here...",
                hintStyle: fontStyle9(fontColor: borderColor),
                prefixIcon: SizedBox(
                  width: (index >= 100)
                      ? 65
                      : (index >= 10)
                          ? 55
                          : 40,
                  child: Row(
                    children: [
                      CustomText(
                        text: index.toString(),
                        textStyle: fontStyle5(fontColor: white),
                        marginLeft: 12,
                      ),
                      CustomContainer(
                        height: 12,
                        width: 12,
                        bgColor: white,
                        marginLeft: 8,
                        borderRadius: 100.fullRadius,
                      )
                    ],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: contentColor, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: contentColor, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: contentColor, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: contentColor, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: contentColor, width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
