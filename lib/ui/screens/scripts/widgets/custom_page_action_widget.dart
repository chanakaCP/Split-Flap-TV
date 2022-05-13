import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/extensions/border_radius_ex.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/cards/custom_script_page_widget.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class CustomPageActionWidget extends StatelessWidget {
  final String pageName;
  const CustomPageActionWidget({
    Key? key,
    required this.pageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      marginTop: 25,
      child: Column(
        children: [
          CustomContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: pageName,
                  textStyle: fontStyle1(),
                  marginLeft: 16,
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
          ),
          CustomContainer(
            height: 180,
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: CustomScriptPageWidget(),
          ),
        ],
      ),
    );
  }
}
