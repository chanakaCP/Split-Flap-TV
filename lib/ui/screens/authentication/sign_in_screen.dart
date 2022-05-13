import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_text_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/form_contents/custom_form_field.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _rememberMe = false;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  onTapRememberMe() {
    setState(() {
      _rememberMe = !_rememberMe;
    });
  }

  onTapLostYourPassword() {
    Navigator.of(context).pushNamed("/PasswordResetScreen");
  }

  onTapSignUp() {
    Navigator.of(context).pushReplacementNamed('/SignUpScreen');
  }

  onTapLogin() {
    Navigator.of(context).pushNamed("/HomeScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(title: "Login"),
      body: CustomContainer(
        margin: defaultMargin,
        child: Column(
          children: [
            CustomFormField(
              controller: _usernameController,
              formTitle: "Username or Email Address",
            ),
            CustomFormField(
              controller: _passwordController,
              formTitle: "Password",
              marginTop: 32,
            ),
            CustomContainer(
              marginTop: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: CustomContainer(
                          height: 20,
                          width: 20,
                          bgColor: transparent,
                          border:
                              Border.all(color: primaryBlueColor, width: 1.5),
                          borderRadius: 6.fullRadius,
                          child: Icon(
                            Icons.check,
                            color: _rememberMe ? primaryBlueColor : transparent,
                            size: 15,
                          ),
                        ),
                        onTap: () {
                          onTapRememberMe();
                        },
                      ),
                      const CustomText(
                        text: "Remember me",
                        marginLeft: 10,
                      )
                    ],
                  ),
                  CustomTextButton(
                    text: "Lost your password?",
                    fontColor: primaryRedColor,
                    onPressed: () {
                      onTapLostYourPassword();
                    },
                  )
                ],
              ),
            ),
            CustomButton(
              text: "Login",
              marginTop: 35,
              onPressed: () {
                onTapLogin();
              },
            ),
            CustomContainer(
              marginTop: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text: "Haven’t any account?\t\t"),
                  CustomTextButton(
                    text: "Signup",
                    onPressed: () {
                      onTapSignUp();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
