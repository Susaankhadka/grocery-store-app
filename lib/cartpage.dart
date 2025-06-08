import 'package:flutter/material.dart';
import 'package:practiceapps/contact.dart';
import 'package:practiceapps/myscreenpage.dart';

class cartpage extends StatefulWidget {
  const cartpage({super.key});

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  int currpage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('cart pages'), centerTitle: true),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currpage,
        onTap: (value) {
          setState(() {
            currpage = value;
          });

          if (currpage == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            );
          } else if (currpage == 2) {
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
        selectedItemColor: Color.fromARGB(208, 199, 5, 5),
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
