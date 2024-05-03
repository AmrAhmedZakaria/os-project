import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ToggleScreen extends StatefulWidget {
  @override
  _ToggleScreenState createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  int _selectedOption1Index = 0; // Initial selection index for first set of toggle buttons
  int _selectedOption2Index = 0; // Initial selection index for second set of toggle buttons
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _locationController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sell a Book"),
        elevation: 0, // Remove app bar elevation
        backgroundColor: Colors.transparent, // Make app bar transparent
      ),
      extendBodyBehindAppBar: true, // Extend body behind app bar
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80), // Add some space between the back button and the rest of the content
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0), // Rounded border
                  border: Border.all(), // Add a border for visual clarity
                ),
                child: ToggleButtons(
                  children: [
                    Text('Novels'),
                    Text('Books'),
                  ],
                  isSelected: [_selectedOption1Index == 0, _selectedOption1Index == 1],
                  onPressed: (int index) {
                    setState(() {
                      _selectedOption1Index = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0), // Rounded border
                  border: Border.all(), // Add a border for visual clarity
                ),
                child: ToggleButtons(
                  children: [
                    Text('Used'),
                    Text('New'),
                  ],
                  isSelected: [_selectedOption2Index == 0, _selectedOption2Index == 1],
                  onPressed: (int index) {
                    setState(() {
                      _selectedOption2Index = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                filled: true, // Fill the text box
                fillColor: Color(0xFFF5F1E4), // Set fill color to #f5f1e4
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), // Rounded border
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)), // Set opacity to 50%
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Price',
                filled: true, // Fill the text box
                fillColor: Color(0xFFF5F1E4), // Set fill color to #f5f1e4
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), // Rounded border
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)), // Set opacity to 50%
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Describe Your Location',
                filled: true, // Fill the text box
                fillColor: Color(0xFFF5F1E4), // Set fill color to #f5f1e4
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), // Rounded border
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)), // Set opacity to 50%
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                hintText: 'Phone number',
                filled: true, // Fill the text box
                fillColor: Color(0xFFF5F1E4), // Set fill color to #f5f1e4
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), // Rounded border
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)), // Set opacity to 50%
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: MaterialButton(
                onPressed: () {
                  // Add your submit logic here
                  FirebaseFirestore.instance.collection('Uploaded-books').add({
                    'title': _titleController.text.trim(),
                    'type': _selectedOption1Index == 0 ? 'Novels' : 'Books',
                    'condition': _selectedOption2Index == 0 ? 'Used' : 'New',
                    'price': _priceController.text.trim(),
                    'location': _locationController.text.trim(),
                    'phoneNumber': _phoneNumberController.text.trim(),
                    // Add more fields if needed
                  }).then((value) {
                    // Data added successfully
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Icon(Icons.check_circle, color: Colors.green),
                          content: Text('Submited successfully'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _titleController.clear();
                                _priceController.clear();
                                _locationController.clear();
                                _phoneNumberController.clear();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }).catchError((error) {
                    // Error handling
                    print('Error adding data to Firestore: $error');
                  });
                },
                color: Color(0xff601709),
                textColor: Colors.white,
                child: Text('Submit'),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
