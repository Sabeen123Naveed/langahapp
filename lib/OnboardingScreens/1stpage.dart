import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:langah_app/Home/homepage.dart';
import 'package:provider/provider.dart';


import '2ndpage.dart';
class Startpage extends StatefulWidget {
  const Startpage({Key? key}) : super(key: key);

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(

                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 350,
                      child: Image.asset('assets/images/1stpageimage.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( left: 20 , right:20),
                      child: Container(
                        height: 250,
                          width: 340,
                          child: Text("1st_page".tr(),
                            style:
                            TextStyle(fontWeight: FontWeight.w600 ,
                                fontSize: 38, fontFamily: "RobotoFlex" , color: Color(0xFF696969),
                                    )
                          )

                          ),
                    ),
                           SizedBox(height: 50,),

                           Padding(
                             padding: const EdgeInsets.only( right:280),
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
                          ),
                               )


                           ),

                  ],
                ),
              ),


        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Nextpage2()));
          },
          child: Icon(Icons.arrow_forward),
        ),
        ),


    );
  }
}
