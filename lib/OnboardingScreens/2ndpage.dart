import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:langah_app/Home/homepage.dart';
import 'package:provider/provider.dart';


import '3rdpage.dart';
class Nextpage2 extends StatefulWidget {
  const Nextpage2({Key? key}) : super(key: key);

  @override
  State<Nextpage2> createState() => _Nextpage2State();
}

class _Nextpage2State extends State<Nextpage2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                width: 400,
                height: 340,
                child: Image.asset('assets/images/2ndpageimage.png'),
              ),
              Padding(
                padding: const EdgeInsets.only( left: 20, right:20),
                child: Container(
                    height: 269,
                    width: 340,
                    child: Text("2nd_page".tr(),
                        style:
                        TextStyle(fontWeight: FontWeight.w600 ,
                          fontSize: 38, fontFamily: "RobotoFlex" , color: Color(0xFF696969),
                        )
                    )

                ),
              ),
              SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.only(right:280),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Homepage()));
                    },
                    child: Text("Skip_button".tr(),

                        style:
                        TextStyle(fontWeight: FontWeight.w400 ,
                          fontSize: 16, fontFamily: "Manrope" , color: Color(0xFF515161),
                        )
                    )

                ),
              ),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Nextpage3()));
          },
          child: Icon(Icons.arrow_forward),
        ),
      ),


    );
  }
}
