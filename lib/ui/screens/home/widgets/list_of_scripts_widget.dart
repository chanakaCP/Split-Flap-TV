import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_text_button.dart';
import 'package:split_flap_tv/ui/widgets/cards/custom_script_card_widget.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class ListOfScriptsWidget extends StatelessWidget {
  final List scriptList;

  const ListOfScriptsWidget({
    Key? key,
    required this.scriptList,
  }) : super(key: key);

  onTapSeeMore(BuildContext context) {
    Navigator.of(context).pushNamed("/AllScriptsScreen");
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      marginTop: 32,
      child: Column(
        children: [
          CustomContainer(
            margin: defaultHorizontalMargin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "List of Scripts",
                  textStyle: fontStyle1(),
                ),
                CustomTextButton(
                  text: "See All",
                  onPressed: () => onTapSeeMore(context),
                )
              ],
            ),
          ),
          CustomContainer(
            height: 235,
            marginTop: 12,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 16),
                for (var script in scriptList)
                  CustomContainer(
                    marginRight: 16,
                    child: CustomScriptCardWidget(
                      title: script,
                      onTapItem: () {
                        Navigator.of(context).pushNamed("/ScriptDetailsScreen");
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
