import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/screens/scripts/widgets/custom_page_action_widget.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class ScriptDetailsScreen extends StatefulWidget {
  @override
  _ScriptDetailsScreenState createState() => _ScriptDetailsScreenState();
}

class _ScriptDetailsScreenState extends State<ScriptDetailsScreen> {
  //! temp
  List<String> tempPageList = [
    "Page 1",
    "Page 2",
    "Page 3",
    "Page 4",
    "Page 5",
  ];

  @override
  void initState() {
    super.initState();
  }

  onClickAddNewPage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(title: "Scripts Details"),
      bottomSheet: CustomContainer(
        height: 112,
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        bgColor: backgroundColor,
        child: CustomButton.outline(
          text: "Add new Page",
          onPressed: () => onClickAddNewPage(),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: CustomContainer(
          child: Column(
            children: [
              CustomText(
                text: "Scripts Name",
                textStyle: fontStyle1(),
                margin: const EdgeInsets.fromLTRB(16, 32, 16, 8),
              ),
              CustomContainer(
                borderRadius: 8.fullRadius,
                height: 48,
                bgColor: primaryBlackColor,
                padding: 16.all,
                margin: defaultHorizontalMargin,
                child: CustomText(
                  text: "Split-Flap-TV app with 50″ television",
                  textStyle: fontStyle3(),
                ),
              ),
              CustomContainer(
                child: Column(
                  children: tempPageList
                      .map(
                        (page) => CustomPageActionWidget(pageName: page),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
