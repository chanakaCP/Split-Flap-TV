import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/form_contents/custom_form_field.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class SendOtpScreen extends StatefulWidget {
  @override
  _SendOtpScreenState createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  TextEditingController _emailController = TextEditingController();

  onTapSend() {
    Navigator.of(context).pushNamed("/VerifyOtpScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(title: "Send OTP "),
      body: CustomContainer(
        margin: defaultMargin,
        child: Column(
          children: [
            CustomText(
              text:
                  "Lost your password? Please enter your email address or phone  number. You will receive a 6 digit code to verify.",
              textStyle: fontStyle2(),
            ),
            CustomFormField(
              formTitle: "Username or Email Address",
              controller: _emailController,
              marginTop: 32,
            ),
            CustomButton(
              text: "Send",
              marginTop: 32,
              onPressed: () {
                onTapSend();
                // Navigator.of(context).pushNamed("/SignInScreen");
              },
            ),
          ],
        ),
      ),
    );
  }
}
