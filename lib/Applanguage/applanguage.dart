import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Home/homepage.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {

  final List<Map<String, dynamic>> items = [
    {
      'title': "Choose_language1".tr(),
      'leading': CircleAvatar(
        backgroundImage: AssetImage('assets/images/turkeyflag.png'),
      ),

    },
    {
      'title': 'Choose_language2'.tr(),
      'leading': CircleAvatar(
        backgroundImage: AssetImage('assets/images/USAflag.png'),
      ),
    },
    {
      'title': 'Choose_language3'.tr(),
      'leading': CircleAvatar(
        backgroundImage: AssetImage('assets/images/Pakflag.png'),
      ),

    },
    {
      'title': 'Choose_language4'.tr(),
      'leading': CircleAvatar(
        backgroundImage: AssetImage('assets/images/Indiaflag.png'),
      ),

    },

  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 91,left:20 , right: 8),
                      child: Container(
                        height: 30,
                        width: 250,
                        child: Text("Choose_language".tr(),
                          style: TextStyle(fontSize: 22 ,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF000000)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:30),
                    Padding(
                      padding: const EdgeInsets.only(top: 91),
                      child: IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Homepage()));

                          }, icon: Icon(Icons.clear)
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15 , right:15),
                      child: Card(
                        color: Color(0xFFFFFFFF),
                        elevation: 2, // Add some shadow to the card
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: Color(0xFFD9D9D9),
                            width: 1,
                          ),
                        ),

                        child: ListTile(
                          leading: items[index]['leading'],
                          title: Text(items[index]['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 19,color: Color(0xFF000000)
                            ),
                          ),
                          onTap: () {
                            // Handle tap event for this list tile
                            if (items[index]['title'] == "Choose_language1".tr()) {
                              context.setLocale(Locale('tr', 'TR'));

                            } else if (items[index]['title'] == 'Choose_language2'.tr()) {
                              // Do something if this is the second list tile
                              context.setLocale(Locale('en', 'US'));

                            } else if (items[index]['title'] == 'Choose_language3'.tr()) {
                              // Do something if this is the third list tile
                              context.setLocale(Locale('ur', 'PK'));

                            } else if (items[index]['title'] == 'Choose_language4'.tr()) {
                              // Do something if this is the fourth list tile
                              context.setLocale(Locale('hi', 'IN'));


                            }
                          },
                        ),

                      ),
                    );
                  },
                ),
              ),



            ],
          ),
        ),

      ),
    );
  }
}
