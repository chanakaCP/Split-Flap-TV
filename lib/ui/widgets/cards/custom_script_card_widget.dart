import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/consts/consts.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/models/script/script.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/images/custom_image.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class CustomScriptCardWidget extends StatelessWidget {
  final Script script;
  final VoidCallback onTapItem;

  const CustomScriptCardWidget({
    Key? key,
    required this.script,
    required this.onTapItem,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: transparent,
      hoverColor: transparent,
      splashColor: transparent,
      highlightColor: transparent,
      child: CustomContainer(
        borderRadius: 16.fullRadius,
        border: Border.all(color: primaryBlackColor, width: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomImage(
              imagePath: tempScript,
              width: 300,
              fit: BoxFit.fitWidth,
            ),
            CustomText(
              text: script.scriptName!,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              textStyle: fontStyle8(),
            ),
          ],
        ),
      ),
      onTap: () => onTapItem(),
    );
  }
}
