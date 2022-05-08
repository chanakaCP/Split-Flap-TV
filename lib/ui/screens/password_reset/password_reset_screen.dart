import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/form_contents/custom_form_field.dart';

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  onTapSave() {
    Navigator.pushNamedAndRemoveUntil(
        context, '/PasswordResetSuccessScreen', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(title: "Input New Password"),
      body: CustomContainer(
        margin: defaultMargin,
        child: Column(
          children: [
            CustomFormField(
              controller: _passwordController,
              formTitle: "Password",
            ),
            CustomFormField(
              controller: _confirmPasswordController,
              formTitle: "Confirm Password",
              marginTop: 32,
            ),
            CustomButton(
              text: "Save",
              marginTop: 32,
              onPressed: () {
                onTapSave();
              },
            ),
          ],
        ),
      ),
    );
  }
}
