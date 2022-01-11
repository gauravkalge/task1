import 'package:flutter/material.dart';
import 'package:task1/screens/signup.dart';

import 'screens/forgot.dart';
import 'screens/login.dart';
import 'theme/mytheme.dart';
import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      //initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginScreen(),
        MyRoutes.forgotRoute: (context) => ForgotPass(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
        MyRoutes.signupRoute: (context) => Signup()
      },
    );
  }
}
