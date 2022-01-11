import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/utils/routes.dart';
import 'package:task1/widgets/widgets.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
              "welcome to Family !!!",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Text(
              'Register your account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Company Name',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'xyz abcd',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                  ),
                  Text(
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
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                  ),
                  Text(
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
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      // errorText: 'Password is wrong',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.visibility),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                  Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(
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
                      Text(
                        'I have read and accept terms \nand conditions',
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  Center(child: buildbutton(context, 'Sign-Up')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("I have an accont?"),
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
            )
          ],
        ),
      ),
    );
  }
}
