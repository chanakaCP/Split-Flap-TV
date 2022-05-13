import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/cards/custom_script_card_widget.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class AllDevicesScreen extends StatefulWidget {
  @override
  State<AllDevicesScreen> createState() => _AllDevicesScreenState();
}

class _AllDevicesScreenState extends State<AllDevicesScreen> {
  //!temp
  final List<String> tempDeviceList = [
    "Split-Flap-TV app with 50″ television",
    "Split-Flap-TV app with 60″ television",
    "Split-Flap-TV app with 70″ television",
    "Split-Flap-TV app with 80″ television",
    "Split-Flap-TV app with 90″ television",
    "Split-Flap-TV app with 100″ television",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(title: "See All Devices"),
      body: SingleChildScrollView(
        child: CustomContainer(
          margin: defaultMargin,
          child: Column(
            children: [
              CustomText(
                text: "List of Devices",
                textStyle: fontStyle7(),
                marginBottom: 16,
              ),
              for (var device in tempDeviceList)
                CustomContainer(
                  marginBottom: 16,
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
      ),
    );
  }
}
