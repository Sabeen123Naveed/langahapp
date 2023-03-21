import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:langah_app/Country/Selectcountry.dart';
import 'package:langah_app/Home/homepage.dart';
import 'package:provider/provider.dart';


class Nextpage3 extends StatefulWidget {
  const Nextpage3({Key? key}) : super(key: key);

  @override
  State<Nextpage3> createState() => _Nextpage3State();
}

class _Nextpage3State extends State<Nextpage3> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
              children: [
                Container(
                  width: 400,
                  height: 335,
                  child: Image.asset('assets/images/3rdpageimage.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right:20),
                  child: Container(
                      height: 270,
                      width: 340,
                      child: Text("3rd_page".tr(),
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
                builder: (context) => ChooseCountry()));
          },
          child: Icon(Icons.arrow_forward),
        ),
      ),


    );
  }
}
