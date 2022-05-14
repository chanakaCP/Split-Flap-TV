import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/enums/enums.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/form_contents/form_contents.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

import 'widgets.dart';

class ScriptPageWidget extends StatefulWidget {
  final String pageName;
  const ScriptPageWidget({
    Key? key,
    required this.pageName,
  }) : super(key: key);

  @override
  _ScriptPageWidgetState createState() => _ScriptPageWidgetState();
}

class _ScriptPageWidgetState extends State<ScriptPageWidget> {
  PageFormat _selectedPageFormat = PageFormat.LEFT;
  final int _count = 5;
  final List _controlles = [];
  final List _colors = [
    white,
    pageColor1,
    primaryBlueColor,
    hintTextColor,
    pageColor2,
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _count; i++) {
      _controlles.add(TextEditingController());
    }
  }

  onTapChangePageFormat(PageFormat format) {
    setState(() {
      _selectedPageFormat = format;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      marginTop: 32,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: widget.pageName,
                textStyle: fontStyle1(),
              ),
              CustomContainer(
                borderRadius: 100.fullRadius,
                marginRight: 10,
                child: InkWell(
                  borderRadius: 100.fullRadius,
                  child: const Icon(
                    Icons.more_vert_rounded,
                    color: white,
                  ),
                  onTap: () {},
                ),
              )
            ],
          ),
          CustomContainer(
            bgColor: primaryBlackColor,
            borderRadius: 16.fullRadius,
            padding: 16.all,
            marginTop: 12,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        PageFormatIcon(
                          icon: Icons.format_align_left_rounded,
                          isSelected: (_selectedPageFormat == PageFormat.LEFT)
                              ? true
                              : false,
                          onTapIcon: () =>
                              onTapChangePageFormat(PageFormat.LEFT),
                        ),
                        PageFormatIcon(
                          icon: Icons.format_align_center_rounded,
                          isSelected: (_selectedPageFormat == PageFormat.CENTER)
                              ? true
                              : false,
                          onTapIcon: () =>
                              onTapChangePageFormat(PageFormat.CENTER),
                        ),
                        PageFormatIcon(
                          icon: Icons.format_align_right_rounded,
                          isSelected: (_selectedPageFormat == PageFormat.RIGHT)
                              ? true
                              : false,
                          onTapIcon: () =>
                              onTapChangePageFormat(PageFormat.RIGHT),
                        ),
                        PageFormatIcon(
                          icon: Icons.format_align_justify_rounded,
                          isSelected:
                              (_selectedPageFormat == PageFormat.JUSTIFY)
                                  ? true
                                  : false,
                          onTapIcon: () =>
                              onTapChangePageFormat(PageFormat.JUSTIFY),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: "Duration",
                          textStyle: fontStyle5(fontColor: white),
                        ),
                        CustomContainer(
                          border: Border.all(color: borderColor),
                          borderRadius: 50.fullRadius,
                          marginLeft: 7,
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 12),
                          child: Row(
                            children: [
                              CustomText(
                                text: "60",
                                textStyle: fontStyle10(),
                              ),
                              CustomText(
                                text: " sec",
                                textStyle: fontStyle9(fontColor: borderColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                CustomContainer(
                  marginTop: 12,
                  child: Column(
                    children: [
                      for (var i = 0; i < _count; i++)
                        ScriptPageInputFiled(
                          controller: _controlles[i],
                          index: i + 1,
                          contentColor: _colors[(_colors.length) % (i + 1)],
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
