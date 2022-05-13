import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_text_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  onTapVerify() {
    Navigator.of(context).pushNamed("/HomeScreen");
  }

  onChangePin(String value) {}
  onTapResendOtp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(title: "Input OTP"),
      body: CustomContainer(
        margin: defaultMargin,
        child: Column(
          children: [
            CustomText(
              text: "Enter the OTP sent to +00-000000000",
              containerAlignment: Alignment.center,
              textStyle: fontStyle2(),
            ),
            CustomContainer(
              marginTop: 60,
              child: PinCodeTextField(
                hintCharacter: '',
                length: 4,
                appContext: context,
                mainAxisAlignment: MainAxisAlignment.center,
                cursorHeight: 25,
                cursorWidth: 2,
                enablePinAutofill: true,
                autoDismissKeyboard: false,
                autoFocus: false,
                obscureText: false,
                animationType: AnimationType.fade,
                cursorColor: primaryBlueColor,
                animationDuration: const Duration(milliseconds: 300),
                textStyle: fontStyle6(),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  fieldOuterPadding: const EdgeInsets.only(right: 16),
                  shape: PinCodeFieldShape.box,
                  borderWidth: 1,
                  borderRadius: 8.fullRadius,
                  fieldHeight: 48,
                  fieldWidth: 48,
                  inactiveColor: primaryBlackColor,
                  selectedColor: primaryBlackColor,
                  activeColor: primaryBlackColor,
                  inactiveFillColor: primaryBlackColor,
                  selectedFillColor: primaryBlackColor,
                  activeFillColor: primaryBlackColor,
                ),
                onChanged: (value) {
                  onChangePin(value);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(text: "Don’t receive the OTP?\t\t"),
                CustomTextButton(
                  text: "Resend OTP",
                  onPressed: () {
                    onTapResendOtp();
                  },
                )
              ],
            ),
            CustomButton(
              text: "Verify",
              marginTop: 60,
              onPressed: () {
                onTapVerify();
              },
            ),
          ],
        ),
      ),
    );
  }
}
