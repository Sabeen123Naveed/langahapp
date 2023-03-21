import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:langah_app/Login/ForgotPassword.dart';

import '../Home/homepage.dart';
import 'Create_Account.dart';
import 'loginwithphone.dart';
class Login extends StatefulWidget {

  const Login({Key? key,  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  var firebase_auth = FirebaseAuth.instance;
  final TextEditingController mail = TextEditingController();
  final TextEditingController password= TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(

           body:Center(
                   child: SingleChildScrollView(
                     child: Form(
                       key: _formKey,
                       child: Column(
                         children: [
                           SizedBox(height: 30,),
                           Text("Sign in To Continue",
                             style: TextStyle(fontSize: 20),
                           ),
                           SizedBox(height: 100,),
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
                               controller: mail,
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
                           SizedBox(height: 10,),

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
                               obscureText: _obscureText,
                               keyboardType: TextInputType.number,
                               //textAlign: TextAlign.center,
                               decoration: InputDecoration(
                                 hintText: '**********',
                                 filled: true,
                                 fillColor: Colors.white,
                                 border: InputBorder.none,
                                 suffixIcon: IconButton(
                                   icon: Icon(
                                     _obscureText ? Icons.visibility_off : Icons
                                         .visibility,
                                   ),
                                   onPressed: () {
                                     setState(() {
                                       _obscureText = !_obscureText;
                                     });
                                   },
                                 ),
                               ),
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return 'Please enter password';
                                 }
                                 //   if (!RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)", caseSensitive: false).hasMatch(value)) {
                                 //   return 'Password should contain Capital, small letter, Number & Special character';
                                 //}
                                 return null;
                               },

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
                                 onPressed: () async {

                                   final isValid = _formKey.currentState!.validate();
                                   if(!isValid) return;

                                   String email1 = mail.text.toString();
                                   String password1 = password.text.toString();
                                   try {
                                     UserCredential userCredential = await firebase_auth.signInWithEmailAndPassword(
                                       email: email1,
                                       password: password1,
                                     );
                                   //  print("......User Info... ${userCredential
                                     //    .credential!
                                       //  .signInMethod}");
                                     User? user = firebase_auth.currentUser;
                                     if (user != null && user.emailVerified) {
                                       ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(
                                           content: Text("Login Successful "),
                                           duration: Duration(seconds: 4),
                                           action: SnackBarAction(
                                             label: 'Close',
                                             onPressed: () {
                                               ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                             },
                                           ),
                                         ),
                                       );
                                        Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => Homepage()),
                                         );
                                        print("Login Successful.....");

                                     }

                                   } on FirebaseAuthException catch (e) {
                                     if (e.code == 'user-not-found') {
                                       print('No user found for that email.');
                                       ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(
                                           content: Text(" Account does not exist"),
                                           duration: Duration(seconds: 4),
                                           action: SnackBarAction(
                                             label: 'Close',
                                             onPressed: () {
                                               ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                             },
                                           ),
                                         ),
                                       );
                                     } else if (e.code == 'wrong-password') {
                                       print('Wrong password provided for that user.');
                                       ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(
                                           content: Text("You entered wrong password"),
                                           duration: Duration(seconds: 4),
                                           action: SnackBarAction(
                                             label: 'Close',
                                             onPressed: () {
                                               ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                             },
                                           ),
                                         ),
                                       );
                                     }
                                     // Handle other Firebase Auth errors as needed.
                                   }
                                    /* try {
                                       firebase_auth.signInWithEmailAndPassword(
                                           email: email1, password: password1)
                                           .then((
                                           UserCredential usercredential) {
                                         print("object ${usercredential.user
                                             .toString()}");
                                         print("object ${usercredential
                                             .credential!
                                             .signInMethod}");
                                         print("object ${usercredential
                                             .credential!.token}");
                                       }).onError((FirebaseAuthException error,
                                           stackTrace) {
                                         if (error.code == "wrong-password") {
                                           print("...${error.toString()}");
                                         }
                                         else if (error.code ==
                                             "too-many-requests") {
                                           print("...${error.toString()}");
                                         }
                                       });
                                       User? user = firebase_auth.currentUser;
                                       if (user != null && user.emailVerified) {
                                        // Navigator.pushReplacement(
                                          // context,
                                          // MaterialPageRoute(builder: (context) => Homepage()),
                                       //  );
                                       }
                                     }on FirebaseAuthException
                                     catch (e) {
                                       print("error ${e.toString()}");
                                       ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(
                                           content: Text(" Account does not exist"),
                                           duration: Duration(seconds: 4),
                                           action: SnackBarAction(
                                             label: 'Close',
                                             onPressed: () {
                                               ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                             },
                                           ),
                                         ),
                                       );
                                     }*/



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
                           GestureDetector(
                             child: Text("Forgot Password?",
                               style: TextStyle(
                                 decoration: TextDecoration.underline,
                                   color: Colors.black,
                                   fontSize: 20),
                             ),
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(
                                   builder: (context) => Forgotpassword()));
                             },
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
                                   Navigator.push(context, MaterialPageRoute(
                                       builder: (context) => LoginPhone()));
                                 },
                                 child: Text("Login With Phone",
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
                                 onPressed: () {
                                   Navigator.of(context).push(
                                         MaterialPageRoute(
                                         builder: (context) =>  CreateAccount(),
                                         ),
                                        );

                                 },
                                 child: Text("Create Account",
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



)
    );
  }
}
