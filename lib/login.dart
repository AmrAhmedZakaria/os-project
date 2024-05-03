import 'package:Book_Shelf/homepage.dart';
import 'package:flutter/material.dart';
import 'package:Book_Shelf/reset.dart';
import 'package:Book_Shelf/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _hidePass = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _hidePass = !_hidePass;
    });
  }

  Future<void> _signIn() async {
    try {
      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        // Navigate to the home page after successful sign-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BookstoreHomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error: ${e.message}');
      // Show general error message for email or password incorrect
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid email or password'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/p2.png"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: TextFormField(
              controller: _usernameController,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              keyboardType: TextInputType.text,
              cursorColor: Color(0xffbea983),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xfff4f0e5),
                suffixIcon: Icon(
                  Icons.person,
                  color: Color(0xffbea983),
                  size: 30,
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffbea983),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(0xffbea983),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(0xffbea983),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: TextFormField(
              obscureText: !_hidePass,
              controller: _passwordController,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              keyboardType: TextInputType.text,
              cursorColor: Color(0xffbea983),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xfff4f0e5),
                suffixIcon: IconButton(
                  icon: _hidePass
                      ? Icon(
                    Icons.visibility,
                    size: 30,
                    color: Color(0xffbea983),
                  )
                      : Icon(
                    Icons.visibility_off,
                    size: 30,
                    color: Color(0xffbea983),
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffbea983),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(0xffbea983),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(0xffbea983),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: InkWell(
              splashColor: Colors.white,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ResetPass()),
                );
              },
              child: Text(
                "Forget password?",
                style: TextStyle(
                  color: Color(0xffbea983),
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: MaterialButton(
              shape: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff1dab6f),
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              color: const Color(0xff601709),
              onPressed: _signIn,
              child: const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have any account? ",
                style: TextStyle(
                  color: Color(0xffbea983),
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    color: Color(0xffbea983),
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
