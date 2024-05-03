import 'package:flutter/material.dart';
class Language extends StatefulWidget {
  const Language({super.key});
  @override
  State<Language> createState() => _LanguageState();
}
class _LanguageState extends State<Language> {
  List lang = [
    {"lng" : "English (UK)", "sub" :"(English)"},
    {"lng" : "Egypt (Syria)", "sub" :"( )"},
    {"lng" : "India", "sub" :"( )"},
    {"lng" : "Pakistan", "sub" :"( )"},
    {"lng" : "Bangladesh", "sub" :"( )"},
    {"lng" : "Philippines", "sub" :"(Tagalog)"},
    {"lng" : "Iran", "sub" :"( )"},
    {"lng" : "Nepal", "sub" :"( )"},
    {"lng" : "Sri Lanka", "sub" :"( )"},
    {"lng" : "United States", "sub" :"( )"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            elevation:0.0,
            backgroundColor:const Color(0xfffafafa),
            title:const Text(
              "Language",
              style:TextStyle(
                  color:Color(0xff601719),
                  fontWeight:FontWeight.w600
              ),
            )
        ),
        body:ListView.separated(
          separatorBuilder:(context, i){
            return const SizedBox(
              height:5,
            );
          },
          itemCount:lang.length,
          itemBuilder:(context,i){
            return InkWell(
              splashColor:Color(0xff601709),
              highlightColor:Colors.white,
              onTap:(){},
              child: ListTile(
                leading:Container(
                  height:50,
                  width:50,
                  decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      color:const Color(0xfff5f0e5)
                  ),
                  child:const Icon(
                    Icons.language,
                    color:Color(0xff601709),
                  ),
                ),
                title:Text(
                  "${lang[i]["lng"]}",
                  style:const TextStyle(
                      fontSize:22,
                      fontWeight:FontWeight.w400,
                      color:Color(0xff601709)
                  ),
                ),
                subtitle:Text(
                  "${lang[i]["sub"]}",
                  style:const TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w400,
                      color:Color(0xff601709)
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}