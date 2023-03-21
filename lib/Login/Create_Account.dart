
import 'dart:math';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langah_app/Home/homepage.dart';

import 'emailverfication.dart';
import 'loginpage.dart';

class CreateAccount extends StatefulWidget {


  const CreateAccount({Key? key, }) : super(key: key);
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  final _formKey = GlobalKey<FormState>();
  var firebase_auth = FirebaseAuth.instance;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _obscureText1 = true;
  String _email = '';

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Text(
                          'Create New Account ',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),

                      SizedBox(
                        height: 50,
                      ),
                      Text("Name",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child:
                        TextFormField(
                          controller: name,
                          keyboardType: TextInputType.number,
                          //textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            filled: true, fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter name';
                            }


                            return null;
                          },

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Email",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,

                          ),
                        ),
                        child:
                        TextFormField(
                          controller: email,
                          keyboardType: TextInputType.number,
                          //textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '**********@gmail.com',
                            filled: true, fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an email';
                            }
                            if (!RegExp(
                                "(^[a-zA-Z0-9_\\-\\.]+[@][a-z]+[\\.][a-z]{3}\$)",
                                caseSensitive: false).hasMatch(value)) {
                              return 'Email must be valid';
                            }

                            return null;
                          },

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Password",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child:
                        TextFormField(
                          controller: password,
                          obscureText: _obscureText1,
                          keyboardType: TextInputType.number,
                          //textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '**********',
                            filled: true, fillColor: Colors.white,
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText1 ? Icons.visibility_off : Icons
                                    .visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            if (value.length< 8) {
                              return 'Password must be at least 8 characters.';
                            }
                            /* if (!RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)", caseSensitive: false).hasMatch(value)) {
                                  return 'Password should contain Capital, small letter, Number & Special character';
                                }*/

                            return null;
                          },

                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 60,
                        width: 250,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              //  padding: EdgeInsets.all(18)
                            ),
                            onPressed: () async {


                               /* try {
                                //  RestApiUtils.ShowLoadingDialog(context);
                                  String email1 = email.text.toString();
                                  UserCredential userCredential = await firebase_auth.signInAnonymously(

                                  );

                                  User? user = userCredential.user;
                                  print('Anonymous user ID: ${user!.uid}');
                                  if (userCredential.user != null) {
                                    int verificationCode = Random().nextInt(900000) + 100000;
                                    String verificationCodeString = verificationCode.toString();

                                    await userCredential.user!.sendEmailVerification(
                                      ActionCodeSettings(
                                        url: 'https://www.example.com/?code=$verificationCodeString',
                                        androidPackageName: 'com.example.myapp',
                                        iOSBundleId: 'com.example.myapp',
                                        handleCodeInApp: true,
                                      ),
                                      //   emailMessage: 'Your verification code for MyApp is: $verificationCodeString',
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            'Verification email has been sent to ${userCredential.user!
                                                .email}. Please verify your email to continue.')));
                                  }
                                } on FirebaseAuthException catch (e) {
                                  print('Anonymous sign-in failed: ${e.code} - ${e.message}');
                                }*/


                              final isValid = _formKey.currentState!.validate();
                              if (!isValid) return;
                              String email1 = email.text.toString();
                              String password1 = password.text.toString();

                              try {
                                UserCredential userCredential = await firebase_auth
                                    .createUserWithEmailAndPassword(
                                  email: email1,
                                  password: password1,
                                );
                              /*  if (userCredential != null) {
                                  // Show a SnackBar with the message that an email verification link has been sent to the user's email address.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'An email verification link has been sent to ${email
                                              .text}.'),
                                      duration: Duration(seconds: 5),
                                    ),
                                  );
                                  // Send the email verification link to the user's email address.
                                  await userCredential.user!.sendEmailVerification();
                                }*/

                                  // Navigate to the Homescreen .
                                 // Navigator.of(context).pop();

                                // Send the email verification link to the user's email address

                                await userCredential.user!.sendEmailVerification();
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => EmailVerificationScreen()));
                                 // User? user = firebase_auth.currentUser;
                                  /*if (user != null && user.emailVerified) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Email verified you can now login'),
                                        duration: Duration(seconds: 7),
                                      ),
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => Login()),
                                    );

                                  }*/


                              } on FirebaseAuthException
                              catch (e) {
                                print("error ${e.toString()}");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "The email address is already in use by another account."),
                                    duration: Duration(seconds: 4),
                                    action: SnackBarAction(
                                      label: 'Close',
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                      },
                                    ),
                                  ),
                                );
                              }



                            },

                            child: Text("Create Account",
                              style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 250,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              //  padding: EdgeInsets.all(18)
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                            child: Text("Login",
                              style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                              ,
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 250,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              //  padding: EdgeInsets.all(18)
                            ),
                            onPressed: () {},
                            child: Text("Contact Us",
                              style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                              ,
                            )
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            )


        ),
      );
    }
  }

