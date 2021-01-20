import 'package:char_app/constrants.dart';
import 'package:char_app/screens/chat_screen.dart';
import 'package:char_app/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:char_app/components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String animationType = 'idle';
  String pass, email;
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();

  @override
  void initState() {
    passwordFocus.addListener(() {
      if (passwordFocus.hasFocus) {
        setState(() {
          animationType = 'test';
        });
      } else {
        setState(() {
          animationType = 'idle';
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: 250,
                child: ClipOval(
                  child: FlareActor(
                    'assets/Teddy.flr',
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: animationType,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFD0D3D4),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFB3B6B7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              decoration: cTextFieldDecoration,
                              onChanged: (value) {
                                email = value;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFB3B6B7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              onChanged: (value) {
                                pass = value;
                              },
                              obscureText: true,
                              controller: passwordController,
                              focusNode: passwordFocus,
                              decoration: cTextFieldDecoration.copyWith(
                                  hintText: 'Password..'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: pass);

                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                      setState(() {
                        animationType = 'success';
                      });
                    } else {
                      setState(() {
                        animationType = 'fail';
                      });
                    }
                  } catch (e) {
                    print(e);
                  }

                  // if (passwordController.text.compareTo(pass) == 0) {
                  //   setState(() {
                  //     animationType = 'success';
                  //   });
                  // } else {
                  //   setState(() {
                  //     animationType = 'fail';
                  //   });
                  // }
                },
                child: RoundedButton(
                  title: 'Log in',
                  textColor: cLoginTextColor,
                  buttonColor: cLoginButtonColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 2, top: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  child: Text(
                    'not have an account?',
                    style: TextStyle(color: Color(0xFFECF0F1)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
