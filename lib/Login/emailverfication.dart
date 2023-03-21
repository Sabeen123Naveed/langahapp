import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:langah_app/Home/homepage.dart';

class EmailVerificationScreen extends StatefulWidget {
  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  Timer? timer;
  bool isEmailverified = false;
  bool resendmail = false;
  var firebase_auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();

    isEmailverified = firebase_auth.currentUser!.emailVerified;
    if(!isEmailverified){
      sendVerificationemail();
      timer = Timer.periodic(
        Duration(seconds: 3),
          (_) => checkEmailVerified()
      );
    }

  }


  Future  sendVerificationemail() async
  {
    try {
    final user = firebase_auth.currentUser;
    await user!.sendEmailVerification();
    setState(() => resendmail = false);
    await Future.delayed(Duration(seconds: 5));
    setState(() => resendmail = true);



  }catch(e){

      print(e.toString());
    }
  }
  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
  Future  checkEmailVerified() async
  {
    await firebase_auth.currentUser!.reload();
  setState(() {
    isEmailverified = firebase_auth.currentUser!.emailVerified;
  });
  if(isEmailverified)
    {
      return timer!.cancel();
    }
  }
  @override
  Widget build(BuildContext context) {
     return isEmailverified ? Homepage():
     SafeArea(
      child: Scaffold(
        appBar: AppBar(
         title: Text("Verify Email"),
          backgroundColor: Colors.grey,
           ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                Padding(
                  padding: const EdgeInsets.only(left:20,right:20),
                  child: Text(
                    'An email verification link has been sent to your email',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(height: 20,),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  //  padding: EdgeInsets.all(18)
                ),
                icon: Icon(Icons.email,color: Colors.white,),
                label: Text('Resend verification email', style: TextStyle(color: Colors.white),),

                onPressed: resendmail? () {
                  try {
                     sendVerificationemail() ;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Verification email sent.'),
                  ));
                  } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error sending verification email.'),
                  ));
                  }


                  // Handle button press
                }:null

              ),
              SizedBox(height:10),
              ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    //  padding: EdgeInsets.all(18)
                  ),
                  onPressed: () {
                    firebase_auth.signOut();
                    Navigator.of(context).pop();

                  },


                  child: Text("Cancel")
              )

            ],
          ),
        ),
      ),
    );
  }
}


