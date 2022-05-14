import 'package:flutter/material.dart';

import 'package:split_flap_tv/config/extensions/border_radius_ex.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';

class PageFormatIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTapIcon;

  const PageFormatIcon({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onTapIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: 100.fullRadius,
      marginRight: 10,
      child: InkWell(
        borderRadius: 100.fullRadius,
        child: Icon(
          icon,
          color: (isSelected) ? white : hintTextColor,
        ),
        onTap: () => onTapIcon(),
      ),
    );
  }
}
