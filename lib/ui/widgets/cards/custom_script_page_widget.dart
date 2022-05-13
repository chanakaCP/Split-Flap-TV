import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/consts/consts.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/images/custom_image.dart';

class CustomScriptPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: 16.fullRadius,
      border: Border.all(color: primaryBlackColor, width: 2),
      child: const CustomImage(
        imagePath: tempScript,
        width: 300,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
