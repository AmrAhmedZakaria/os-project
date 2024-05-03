import 'package:Book_Shelf/check.dart';
import 'package:Book_Shelf/login.dart';
import 'package:Book_Shelf/signup.dart';
import 'package:flutter/material.dart';
class ResetPass extends StatefulWidget {
  const ResetPass({super.key});
  @override
  State<ResetPass> createState() => _ResetPassState();
}
class _ResetPassState extends State<ResetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children:[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()  ));    /* of(context).pop();*/
            },
          ),

          const SizedBox(
              width:double.infinity,
              child:Image(
                fit:BoxFit.fill,
                image:AssetImage("assets/images/p3.png"),
              )
          ),
          const SizedBox(
            height:20,
          ),
          Padding(
            padding: const EdgeInsets.only(right:10,left:10),
            child: TextFormField(
              style:TextStyle(
                  fontSize:22,
                  fontWeight:FontWeight.w400,
                  color:Colors.black
              ),
              keyboardType:TextInputType.emailAddress,
              cursorColor:Color(0xffbea983),
              decoration:InputDecoration(
                filled:true,
                fillColor:Color(0xfff4f0e5),
                suffixIcon:Icon(
                  Icons.email,
                  color:Color(0xffbea983),
                  size:30,
                ),
                hintText:"Email Address",
                hintStyle:TextStyle(
                    fontSize:25,
                    fontWeight:FontWeight.w500,
                    color:Color(0xffbea983)
                ),
                focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                    borderSide:BorderSide(
                        color:Color(0xffbea983)
                    )
                ),
                enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                    borderSide:BorderSide(
                        color:Color(0xffbea983)
                    )
                ),
              ),
            ),
          ),
          const SizedBox(
              height:30
          ),
          Padding(
            padding: const EdgeInsets.only(right:12,left:12),
            child: MaterialButton(
                shape:OutlineInputBorder(
                  borderSide:const BorderSide(
                    color:Color(0xff601719),
                  ),
                  borderRadius:BorderRadius.circular(35),
                ),
                color:const Color(0xff601719),
                onPressed:(){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                    return CheckEmail();
                  }));
                },
                child:const Padding(
                  padding: EdgeInsets.only(top:10,bottom:10),
                  child: Text(
                      "Reset Password",
                      style:TextStyle(
                          fontSize:25,
                          fontWeight:FontWeight.w700,
                          color:Colors.white
                      )
                  ),
                )
            ),
          ),
          const SizedBox(
              height:150
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              const Text(
                  "Remember your password?",
                  style:TextStyle(
                      color:Color(0xffbea983),
                      fontSize:22,
                      fontWeight:FontWeight.w800
                  )
              ),
              InkWell(
                splashColor:Colors.white,
                onTap:(){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                    return Login();
                  }));
                },
                child: Text(
                    "Log in",
                    style:TextStyle(
                        color:Color(0xffbea983),
                        fontSize:22,
                        fontWeight:FontWeight.w900
                    )
                ),
              ),
            ],
          ),
          const SizedBox(
              height:20
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              const Text(
                  "Don't have an account?",
                  style:TextStyle(
                      color:Color(0xffbea983),
                      fontSize:22,
                      fontWeight:FontWeight.w800
                  )
              ),
              InkWell(
                splashColor:Colors.white,
                onTap:(){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                    return SignUp();
                  }));
                },
                child: Text(
                    "Sign up",
                    style:TextStyle(
                        color:Color(0xffbea983),
                        fontSize:22,
                        fontWeight:FontWeight.w900
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}