import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../Home/homepage.dart';
class ChooseCountry extends StatefulWidget {
  const ChooseCountry({Key? key}) : super(key: key);

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  final List<Map<String, dynamic>> items = [
    {
      'title': "Countryname_Turkey".tr(),
      'leading': CircleAvatar(
     backgroundImage: AssetImage('assets/images/turkeyflag.png'),
    ),
    },
    {
      'title': 'Countryname_USA'.tr(),
      'leading': CircleAvatar(
        backgroundImage: AssetImage('assets/images/USAflag.png'),
      ),
    },
    {
      'title': 'Countryname_Pakistan'.tr(),
      'leading': CircleAvatar(
        backgroundImage: AssetImage('assets/images/Pakflag.png'),
      ),

    },
    {
      'title': 'Countryname_India'.tr(),
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
                      height: 27,
                      width: 213,
                      child: Text("Country_Selection".tr(),
                        style: TextStyle(fontSize: 20 ,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000000)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width:65),
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
