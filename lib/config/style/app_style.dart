// FONT STYLE
import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';

const String robotoFont = 'Roboto';

EdgeInsetsGeometry defaultMargin =
    const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 0);
EdgeInsetsGeometry defaultHorizontalMargin =
    const EdgeInsets.symmetric(horizontal: 16);

TextStyle fontStyle1({Color? fontColor = white}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: fontColor,
      fontFamily: robotoFont,
      height: 21.09 / 18.0,
    );

TextStyle fontStyle2({Color? fontColor = white}) => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: fontColor,
      fontFamily: robotoFont,
      height: 20.0 / 14.0,
    );

TextStyle fontStyle3({Color? fontColor = white}) => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: fontColor,
      fontFamily: robotoFont,
      height: 16.41 / 14.0,
    );

TextStyle fontStyle4({Color? fontColor = white}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22.0,
      color: fontColor,
      fontFamily: robotoFont,
      height: 25.78 / 22.0,
    );

TextStyle fontStyle5({Color? fontColor = primaryBlueColor}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
      color: fontColor,
      fontFamily: robotoFont,
      height: 16.41 / 14.0,
    );

TextStyle fontStyle6({Color? fontColor = primaryBlueColor}) => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24.0,
      color: fontColor,
      fontFamily: robotoFont,
      height: 28.13 / 24.0,
    );

TextStyle fontStyle7({Color? fontColor = white}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: fontColor,
      fontFamily: robotoFont,
      height: 21.09 / 18.0,
    );
TextStyle fontStyle8({Color? fontColor = white}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      color: fontColor,
      fontFamily: robotoFont,
      height: 18.75 / 18.0,
    );
TextStyle fontStyle9({Color? fontColor = white}) => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 10.0,
      color: fontColor,
      fontFamily: robotoFont,
      height: 11.72 / 11.72,
    );
TextStyle fontStyle10({Color? fontColor = white}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10.0,
      color: fontColor,
      fontFamily: robotoFont,
      height: 11.72 / 11.72,
    );

TextStyle customFontStyle(
        {Color? fontColor = white,
        double fontSize = 16,
        double fontHeight = 16,
        FontWeight fontWeight = FontWeight.w500}) =>
    TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
      fontFamily: robotoFont,
      height: fontHeight / fontSize,
    );
