
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home/homepage.dart';

class LoginPhone extends StatefulWidget {

  @override
  _LoginPhoneState createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController number= TextEditingController();
  var codeController = TextEditingController();
  var firebase_auth = FirebaseAuth.instance;
  bool isCodeSent = false;
  String VerificationId = "";
  @override
  void initState() {
    super.initState();
  }

  PhoneNumberAuthCompleted(BuildContext context, String smscode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: VerificationId,
      smsCode: smscode,
    );
    firebase_auth.signInWithCredential(credential).then(( UserCredential userCredential){
      print("object...... ${userCredential.user.toString()}");
    });

  }



  VerifyPhoneNumber(BuildContext context) async {
    try
    {
      String phoneno = number.text.toString();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "$phoneno",
        timeout: const Duration(seconds: 60),
        verificationCompleted: (
            PhoneAuthCredential credential) {
          this.VerificationId = credential.verificationId!;
          setState(() {
            codeController.text = credential.smsCode!;
          });

          print("HelloFirebaseAuth  1 ${credential.smsCode}");
          PhoneNumberAuthCompleted(context, credential.smsCode!);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(
              "HelloFirebaseAuth  verification failed called ${e
                  .toString()}");
        },
        codeSent: (String verificationId, int? resendToken) {
          this.VerificationId = VerificationId;
          setState(() {
            isCodeSent = true;
          });
          print("HelloFirebaseAuth  codeSent");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.VerificationId = VerificationId;
          print("HelloFirebaseAuth  codeAutoRetrievalTimeout called");
        },
      );
    }on FirebaseAuthException catch(error, _){
      print("HelloFirebaseAuth  FirebaseAuthException  called ${error.toString()}");
    }
    catch(e) {
      print("HelloFirebaseAuth  error  called ${e.toString()}");
    }
  }
  @override
  Widget build(BuildContext context) {
    GestureTapCallback onTapVerify = () {
      if(!isCodeSent){
        VerifyPhoneNumber(context);
      }
       else if (_formKey.currentState!.validate()) {
        // Form is valid, do something
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  Homepage(),
          ),
        );
      }
      else
      {
        String codesms = codeController.text.toString();
        PhoneNumberAuthCompleted(context, codesms);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
      }

    };
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                    children: [
                      Text(
                        'Enter Phone Number ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
                          controller: number,
                          keyboardType: TextInputType.number,
                          //textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: '*************',
                              filled: true, fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter phonenumber';
                            }

                            return null;
                          },

                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        ' Verification code',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
                          controller: codeController,
                          keyboardType: TextInputType.number,
                          //textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: '******',
                              filled: true, fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter verification code';
                            }

                            return null;
                          },


                        ),
                      ),
                      SizedBox(height: 40,),
                      Container(
                        height: 50,
                        width: 250,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              //  padding: EdgeInsets.all(18)
                            ),
                            onPressed:
                              onTapVerify,



                            child: Text(
                                isCodeSent? "VerifyCode": "Verify Phone Number",
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




