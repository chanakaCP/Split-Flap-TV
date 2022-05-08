import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/consts/consts.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/images/custom_image.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomContainer(
        alignment: Alignment.center,
        margin: defaultHorizontalMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              imagePath: logoImage,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width - 75,
            ),
            CustomText(
              text: "Split-Flap TV",
              textStyle: fontStyle1(),
              marginTop: 6,
              containerAlignment: Alignment.center,
            ),
            CustomButton(
              text: "Login",
              marginTop: 60,
              onPressed: () {
                Navigator.of(context).pushNamed("/SignInScreen");
              },
            ),
            CustomButton.outline(
              text: "Signup",
              marginTop: 16,
              onPressed: () {
                Navigator.of(context).pushNamed("/SignUpScreen");
              },
            ),
          ],
        ),
      ),
    );
  }
}
