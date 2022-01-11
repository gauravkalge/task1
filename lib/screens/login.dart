// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/utils/routes.dart';
import 'package:task1/widgets/botton_widget.dart';
import 'package:task1/widgets/email_field.dart';
import 'package:task1/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final formKey = GlobalKey<FormState>();
final emailController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appname(),
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          title(context),
          const Text(
            "welcome back!!!!",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Text(
            'Please login your account',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  EmailFieldWidget(controller: emailController),
                  const SizedBox(height: 16),
                  buildButton(context),
                  buildNoAccount(context),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget buildButton(context) => ButtonWidget(
      text: 'LOGIN',
      onClicked: () {
        final form = formKey.currentState!;

        if (form.validate()) {
          final email = emailController.text;

          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text('Your email is $email'),
            ));
        }
      },
    );

Widget buildNoAccount(context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?'),
        TextButton(
          child: Text('SIGN UP'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              MyRoutes.signupRoute,
            );
          },
        ),
      ],
    );
