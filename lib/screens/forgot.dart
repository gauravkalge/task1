import 'package:flutter/material.dart';
import 'package:task1/utils/routes.dart';
import 'package:task1/widgets/botton_widget.dart';
import 'package:task1/widgets/widgets.dart';
import 'package:theme_provider/theme_provider.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

late String email;

class _ForgotPassState extends State<ForgotPass> {
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
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.blue[200],
                radius: 80,
                child: const Text(
                  'TACKMECO',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            const Text(
              "Forgot Password  !!!!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
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
                  buildButton(context),
                  buildNoAccount(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildButton(context) => ButtonWidget(
      text: 'Send OTP',
      onClicked: () {},
    );

Widget buildNoAccount(context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don you remember password !'),
        TextButton(
          child: Text('LOGIN'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              MyRoutes.loginRoute,
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
