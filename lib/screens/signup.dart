import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/utils/routes.dart';
import 'package:task1/widgets/botton_widget.dart';
import 'package:task1/widgets/widgets.dart';
import 'package:theme_provider/theme_provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

bool agree = false;

// This function is triggered when the button is clicked
void _doSomething() {
  // Do something
}
late String name, email, phone;
//TextController to read text entered in text field
TextEditingController password = TextEditingController();
TextEditingController confirmpassword = TextEditingController();
final GlobalKey<FormState> formkey = GlobalKey<FormState>();

class _SignupState extends State<Signup> {
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
        child: Form(
          key: formkey,
          child: Column(
            children: [
              title(context),
              const Text(
                "welcome to Family !!!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const Text(
                'Register your account',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration:
                            buildInputDecoration(Icons.person, "Company Name"),
                        validator: (value) {
                          if (value == '') {
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name = value!;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
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
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            buildInputDecoration(Icons.phone, "Phone No"),
                        validator: (value) {
                          if (value == '') {
                            return 'Please enter phone no ';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   phone = value!;
                        // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        controller: password,
                        keyboardType: TextInputType.text,
                        decoration:
                            buildInputDecoration(Icons.lock, "Password"),
                        obscureText: true,
                        validator: (value) {
                          if (value == '') {
                            return 'Please a Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        child: TextFormField(
                          controller: confirmpassword,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: buildInputDecoration(
                              Icons.lock, "Confirm Password"),
                          validator: (value) {
                            if (value == '') {
                              return 'Please re-enter password';
                            }
                            print(password.text);
                            print(confirmpassword.text);
                            if (password.text != confirmpassword.text) {
                              return "Password does not match";
                            }
                            return null;
                          },
                        )),
                    Column(children: [
                      Row(
                        children: [
                          Material(
                            child: Checkbox(
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = value ?? false;
                                });
                              },
                            ),
                          ),
                          const Text(
                            'I have read and accept terms\n and conditions',
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: agree ? _doSomething : null,
                        child: buildButton(context),
                      ),
                    ]),
                    buildNoAccount(context)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildButton(context) => ButtonWidget(
      text: 'SIGNUP',
      onClicked: () {
        final form = formkey.currentState!;

        if (form.validate()) {
          if (form.validate() && agree == true) {
            Navigator.popAndPushNamed(
              context,
              MyRoutes.loginRoute,
            );
            password.text = '';
            confirmpassword.text = '';
            print("successful");
            return;
          } else {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Warning"),
                content: Text("please Select the terms and condition"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("okay"),
                  ),
                ],
              ),
            );
            print("UnSuccessfull");
          }
        }
      },
    );

InputDecoration buildInputDecoration(IconData icons, String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}

Widget buildNoAccount(context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Do you have an account?'),
        TextButton(
          child: Text('LOGIN'),
          onPressed: () {
            Navigator.popAndPushNamed(
              context,
              MyRoutes.loginRoute,
            );
          },
        ),
      ],
    );
