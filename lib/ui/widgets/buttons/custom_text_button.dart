import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/images/custom_image.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final MainAxisAlignment? alignment;
  final Color? backgroundColor;
  final Color fontColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final double? height;
  final TextStyle? textStyle;

  const CustomTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.onLongPress,
    this.alignment,
    this.backgroundColor,
    this.fontColor = primaryBlueColor,
    this.margin,
    this.padding,
    this.marginTop = 0,
    this.marginBottom = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.height,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) onPressed!();
      },
      onLongPress: () {
        if (onLongPress != null) onLongPress!();
      },
      splashColor: transparent,
      highlightColor: transparent,
      child: Container(
        padding: padding ?? const EdgeInsets.all(0),
        alignment: Alignment.center,
        color: backgroundColor,
        height: height,
        margin: margin ??
            EdgeInsets.only(
              left: marginLeft,
              right: marginRight,
              top: marginTop,
              bottom: marginBottom,
            ),
        child: CustomText(
          text: text,
          textStyle: textStyle ?? fontStyle5(fontColor: fontColor),
        ),
      ),
    );
  }
}
