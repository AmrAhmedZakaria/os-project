import 'package:flutter/material.dart';
import 'package:Book_Shelf/search.dart';
import 'package:Book_Shelf/sell.dart';
import 'package:Book_Shelf/NewCheckoutScreen.dart';
import 'package:Book_Shelf/account.dart';
import 'package:Book_Shelf/bookpage.dart';
void main() {
  runApp(BookstoreApp());
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
      home: BookstoreHomePage(),
    );
  }
}

class BookstoreHomePage extends StatefulWidget {
  @override
  State<BookstoreHomePage> createState() => _BookstoreHomePageState();
}

class _BookstoreHomePageState extends State<BookstoreHomePage> {
  int _currentIndex = 0;

  List<Book> books = [

    Book(
        title: 'Wey Ward',
        author: 'Emilia Hart',
        imagePath: 'assets/images/Weyward.jpg',
        Price: 73

    ),
    Book(
        title: 'The Day Tripper',
        author: 'James Goodhand',
        imagePath: 'assets/images/Thehappy.jpg',
        Price: 50

    ),
    Book(
        title: 'Twelve Trees',
        author: 'Daniel Lewis',
        imagePath: 'assets/images/twelve.jpg',
        Price: 60

    ),
    Book(
        title: 'wady elzeab',
        author: 'Amr Abdelhamid',
        imagePath: 'assets/images/zicola.jpg',
        Price: 40

    ),
    Book(
        title: 'La Route',
        author: 'Gargaud',
        imagePath: 'assets/images/Route.jpg',
        Price: 120

    ),
    Book(
        title: 'Diavola',
        author: 'Jennifer Thorne',
        imagePath: 'assets/images/dlavola.png',
        Price: 77

    ),
  ];

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
            SizedBox(
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/books.png'),
              ),
            ),
            SizedBox(height: 10.0),
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
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              children: List.generate((books.length / 3).ceil(), (rowIndex) {
                return Row(
                  children: List.generate(3, (colIndex) {
                    int index = rowIndex * 3 + colIndex;
                    if (index < books.length) {
                      return Expanded(
                        child: BookItem(
                          title: books[index].title,
                          author: books[index].author,
                          imagePath: books[index].imagePath,
                          price: books[index].Price,
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff601719),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Color(0xff601719),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Sell',
            backgroundColor: Color(0xff601719),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Color(0xff601719),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
            backgroundColor: Color(0xff601719),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 0) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookstoreHomePage()));
            }
            if (_currentIndex == 1) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen()));
            }
            if (_currentIndex == 2) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ToggleScreen()));
            }
            if (_currentIndex == 3) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return NewCheckoutScreen(
                  bookTitle: 'Empty',
                  bookPrice: 0.0,
                  bookimage: 'Nothing',
                );
              })
    );
            }
            if (_currentIndex == 4) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Account()));
            }
          });
        },
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
          // Navigate or filter books based on category
        },
        child: Text(title),
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final String title;
  final String author;
  final String imagePath;
  final double price;

  const BookItem({
    required this.title,
    required this.author,
    required this.imagePath,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to book page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookPage(
              title: title,
              author: author,
              imagePath: imagePath,
              price: price,

            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        width: MediaQuery.of(context).size.width / 3 - 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 150.0,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(author),
          ],
        ),
      ),
    );
  }

}
class Book {
  final String title;
  final String author;
  final String imagePath;
  final double Price;

  const Book({
    required this.title,
    required this.author,
    required this.imagePath,
    required this.Price
  });
}
