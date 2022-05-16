import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_text_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/form_contents/custom_form_field.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  onTapLogin() {
    Navigator.of(context).pushReplacementNamed('/SignInScreen');
  }

  onTapSignUp() {
    Navigator.of(context).pushNamed("/SendOtpScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(title: "Signup"),
      body: SingleChildScrollView(
        child: CustomContainer(
          margin: defaultMargin,
          child: Column(
            children: [
              CustomFormField(
                controller: _fullNameController,
                formTitle: "Full Name",
              ),
              CustomFormField(
                controller: _usernameController,
                formTitle: "Username",
                marginTop: 32,
              ),
              CustomFormField(
                controller: _emailController,
                formTitle: "Email / Phone Number",
                marginTop: 32,
              ),
              CustomFormField(
                controller: _passwordController,
                formTitle: "Password",
                marginTop: 32,
              ),
              CustomFormField(
                controller: _confirmPasswordController,
                formTitle: "Confirm Password",
                marginTop: 32,
              ),
              CustomButton(
                text: "Signup",
                marginTop: 35,
                onPressed: () {
                  onTapSignUp();
                },
              ),
              CustomContainer(
                marginTop: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(text: "Already have an account?\t\t"),
                    CustomTextButton(
                      text: "Login",
                      onPressed: () {
                        onTapLogin();
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
