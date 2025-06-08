import 'package:flutter/material.dart';

import 'package:practiceapps/cartpage.dart';
import 'package:practiceapps/main.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int myIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('contactpage')),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(243, 237, 4, 4),
        onTap: (index) {
          setState(() {
            myIndex = index;
          });

          if (myIndex == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          }
          if (myIndex == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => cartpage()),
            );
          }
        },

        currentIndex: myIndex,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopping Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Contact'),
        ],
      ),
    );
  }
}
