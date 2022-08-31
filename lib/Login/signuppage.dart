import 'package:flutter/material.dart';
import 'package:ichive_with_firebase/pallete.dart';

class Signuppage extends StatefulWidget {
  @override
  State<Signuppage> createState() => _Signuppage();
}

class _Signuppage extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightblue,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to I-Chive!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(),
                  side: BorderSide(color: Colors.black38),
                  maximumSize: Size(250, 100),
                  padding: EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                ),
                onPressed: () {Navigator.pushNamed(context, '/test');},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign up with ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal),
                    ),
                    Image.asset('assets/google.png', scale: 1.2),
                  ],
                ),
              ),
              SizedBox(height: 7),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(),
                  side: BorderSide(color: Colors.black38),
                  maximumSize: Size(250, 100),
                  padding: EdgeInsetsDirectional.fromSTEB(10, 9, 10, 9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign up with  ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal),
                    ),
                    Image.asset('assets/kakao.png', scale: 1.35),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
