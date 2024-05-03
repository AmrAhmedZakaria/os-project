import 'package:Book_Shelf/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(BookstoreApp());
}
class BookstoreApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Shelf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash ()   ,
    );
  }
}

/*class BookstoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookShelf'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.all(25.0),
                child :  Image(
                  image: AssetImage('assets/images/books.png'),



                ) // Replace 'assets/bookshelf_image.png' with your image path
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryButton(title: 'Fiction'),
                  CategoryButton(title: 'Non-fiction'),
                  CategoryButton(title: 'Sci-Fi'),
                  CategoryButton(title: 'Horror'),
                  CategoryButton(title: 'Romance'),
                  CategoryButton(title: 'Tech'),
                  // Add more categories as needed
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 400.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Replace 10 with the actual number of books
                itemBuilder: (context, index) {
                  return BookItem(); // Create a BookItem widget to display book details
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',backgroundColor: Colors.red,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Sell', backgroundColor: Colors.red,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ads_click),
            label: 'ADs',backgroundColor: Colors.red,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',backgroundColor: Colors.red,


          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;

  const CategoryButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Account()));
          // Add functionality to navigate or filter books based on category
        },
        child: Text(title),
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: 120.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/atomichabbits.png'), // Replace 'assets/book_cover.png' with your book cover image path
          SizedBox(height: 8.0),
          Text(
            'Book Title',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Author Name'),
        ],
      ),
    );
  }
}*/
