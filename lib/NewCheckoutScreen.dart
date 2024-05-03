import 'package:flutter/material.dart';
import 'package:Book_Shelf/homepage.dart';
import 'package:Book_Shelf/login.dart';
import 'package:flutter/material.dart';
import 'package:Book_Shelf/counterwidget.dart';
import 'package:Book_Shelf/orderconfirmation.dart';

class NewCheckoutScreen extends StatelessWidget {
  final String bookTitle;
  final double bookPrice;
  final String bookimage;

  const NewCheckoutScreen({
    required this.bookTitle,
    required this.bookPrice,
    required this.bookimage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Shipping Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        bookimage, // Assuming the book images are named based on their titles
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bookTitle,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '\$$bookPrice',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal: \$$bookPrice', // Assuming shipping is free
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BookstoreHomePage()),
                          );
                        },child: const Text("Continue Shopping", style:TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff601719),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderConfirmationPage()),
                      );
                    }, child: const Text(" Confirm & Checkout", style:TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff601719), // Change button color to red
                    ),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
