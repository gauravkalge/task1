import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:task1/utils/routes.dart';
import 'package:task1/widgets/botton_widget.dart';
import 'package:task1/widgets/widgets.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String name, email, phone;
  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Form(
                key: signupformKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Company Name',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      //autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'xyz abcd',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      validator: RequiredValidator(
                          errorText: 'This field can\'t be null'),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                    ),
                    const Text(
                      'Email Id',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'name@example.com',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      validator: MultiValidator([
                        EmailValidator(errorText: 'enter proper mail address'),
                        RequiredValidator(
                            errorText: 'This field can\'t be null')
                      ]),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                    ),
                    const Text(
                      'Mobile No',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: '90*********',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      validator: MultiValidator([
                        RangeValidator(
                            min: 10,
                            max: 10,
                            errorText: 'mobile number should be 10 digits')
                      ]),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      controller: password,
                      validator: MultiValidator([
                        RequiredValidator(errorText: "enter valid password"),
                        PatternValidator(
                            '^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}',
                            errorText:
                                'Minimum eight characters, at least one letter and one number')
                      ]),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        // errorText: 'Password is wrong',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                    const Text(
                      'Confirm Password',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      controller: confirmpassword,
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
                      decoration: InputDecoration(
                        hintText: 'Password',
                        // errorText: 'Password is wrong',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                    Row(
                      children: [
                        Material(
                          child: Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                        const Text(
                          'I have read and accept terms \nand conditions',
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                    Center(child: buildButton(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("I have an accont?"),
                        InkWell(
                          child: Text('login'),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MyRoutes.loginRoute,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildButton(context) => ButtonWidget(
      text: 'SIGNUP',
      onClicked: () {
        final form = signupformKey.currentState!;
        Navigator.pushNamed(
          context,
          MyRoutes.loginRoute,
        );

        if (form.validate()) {
          final email = emailController.text;

          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(const SnackBar(
              content: Text('proccessing your data'),
            ));
        }
      },
    );
