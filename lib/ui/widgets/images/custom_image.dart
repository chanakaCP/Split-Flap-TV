import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';

enum _ImageType {
  asset,
  network,
}

class CustomImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double marginTop;
  final double? height;
  final double? width;
  final double? imageHeight;
  final double? imageWidth;
  final BoxShape? shape;
  final List<BoxShadow>? boxShadow;
  final Color bgColor;
  final Color? iconColor;
  final _ImageType _imageType;
  final Alignment alignment;
  final Gradient? containerGradient;
  final Gradient? iconGradient;
  final BorderRadius? borderRadius;

  const CustomImage({
    Key? key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.height,
    this.width,
    this.imageHeight,
    this.imageWidth,
    this.shape,
    this.boxShadow,
    this.bgColor = transparent,
    this.iconColor,
    this.alignment = Alignment.center,
    this.containerGradient,
    this.iconGradient,
    this.borderRadius,
  })  : _imageType = _ImageType.asset,
        super(key: key);

  const CustomImage.network({
    Key? key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.height,
    this.width,
    this.shape,
    this.boxShadow,
    this.bgColor = transparent,
    this.iconColor,
    this.imageHeight,
    this.imageWidth,
    this.alignment = Alignment.center,
    this.containerGradient,
    this.iconGradient,
    this.borderRadius,
  })  : _imageType = _ImageType.network,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: height,
      width: width,
      marginLeft: marginLeft,
      marginRight: marginRight,
      marginTop: marginTop,
      marginBottom: marginBottom,
      shape: shape,
      boxShadow: boxShadow,
      bgColor: bgColor,
      alignment: alignment,
      gradient: containerGradient,
      borderRadius: borderRadius,
      child: (_imageType == _ImageType.asset)
          ? Image.asset(
              imagePath,
              fit: fit,
              color: iconColor,
              height: imageHeight,
              width: imageWidth,
            )
          : Stack(
              children: [
                Center(
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: fit,
                    color: iconColor,
                    height: imageHeight,
                    width: imageWidth,
                    placeholder: (context, url) => const SizedBox(
                      child: Center(
                        child: SizedBox(
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: gray100,
                      height: imageHeight,
                      width: imageWidth,
                      child: const SizedBox(
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: black,
                        ),
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
