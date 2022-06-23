import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:split_flap_tv/config/extensions/border_radius_ex.dart';
import 'package:split_flap_tv/config/style/app_colors.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';

class ContainerLoading extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius? borderRadius;

  const ContainerLoading({
    Key? key,
    required this.height,
    required this.width,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: primaryBlackColor,
      highlightColor: primaryBlackColor.withOpacity(0.5),
      child: CustomContainer(
        borderRadius: borderRadius ?? 8.fullRadius,
        height: height,
        width: width,
        bgColor: white,
      ),
    );
  }
}
