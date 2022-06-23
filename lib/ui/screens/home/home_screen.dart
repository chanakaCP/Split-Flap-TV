import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/consts/consts.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/images/custom_image.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  onTapLeadingIcon() {}

  onTapTailingIcon() {}

  onClickCreateScript() {
    Navigator.of(context).pushNamed("/CreateNewScriptScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppbar(
        tailingIcon: Icons.person_outline_rounded,
        leadingIcon: Icons.menu_rounded,
        leadingCallback: () => onTapLeadingIcon(),
        tailingCallback: () => onTapTailingIcon(),
        titleWidget: const CustomImage(
          imagePath: logoImage,
          height: 35,
        ),
      ),
      bottomSheet: CustomContainer(
        height: 112,
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        bgColor: backgroundColor,
        child: CustomButton(
          text: "Create New Scripts",
          onPressed: () => onClickCreateScript(),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: CustomContainer(
          child: Column(
            children: const [
              ListOfDevicesWidget(),
              ListOfScriptsWidget(),
              SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
