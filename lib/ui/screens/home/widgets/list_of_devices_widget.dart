import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_text_button.dart';
import 'package:split_flap_tv/ui/widgets/cards/custom_script_card_widget.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class ListOfDevicesWidget extends StatelessWidget {
  final List deviceList;

  const ListOfDevicesWidget({
    Key? key,
    required this.deviceList,
  }) : super(key: key);

  onTapSeeMore(BuildContext context) {
    Navigator.of(context).pushNamed("/AllDevicesScreen");
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
                  text: "List of Devices",
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
                for (var device in deviceList)
                  CustomContainer(
                    marginRight: 16,
                    child: CustomScriptCardWidget(
                      title: device,
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
