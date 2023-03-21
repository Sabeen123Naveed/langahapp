
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;
  String? _errorMessage;

  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
        _errorMessage = null;
      });

      try {
        String email1=  email.text.toString();
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email1);

        setState(() {
          _isSubmitting = false;
        });

        _showSuccessDialog();
      } catch (e) {
        setState(() {
          _isSubmitting = false;
          _errorMessage = e.toString();
        });
      }
    }
  }
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Password reset email sent'),
        content: Text('We have sent you an email with a link to reset your password.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child:Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(top: 200,left:10,right:10),
                child: Column(
                  children: [

                       Padding(
                         padding: const EdgeInsets.only(left:40),
                         child: Text("Enter an Email to reset your password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize:20
                          ),
                            ),
                       ),
                    SizedBox(height: 20,),

                    Text("Email",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 70,
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
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: 250,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.blueGrey,
                        ),
                      child: Row(
                        children: [
                          IconButton(

                              onPressed: (){},
                              icon: Icon(Icons.email)
                          ),
                          TextButton(

                              onPressed: _isSubmitting ? null : _resetPassword,
                              child: _isSubmitting
                              ? CircularProgressIndicator(color: Colors.white)
                                  : Text('Reset password',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20,color: Colors.black
                                ),),

                          ),

                        ],
                      ),
                    ),
              //  The syntax ...[ is known as a spread operator.
                    //  It is used to take a list or iterable and expand it into a new list.
                    //  In this case, it is used to expand a list of widgets into the children of the Column.
                //So, the code if (_errorMessage != null)
                    // ...[ checks if _errorMessage is not null,
                    // and if it is not null,
                    // it will expand the list of widgets following the
                    // ...[ into the children of the Column.
                    // If _errorMessage is null,
                    // the list will be empty and
                    // nothing will be added to the children of the Column.
                    if (_errorMessage != null) ...[
                      SizedBox(height: 16),
                      Text(
                        _errorMessage!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}


