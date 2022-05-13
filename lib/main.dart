import 'package:flutter/material.dart';

import 'ui/screens/authentication/authentication.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/screens/onboarding/onboarding.dart';
import 'ui/screens/password_reset/password_reset.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split-Flap TV',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/SplashScreen": (BuildContext c) => SplashScreen(),
        "/LandingScreen": (BuildContext c) => LandingScreen(),
        "/SignInScreen": (BuildContext c) => SignInScreen(),
        "/SignUpScreen": (BuildContext c) => SignUpScreen(),
        "/SendOtpScreen": (BuildContext c) => SendOtpScreen(),
        "/VerifyOtpScreen": (BuildContext c) => VerifyOtpScreen(),
        "/PasswordResetScreen": (BuildContext c) => PasswordResetScreen(),
        "/PasswordResetSuccessScreen": (BuildContext c) =>
            PasswordResetSuccessScreen(),
        "/HomeScreen": (BuildContext c) => HomeScreen(),
      },
      initialRoute: "/HomeScreen",
    );
  }
}
