import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task1/screens/homepage.dart';
import 'package:task1/screens/signup.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:flutter/scheduler.dart';
import 'screens/forgot.dart';
import 'screens/login.dart';
import 'theme/mytheme.dart';
import 'utils/routes.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;

        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness =
              SchedulerBinding.instance!.window.platformBrightness;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('dark');
          } else {
            controller.setTheme('light');
          }

          controller.forgetSavedTheme();
        }
      },
      themes: <AppTheme>[
        AppTheme.light(id: 'light'),
        AppTheme.dark(id: 'dark'),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            // themeMode: ThemeMode.system,
            // theme: MyTheme.lightTheme(context),
            //darkTheme: MyTheme.darkTheme(context),
            debugShowCheckedModeBanner: false,
            //initialRoute: MyRoutes.loginRoute,
            routes: {
              "/": (context) => LoginScreen(),
              MyRoutes.forgotRoute: (context) => const ForgotPass(),
              MyRoutes.loginRoute: (context) => LoginScreen(),
              MyRoutes.signupRoute: (context) => const Signup(),
              MyRoutes.homeRoute: (context) => const Homepage(),
            },
          ),
        ),
      ),
    );
  }
}
