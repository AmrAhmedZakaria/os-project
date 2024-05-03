import 'package:flutter/material.dart';
import 'package:Book_Shelf/NewCheckoutScreen.dart'; // Import the new checkout screen

class BookPage extends StatelessWidget {
  final String title;
  final String author;
  final String imagePath;
  final double price;

  const BookPage({
    required this.title,
    required this.author,
    required this.imagePath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200], // Background color under the photo
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'By: $author',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$$price',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[200], // Button color
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the new checkout screen
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return NewCheckoutScreen(
                    bookTitle: title,
                    bookPrice: price,
                    bookimage: imagePath,
                  );
                }));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff601719)),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 18, color: Colors.white), // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
