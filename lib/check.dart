import 'package:Book_Shelf/reset.dart';
import 'package:flutter/material.dart';
class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key});
  @override
  State<CheckEmail> createState() => _CheckEmailState();
}
class _CheckEmailState extends State<CheckEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ListView(
          children:[
            Padding(
              padding: const EdgeInsets.only(top:20,left:10,right:5),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:[
                  Text(
                    "Check your email",
                    style:TextStyle(
                        fontSize:25,
                        fontWeight:FontWeight.w800,
                        color: Color(0xff601719)
                    ),
                  ),
                  IconButton(
                    onPressed:(){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                        return ResetPass();
                      }));
                    },
                    icon:Icon(
                        Icons.close,
                        size:40,
                        color: Color(0xff601719)
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width:double.infinity,
                child:Image(
                  fit:BoxFit.fill,
                  image:AssetImage("assets/images/p4.png"),
                )
            ),
            const SizedBox(
              height:10,
            ),
            const Center(
              child: Text(
                  "We've sent a code to the email address you",
                  style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w400,
                      color: Color(0xff601719)
                  )
              ),
            ),
            const SizedBox(
              height:5,
            ),
            const Center(
              child: Text(
                  "provided.Please check your email and enter",
                  style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w400,
                      color: Color(0xff601719)
                  )
              ),
            ),
            const SizedBox(
              height:5,
            ),
            const Center(
              child: Text(
                  "the 6-digit code here.",
                  style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w400,
                      color: Color(0xff601719)
                  )
              ),
            ),
          ],
        )
    );
  }
}