import 'package:flutter/material.dart';
import 'package:task1/utils/routes.dart';
import 'package:task1/widgets/botton_widget.dart';
import 'package:task1/widgets/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HoamepageState createState() => _HoamepageState();
}

class _HoamepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appname(),
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Text('Welcome to Takmeco'),
          buildButton(context, 'LOGOUT')
        ]),
      ),
    );
  }
}

Widget buildButton(context, txt) => ButtonWidget(
      text: txt,
      onClicked: () {
        Navigator.popAndPushNamed(
          context,
          MyRoutes.loginRoute,
        );
      },
    );
