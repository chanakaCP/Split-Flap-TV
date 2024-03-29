import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final IconData? leadingIcon;
  final IconData? tailingIcon;
  final Widget? titleWidget;
  final Color leadingColor;
  final Color tailingColor;
  final Color bgColor;
  final Color titleColor;
  final VoidCallback? leadingCallback;
  final VoidCallback? tailingCallback;
  final double height;
  final EdgeInsetsGeometry? padding;

  const CustomAppbar({
    Key? key,
    this.title,
    this.leadingIcon,
    this.tailingIcon,
    this.leadingColor = white,
    this.tailingColor = white,
    this.bgColor = primaryBlackColor,
    this.titleColor = white,
    this.leadingCallback,
    this.tailingCallback,
    this.height = 88,
    this.titleWidget,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: CustomContainer(
        padding: padding ??
            const EdgeInsets.only(left: 19, right: 19, bottom: 12, top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomContainer(
              height: 35,
              width: 35,
              alignment: Alignment.center,
              padding: 6.all,
              child: InkWell(
                onTap: () {
                  if (leadingCallback != null) {
                    leadingCallback!();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Icon(
                  leadingIcon ?? Icons.arrow_back_rounded,
                  color: leadingColor,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: titleWidget ??
                    CustomText(
                      text: title ?? "",
                      textAlign: TextAlign.center,
                      containerAlignment: Alignment.center,
                      textStyle: fontStyle4(),
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
            CustomContainer(
              height: 35,
              width: 35,
              alignment: Alignment.center,
              padding: 6.all,
              child: InkWell(
                onTap: () {
                  if (tailingCallback != null) tailingCallback!();
                },
                child: (tailingIcon != null)
                    ? Icon(
                        tailingIcon!,
                        color: leadingColor,
                      )
                    : const SizedBox(width: 35),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
