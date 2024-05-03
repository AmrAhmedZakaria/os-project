import 'package:flutter/material.dart';
import 'package:Book_Shelf/language.dart';
import 'package:Book_Shelf/profile.dart';
import 'package:Book_Shelf/myads.dart'; // Corrected the import statement

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 5),
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Account",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buildListTile(
                context,
                Icons.person_pin,
                "View and edit profile",
                "Enter your personal information",
                    () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const Profile();
                  }));
                },
              ),
              SizedBox(
                height: 10,
              ),
              buildListTile(
                context,
                Icons.language,
                "Change language",
                "",
                    () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const Language();
                  }));
                },
              ),
              SizedBox(
                height: 10,
              ),
              buildListTile(
                context,
                Icons.ads_click_rounded,
                "My ADS",
                "",
                    () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return MyAdsPage(); // Navigate to the MyAds screen
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(
      BuildContext context,
      IconData icon,
      String title,
      String subtitle,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xfff5f0e5),
          ),
          child: Icon(
            icon,
            color: Color(0xff601719),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: subtitle.isNotEmpty ? Text(
          subtitle,
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ) : null,
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 25,
          color: Color(0xff601719),
        ),
      ),
    );
  }
}
