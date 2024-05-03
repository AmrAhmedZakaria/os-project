import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _username;
  late TextEditingController _emailController;
  String? _oldEmail;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await FirebaseFirestore.instance.collection('Customers').doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          _username = userData['username'];
          _emailController.text = user.email ?? '';
          _oldEmail = user.email;
        });
      }
    }
  }

  Future<void> _updateEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && _emailController.text.isNotEmpty && _emailController.text != _oldEmail) {
      try {
        await user.updateEmail(_emailController.text);
        await FirebaseFirestore.instance.collection('Customers').doc(user.uid).update({'email': _emailController.text});
        setState(() {
          _oldEmail = _emailController.text;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email updated successfully')));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update email: $e')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a new email')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xfffafafa),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xff1c170d),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 25,
          ),
          if (_username != null) // Only show if username is available
            Text(
              _username!,
              style: const TextStyle(
                color: Color(0xff1c170d),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          if (_username != null) // Only show if username is available
            Text(
              "@$_username",
              style: const TextStyle(
                color: Color(0xffad9261),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: TextFormField(
              controller: _emailController,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              keyboardType: TextInputType.text,
              cursorColor: const Color(0xffbea983),
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.black,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color(0xffbea983),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color(0xffbea983),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 240,
          ),
          MaterialButton(
            shape: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xff601719),
              ),
              borderRadius: BorderRadius.circular(35),
            ),
            color: const Color(0xff1dab6f),
            onPressed: _updateEmail,
            child: const Padding(
              padding: EdgeInsets.only(right: 150, left: 150),
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize:11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
