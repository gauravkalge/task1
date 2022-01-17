import 'package:flutter/material.dart';
import 'package:task1/screens/homepage.dart';
import 'package:task1/screens/signup.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:flutter/scheduler.dart';
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
    return ThemeProvider(
      saveThemesOnChange: true, // Auto save any theme change we do
      loadThemeOnInit:
          false, // Do not load the saved theme(use onInitCallback callback)
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;

        if (savedTheme != null) {
          // If previous theme saved, use saved theme
          controller.setTheme(savedTheme);
        } else {
          // If previous theme not found, use platform default
          Brightness platformBrightness =
              SchedulerBinding.instance!.window.platformBrightness;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('dark');
          } else {
            controller.setTheme('light');
          }
          // Forget the saved theme(which were saved just now by previous lines)
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
