import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({
    Key? key,
    required this.title,
    required this.username,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String username; // Store the username received from Index
  final String imageUrl; // Store the image URL received from Index

  @override
  State<Index> createState() => _WlecomState();
}

class _WlecomState extends State<Index> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Setting',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer after selecting an item
  }

  void _navigateToIndexPage() {
    Navigator.pop(context); // Close the drawer first
    Navigator.pop(context); // Navigate back to Index page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue.shade100, // Change AppBar color to purple
        iconTheme: IconThemeData(
          color: Colors.white, // Change menu button color to white
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/c4/dd/d7/c4ddd74f10657ab9f077e69d26a83206.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _widgetOptions[_selectedIndex],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors
                    .purpleAccent, // Adjust drawer header background color
                image: DecorationImage(
                  image:
                      NetworkImage(widget.imageUrl), // Use imageUrl from widget
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile', // Text to indicate profile image
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Welcome, ${widget.username}!', // Display username here
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
              },
            ),
            ListTile(
              title: const Text('Setting'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Back '),
              onTap: () {
                _navigateToIndexPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
