import 'package:Book_Shelf/login.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
 

class _WelcomePageState extends State<WelcomePage> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ListView(
          children:[
            const SizedBox(
                width:double.infinity,
                child:Image(
                  fit:BoxFit.fill,
                  image:AssetImage("assets/images/p1.png"),
                )
            ),
            const SizedBox(
              height:25,
            ),
            const Center(
              child: Text(
                  "Welcome to Bookshelf",
                  style:TextStyle(
                      fontSize:37,
                      fontWeight:FontWeight.w700,
                      color:Colors.black
                  )
              ),
            ),
            const  SizedBox(
              height:10,
            ),
            const Center(
              child: Text(
                  "learn from the world's best ideas.Anytime",
                  style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w400,
                      color:Colors.black
                  )
              ),
            ),
            const  SizedBox(
              height:5,
            ),
            const Center(
              child: Text(
                  "anywhere.",
                  style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w400,
                      color:Colors.black
                  )
              ),
            ),
            const SizedBox(
              height:300,
            ),
            Padding(
              padding: const EdgeInsets.only(right:12,left:12),
              child: MaterialButton(
                  shape:OutlineInputBorder(
                    borderSide:const BorderSide(
                      color:Color(0xff1dab6f),
                    ),
                    borderRadius:BorderRadius.circular(35),
                  ),
                  color:const Color(0xff1dab6f),
                  onPressed:(){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                      return Login();
                    }), (route) => false);
                  },
                  child:const Padding(
                    padding: EdgeInsets.only(top:10,bottom:10),
                    child: Text(
                        "Get started",
                        style:TextStyle(
                            fontSize:25,
                            fontWeight:FontWeight.w700,
                            color:Colors.white
                        )
                    ),
                  )
              ),
            )
          ],
        )
    );

  }
}