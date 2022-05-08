import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/consts/consts.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/images/custom_image.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class PasswordResetSuccessScreen extends StatefulWidget {
  @override
  _PasswordResetSuccessScreenState createState() =>
      _PasswordResetSuccessScreenState();
}

class _PasswordResetSuccessScreenState
    extends State<PasswordResetSuccessScreen> {
  onTapDone() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        "/LandingScreen", ModalRoute.withName('/LandingScreen'));
    // .pushNamedAndRemoveUntil("/SignInScreen", (route) => false);
  }

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
              imagePath: successIcon,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width - 75,
            ),
            CustomText(
              text: "Congratulations",
              textStyle: fontStyle4(),
              marginTop: 20,
              containerAlignment: Alignment.center,
            ),
            CustomText(
              text: "Your password has been reset successfully",
              textStyle: fontStyle3(),
              marginTop: 8,
              containerAlignment: Alignment.center,
            ),
            CustomButton(
              text: "Done",
              marginTop: 32,
              onPressed: () {
                onTapDone();
              },
            ),
          ],
        ),
      ),
    );
  }
}
