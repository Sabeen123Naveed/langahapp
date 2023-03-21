import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langah_app/Applanguage/applanguage.dart';

import '../Home/homepage.dart';
import '../Progress/progress.dart';


class TopicSheets extends StatefulWidget {
  const TopicSheets({Key? key}) : super(key: key);

  @override
  State<TopicSheets> createState() => _TopicSheetsState();
}

class _TopicSheetsState extends State<TopicSheets> {
  final TextEditingController search = TextEditingController();
  bool _isPressed = false;

  final List<Map<String, dynamic>> items = [
    {
      'title': "Shortexam".tr(),
      'subtitle': '12/100',
      'trailing': Icon(Icons.arrow_forward_ios_sharp),
      'leading': ClipRRect(
        // borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFF008080),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        ),
      )

    },
    {
      'title': 'Final'.tr(),
      'subtitle': '50/200',
      'trailing': Icon(Icons.arrow_forward_ios_sharp),
      'leading': ClipRRect(
        // borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFDAA520),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        ),
      )
    },
  ];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Topic Sheets",
          )
        ),
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 400,
                color: Color(0xFF222951),

                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Homepage_title".tr()
                            ,style: TextStyle(fontSize: 28 ,
                                fontWeight: FontWeight.w600,
                                fontFamily: "RobotoFlex",
                                color: Color(0xFFFFFFFF)
                            ),
                          ),
                        ),
                        SizedBox(width: 100,),
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
                      padding: const EdgeInsets.only(left: 20),
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
                          leading: items[index]['leading'],
                          title: Text(items[index]['title']),
                          subtitle: Text(items[index]['subtitle']),
                          trailing: items[index]['trailing'],
                        ),
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
                      padding: const EdgeInsets.only(left: 35),
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

                            Text("bottomnav_1".tr(),style: TextStyle(color: _isPressed ? null : Colors.grey[400],),),

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
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
                              color: _isPressed ? null : Colors.grey[400],
                            ),
                            Text("bottomnav_2".tr(),style: TextStyle( color: _isPressed ? null : Colors.grey[400],),)

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => TopicSheets()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/exam.png'),
                              height: 23,
                              width: 23,
                              fit: BoxFit.contain, // adjust how the image fits within the new size


                            ),
                            Text("bottomnav_3".tr(),)

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
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

                            Text("bottomnav_4".tr(),style: TextStyle(color: _isPressed ? null : Colors.grey[400],),),

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



