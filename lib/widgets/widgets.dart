// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/utils/routes.dart';

Widget buildEmail() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        'Email',
        style: TextStyle(fontSize: 16),
      ),
      TextField(
        decoration: InputDecoration(
          hintText: 'name@example.com',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        autofocus: true,
      ),
      Text(
        'Password',
        style: TextStyle(fontSize: 16),
      ),
      TextField(
        decoration: InputDecoration(
          hintText: 'Password',
          // errorText: 'Password is wrong',
          prefixIcon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.visibility),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
      )
    ]),
  );
}

Widget title(context) {
  return Container(
    height: 285,
    child: Stack(
      children: <Widget>[
        Center(
          child: Image.asset(
            'assets/back2.png',
            height: 280,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.center,
          heightFactor: 7.0,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'TACK',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.orange),
                children: [
                  TextSpan(
                    text: 'MECO',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                ]),
          ),
        ),
      ],
    ),
  );
}

Widget appname() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: 'TACK',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.orange),
        children: [
          TextSpan(
            text: 'MECO',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ]),
  );
}

Widget buildbutton(context, name) {
  return ElevatedButton(
    child: Text(
      '$name',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    onPressed: () {},
  );
}

Widget forgotTitle(context) {
  return Container(
    height: 285,
    child: Stack(
      children: <Widget>[
        Center(
          child: Image.asset(
            'assets/forgot.jpg',
            height: 280,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.center,
          heightFactor: 7.0,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'TACK',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.orange),
                children: [
                  TextSpan(
                    text: 'MECO',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                ]),
          ),
        ),
      ],
    ),
  );
}
