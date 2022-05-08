import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/images/custom_image.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final double? buttonWidth;
  final double buttonHeight;
  final BorderRadius? radius;
  final double borderWidth;
  final Color bgColor;
  final Color? iconColor;
  final Color borderColor;
  final Color contentColor;
  final Color splashColor;
  final Color disableBackgroundColor;
  final Color disableContentColor;
  final Color disableBorderColor;
  final BorderStyle borderStyle;
  final TextStyle? textStyle;
  final String? leadingIcon;
  final String? trailingIcon;
  final String? leftIcon;
  final String? rightIcon;
  final double? contentPadding;
  final bool isDissable;
  final double? iconHeight;
  final double? iconWidth;
  final EdgeInsetsGeometry? margin;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.onLongPress,
    this.marginTop = 0,
    this.marginBottom = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.buttonWidth,
    this.buttonHeight = 48.0,
    this.radius,
    this.textStyle,
    this.leadingIcon,
    this.trailingIcon,
    this.leftIcon,
    this.rightIcon,
    this.contentPadding,
    this.borderStyle = BorderStyle.none,
    this.contentColor = white,
    this.borderWidth = 0,
    this.borderColor = transparent,
    this.bgColor = primaryBlueColor,
    this.splashColor = primaryBlueColor,
    this.disableBackgroundColor = gray100,
    this.disableContentColor = gray200,
    this.disableBorderColor = transparent,
    this.isDissable = false,
    this.iconColor,
    this.iconHeight,
    this.iconWidth,
    this.margin,
  }) : super(key: key);

  const CustomButton.outline({
    Key? key,
    required this.text,
    required this.onPressed,
    this.onLongPress,
    this.marginTop = 0,
    this.marginBottom = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.buttonWidth,
    this.buttonHeight = 48.0,
    this.radius,
    this.textStyle,
    this.leadingIcon,
    this.trailingIcon,
    this.leftIcon,
    this.rightIcon,
    this.contentPadding,
    this.borderStyle = BorderStyle.solid,
    this.contentColor = primaryBlueColor,
    this.borderWidth = 1,
    this.borderColor = primaryBlueColor,
    this.bgColor = transparent,
    this.splashColor = transparent,
    this.disableBackgroundColor = gray100,
    this.disableContentColor = gray200,
    this.disableBorderColor = transparent,
    this.isDissable = false,
    this.iconColor,
    this.iconHeight,
    this.iconWidth,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: margin ??
          EdgeInsets.only(
            left: marginLeft,
            bottom: marginBottom,
            right: marginRight,
            top: marginTop,
          ),
      width: buttonWidth ?? double.infinity,
      height: buttonHeight,
      bgColor: isDissable ? disableBackgroundColor : bgColor,
      border: Border.all(
        width: borderWidth,
        color: isDissable ? disableBorderColor : borderColor,
        style: borderStyle,
      ),
      borderRadius: radius ?? BorderRadius.circular(16),
      child: InkWell(
        borderRadius: radius ?? BorderRadius.circular(16),
        splashColor: splashColor,
        focusColor: splashColor,
        highlightColor: splashColor,
        hoverColor: splashColor,
        onTap: () {
          if (isDissable == false) {
            onPressed();
          }
        },
        onLongPress: () {
          if (onLongPress != null && isDissable == false) {
            onLongPress!();
          }
        },
        child: Stack(
          children: [
            (leadingIcon != null)
                ? Positioned(
                    left: 15,
                    top: 0,
                    bottom: 0,
                    child: CustomImage(
                      imagePath: leadingIcon!,
                      imageWidth: iconWidth ?? 20,
                      imageHeight: iconHeight ?? 20,
                      iconColor:
                          isDissable ? disableContentColor : contentColor,
                    ),
                  )
                : Container(),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (leftIcon != null)
                      ? CustomImage(
                          imagePath: leftIcon!,
                          imageWidth: iconWidth ?? 20,
                          imageHeight: iconHeight ?? 20,
                          marginRight: contentPadding ?? 25,
                          iconColor:
                              isDissable ? disableContentColor : contentColor,
                        )
                      : Container(),
                  Center(
                    child: CustomText(
                      containerAlignment: Alignment.center,
                      text: text,
                      // textStyle: textStyle ??
                      //     ooredooButton_1(
                      //         fontColor: isDissable
                      //             ? disableContentColor
                      //             : contentColor),
                    ),
                  ),
                  (rightIcon != null)
                      ? CustomImage(
                          imagePath: rightIcon!,
                          imageWidth: iconWidth ?? 20,
                          imageHeight: iconHeight ?? 20,
                          marginLeft: contentPadding ?? 25,
                          iconColor:
                              isDissable ? disableContentColor : contentColor,
                        )
                      : Container(),
                ],
              ),
            ),
            (trailingIcon != null)
                ? Positioned(
                    right: 15,
                    top: 0,
                    bottom: 0,
                    child: CustomImage(
                      imagePath: trailingIcon!,
                      imageWidth: iconWidth ?? 20,
                      imageHeight: iconHeight ?? 20,
                      iconColor:
                          isDissable ? disableContentColor : contentColor,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
