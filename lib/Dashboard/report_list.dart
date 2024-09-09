import 'package:authentication_authorization/Dashboard/report.dart';
import 'package:flutter/material.dart';

class ReportList extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ReportList> {
  // Sample list of products
  final List<Map<String, String>> products = [
    {
      'name': 'SuktasMobile',
      'description': 'Description of Product 1',
    },
    {
      'name': 'SuktasERP',
      'description': 'A quick brown fox jumps over a lazy dog.',
    },
    {
      'name': 'Django',
      'description': 'Zero to hero',
    },
    {
      'name': 'Flutter mobile',
      'description': 'Application builder language',
    },
    {
      'name': 'Programming',
      'description': 'Creates a logical meaning',
    },
    {
      'name': 'Coding',
      'description': 'Difficult to learn',
    },
    {
      'name': 'Mangodb',
      'description': 'It is no-sql database',
    },
    {
      'name': 'Lufthansa',
      'description': 'Airliner 80462, runway 91 left',
    },
    {
      'name': 'kernel',
      'description': 'Knowledge based on reality',
    },
    {
      'name': 'react native',
      'description': 'websites',
    },
    {
      'name': 'Angular',
      'description': 'Description of the angular',
    },
    {
      'name': 'Java',
      'description': 'Description of Java is here',
    },
    // Add more products here
  ];

  List<Map<String, String>> filteredProducts = [];
  bool _isSearchOpen = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Initialize with all products
    _searchController.addListener(_onSearchChanged); // Add listener to search input
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged); // Remove listener
    _searchController.dispose();
    super.dispose();
  }

  // Method to update search results based on user input
  void _onSearchChanged() {
    setState(() {
      // Filter products by checking if the search query is in either the name or description
      filteredProducts = products
          .where((product) =>
              product['name']!
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()) ||
              product['description']!
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: _isSearchOpen
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search by name or description...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white54),
                ),
                style: const TextStyle(color: Colors.white),
              )
            :  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  // Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context)=> ReportPage()));
                }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                 Text("Reports", 
                 style: TextStyle(fontSize:20, color:Colors.white))
              ],
            ),
            // Text('Reports', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(_isSearchOpen ? Icons.close : Icons.search, color: Colors.white,),
            onPressed: () {
              setState(() {
                _isSearchOpen = !_isSearchOpen;
                if (!_isSearchOpen) {
                  _searchController.clear(); // Clear the search input when closing the search bar
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable inner scroll
                shrinkWrap: true, // Wrap the list to the column
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.blueAccent, // Border color
                        width: 1.5, // Border width
                      ),),
                      child: ListTile(
                      leading: CircleAvatar(radius: 20,),
                    //   Image.network(
                    //   product['imageUrl']!,
                    //   width: 50,
                    //   height: 50,
                    //   fit: BoxFit.cover,
                    // ),
                    
                    title: Text(product['name']!, style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(product['description']!),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
