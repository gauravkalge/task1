// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/utils/routes.dart';
import 'package:task1/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appname(),
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            title(context),
            // ignore: prefer_const_constructors
            Text(
              "welcome back!!!!",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Text(
              'Please login your account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildEmail(),
                  InkWell(
                    child: Text(
                      'forgot password ?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MyRoutes.forgotRoute,
                      );
                    },
                  ),
                  buildbutton(context, 'Login'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an accont?"),
                      InkWell(
                        child: Text('Sign-Up'),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MyRoutes.signupRoute,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
