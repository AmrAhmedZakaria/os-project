import 'package:Book_Shelf/login.dart';
import 'package:flutter/material.dart';

class WelcomePaget extends StatefulWidget {
  const WelcomePaget({super.key});
  @override
  State<WelcomePaget> createState() => _WelcomePageStatet();
}


class _WelcomePageStatet extends State<WelcomePaget> {






@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      height: MediaQuery.of(context).size.height, // Set container height to screen height
      child: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/p1.png"),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              "Welcome to Bookshelf",
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "learn from the world's best ideas. Anytime",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "anywhere.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: MaterialButton(
              shape: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff1dab6f),
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              color: Color(0xff1dab6f),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                    return Login();
                  }),
                      (route) => false,
                );
              },
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Get started",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
}
