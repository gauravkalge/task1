// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/utils/routes.dart';
import 'package:task1/widgets/botton_widget.dart';

import 'package:task1/widgets/widgets.dart';
import 'package:theme_provider/theme_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

late String email;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appname(),
        elevation: 2,
        centerTitle: true,
        actions: const <Widget>[
         CycleThemeIconButton()
        ],
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
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.email, "Email"),
                    validator: (value) {
                      if (value == '') {
                        return 'Please a Enter';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value!)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.lock, "Confirm Password"),
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter password';
                        }
                      },
                    )),
                TextButton(
                  child: Text('Forgot password'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      MyRoutes.forgotRoute,
                    );
                  },
                ),
                buildButton(context),
                buildNoAccount(context),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget buildButton(context) => ButtonWidget(
      text: 'LOGIN',
      onClicked: () {},
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
InputDecoration buildInputDecoration(IconData icons, String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}
