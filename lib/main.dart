import 'package:flutter/material.dart';
import 'package:split_flap_tv/ui/screens/devices/all_devices_screen.dart';
import 'ui/screens/authentication/authentication.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/screens/onboarding/onboarding.dart';
import 'ui/screens/password_reset/password_reset.dart';
import 'ui/screens/scripts/scripts.dart';

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
        "/AllScriptsScreen": (BuildContext c) => AllScriptsScreen(),
        "/AllDevicesScreen": (BuildContext c) => AllDevicesScreen(),
        "/ScriptDetailsScreen": (BuildContext c) => ScriptDetailsScreen(),
        "/CreateNewScriptScreen": (BuildContext c) => CreateNewScriptScreen(),
      },
      initialRoute: "/HomeScreen",
    );
  }
}
