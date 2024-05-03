import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  bool _isSearching = false;
  QuerySnapshot? _searchResults;
  List<String> _recentSearches = [];

  void _performSearch(String searchText) async {
    if (searchText.isEmpty) {
      setState(() {
        _searchResults = null;
      });
      return;
    }

    setState(() {
      _isSearching = true;
    });

    // Perform the search query
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Books')
        .where('Title', isEqualTo: searchText)
        .get();

    setState(() {
      _searchResults = querySnapshot;
      _isSearching = false;
    });

    // Add the searched text to recent searches
    if (!_recentSearches.contains(searchText)) {
      setState(() {
        _recentSearches.insert(0, searchText);
        if (_recentSearches.length > 3) {
          _recentSearches.removeLast();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search for books by title',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0xFFF5F1E4),
            isDense: true,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _searchText = _searchController.text.trim();
                });
                _performSearch(_searchText);
              },
            ),
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value.trim();
            });
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Recent Searches',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8.0),
          GestureDetector(
            onTap: () {
              if (_recentSearches.isNotEmpty) {
                setState(() {
                  _searchText = _recentSearches[0];
                  _searchController.text = _searchText;
                });
                _performSearch(_searchText);
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F1E4),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                _recentSearches.isNotEmpty ? _recentSearches[0] : '',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 1; i < _recentSearches.length; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _searchText = _recentSearches[i];
                      _searchController.text = _searchText;
                    });
                    _performSearch(_searchText);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F1E4),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      _recentSearches[i],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: _isSearching
                ? Center(child: CircularProgressIndicator())
                : _searchResults != null && _searchResults!.docs.isNotEmpty
                ? ListView.builder(
              shrinkWrap: true,
              itemCount: _searchResults!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot book = _searchResults!.docs[index];
                return GestureDetector(
                  onTap: () => _navigateToBookDetails(book),
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(
                        book['Title'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.0),
                          Text('Author: ${book['Author']}'),
                          SizedBox(height: 4.0),
                          Text('Price: \$${book['price']}'),
                          SizedBox(height: 4.0),
                          Text('Availability: ${book['availability']}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
                : Center(
              child: Text('No results found.'),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToBookDetails(DocumentSnapshot book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsScreen(book: book),
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final DocumentSnapshot book;

  const BookDetailsScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book['Title'],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.0),
              Text(
                'Author: ${book['Author']}',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 4.0),
              Text(
                'Price: \$${book['price']}',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 4.0),
              Text(
                'Availability: ${book['availability']}',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0), // Add some space between book details and button
              ElevatedButton(
                onPressed: () {
                  // Add to cart functionality here
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
