import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/consts/consts.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/images/custom_image.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class CustomScriptCardWidget extends StatelessWidget {
  final String title;

  const CustomScriptCardWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: 16.fullRadius,
      border: Border.all(color: primaryBlackColor, width: 2),
      child: Column(
        children: [
          const CustomImage(
            imagePath: tempScript,
            width: 300,
            fit: BoxFit.fitWidth,
          ),
          CustomText(
            text: title,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            textStyle: fontStyle8(),
          ),
        ],
      ),
    );
  }
}
