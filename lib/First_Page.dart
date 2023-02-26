import 'dart:ui';

import 'package:flutter/material.dart';

import 'Second_Page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://previews.123rf.com/images/vitaliyvill/vitaliyvill1708/vitaliyvill170800030/84722223-cartoon-night-game-background-seamless-background-for-games-mobile-applications-and-computers-vector.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.lighten)),
              ),
            ),
            Column(
              children: [
                Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 60),
                                child: Text(
                                  'Travello',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'Merriweather',
                                  ),
                                ),
                              )),
                          Expanded(
                              child: Container(
                                child: Text(
                                  'Travel with us!',
                                ),
                              )),
                        ],
                      ),
                    )),
                Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Expanded(
                            child: Container(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Email : ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Merriweather',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          suffixIcon:
                                          const Icon(Icons.check_circle)),
                                      obscureText: false,
                                      obscuringCharacter: '*',
                                      controller: namecontroller,
                                      onChanged: (value) {
                                        print(value);
                                        setState(() {});
                                      },
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return 'Please enter email';
                                        }
                                      },
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Password : ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Merriweather',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          suffixIcon:
                                          const Icon(Icons.visibility_off)),
                                      obscureText: true,
                                      //obscuringCharacter: '*',
                                      controller: passwordcontroller,
                                      onChanged: (value) {
                                        print(value);
                                        setState(() {});
                                      },
                                      validator: (value) {
                                        if (value != null &&
                                            value.isEmpty &&
                                            value.length < 5) {
                                          return 'Please enter password';
                                        }
                                      },
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 140, top: 10),
                                        child: Text(
                                          'Forgot password?',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            flex: 6,
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    )),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                "Don't have an account? Sign up",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 60,
                              width: 400,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(8, 120, 111, 0.9),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                          return SecondPage(Name: namecontroller.text);
                                        }));
                                  }
                                },
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Merriweather',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


