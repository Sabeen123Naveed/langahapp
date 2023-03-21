
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langah_app/Applanguage/applanguage.dart';

import '../Exam/exam.dart';
import '../Home/homepage.dart';


class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  final TextEditingController search = TextEditingController();
  bool _isPressed = false;

  final List<Map<String, dynamic>> items = [
    {
      'title': "Learning_Progress".tr(),
      'subtitle': '53/1200',
      'trailing': "50%" ,


    },
    {
      'title': 'Topic_Sheets'.tr(),
      'subtitle': '53/1200',
      'trailing': "70%",

    },
    {
      'title': 'Exam_Progress'.tr(),
      'subtitle': '53/1200',
      'trailing': "20%",

    },

  ];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 210,
                width: 400,
                color: Color(0xFF222951),

                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20 , right: 8),
                          child: Text("Homepage_title".tr()
                            ,style: TextStyle(fontSize: 28 ,
                                fontWeight: FontWeight.w600,
                                fontFamily: "RobotoFlex",
                                color: Color(0xFFFFFFFF)
                            ),
                          ),
                        ),
                        SizedBox(width: 90,),
                        IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ChooseLanguage()));
                            },
                            icon:Icon(Icons.language_sharp,
                              color: Color(0xFFFACE00),
                            )

                        ),


                      ],
                    ),

                    SizedBox(height: 10,),
                     Padding(
                       padding: EdgeInsets.only(left: 20),
                       child: Text("Homepage_subtitle".tr()
                          ,style: TextStyle(fontSize: 15 ,
                              fontWeight: FontWeight.w400,
                              fontFamily: "RobotoFlex",
                              color: Color(0xFFFFFFFF)
                          ),
                        ),
                     ),

                  ],
                ),
              ),

              SizedBox(height: 10,),
              Expanded(
                // flex: 1,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15 , right:15),
                      child: Card(
                        color: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                            )
                        ),
                        child: ListTile(
                          title: Text(items[index]['title'], style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                          subtitle: Text(items[index]['subtitle'], style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                          trailing: Text(items[index]['trailing'],
                             style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                        ),
                        )
                      ),
                    );
                  },
                ),
              ),


              SizedBox(height: 10,),

              Container(
                width: size.width,
                height: 80,
                color: Color(0xFFFFFFFF),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 10),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Homepage()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/practice.png'),
                              height: 23,
                              width: 23,
                              fit: BoxFit.contain, // adjust how the image fits within the new size
                              color: _isPressed ? null : Colors.grey[400],
                            ),

                            Text("bottomnav_1".tr(),style: TextStyle( color: _isPressed ? null : Colors.grey[400],),),

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 10),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Progress()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/images/progress.png'),
                              height: 20,
                              width: 20,
                              fit: BoxFit
                                  .contain, // adjust how the image fits within the new size
                            ),
                            Text("bottomnav_2".tr())

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30 , right: 10),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Exam()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/exam.png'),
                              height: 23,
                              width: 23,
                              fit: BoxFit.contain, // adjust how the image fits within the new size
                              color: _isPressed ? null : Colors.grey[400],

                            ),
                            Text("bottomnav_3".tr(),style: TextStyle(  color: _isPressed ? null : Colors.grey[400],),)

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 10),
                      child: GestureDetector(
                        onTap: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/menu.png'),
                              height: 7,
                              width: 20,
                              fit: BoxFit.contain, // adjust how the image fits within the new size
                              color: _isPressed ? null : Colors.grey[400],

                            ),
                            Image(
                              image: AssetImage('assets/images/menu.png'),
                              height: 7,
                              width: 20,
                              fit: BoxFit.contain, // adjust how the image fits within the new size
                              color: _isPressed ? null : Colors.grey[400],

                            ),
                            Image(
                              image: AssetImage('assets/images/menu.png'),
                              height: 7,
                              width: 20,
                              fit: BoxFit.contain, // adjust how the image fits within the new size
                              color: _isPressed ? null : Colors.grey[400],

                            ),

                            Text("bottomnav_4".tr(),style: TextStyle(     color: _isPressed ? null : Colors.grey[400],),),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),


              ),


            ],


          ),



        ),
      ),




    );
  }
}



