import 'package:flutter/material.dart';
import 'package:practiceapps/cartpage.dart';
import 'package:practiceapps/contact.dart';
import 'package:practiceapps/myscreenpage.dart';

class Nextpage extends StatefulWidget {
  const Nextpage({super.key});

  @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  @override
  Widget build(BuildContext context) {
    var currpage = 0;
    return Scaffold(
      appBar: AppBar(title: Text('Category Items pages'), centerTitle: true),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currpage,
        selectedItemColor: Color.fromARGB(208, 199, 5, 5),
        onTap: (value) {
          setState(() {});
          currpage = value;
          if (currpage == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            );
          } else if (currpage == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return cartpage();
                },
              ),
            );
          } else if (currpage == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ContactPage();
                },
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contact'),
        ],
      ),
    );
  }
}
