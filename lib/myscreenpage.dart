import 'package:flutter/material.dart';
import 'package:practiceapps/cartpage.dart';
import 'package:practiceapps/categoriesss.dart';
import 'package:practiceapps/contact.dart';
//import 'package:practiceapps/rado.dart';
import 'categorielist.dart';
import 'dart:async';
//import 'package:marquee/marquee.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var currentpage = 0;
  var selectedindex = 0;
  PageController slidercontroller = PageController(viewportFraction: 0.8);
  sliderfunction() {
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      currentpage++;
      slidercontroller.animateToPage(
        currentpage % slideimg.length,
        duration: Duration(seconds: 1),
        curve: Curves.linear,
      );
    });
  }

  late Timer _timer;
  late TabController _tabcontroller;
  @override
  void initState() {
    super.initState();
    sliderfunction();

    _tabcontroller = TabController(
      length: slideimg.length,
      initialIndex: currentpage % slideimg.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    slidercontroller.dispose();
    _timer.cancel();
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Bazar Sansar',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.menu, size: 30)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),

            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_pin, size: 30),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              152,
                              0,
                              0,
                              0,
                            ).withAlpha(40),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Items',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.search, size: 30),

                          suffixIcon: Icon(Icons.filter_alt, size: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Text(
                    'Category',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (content, index) {
                  return Categoree(items: items[index]);
                },
              ),
            ),
            Divider(thickness: 2, indent: 12, endIndent: 12),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: slidercontroller,
                padEnds: false,
                pageSnapping: true,
                physics: BouncingScrollPhysics(),

                onPageChanged: (value) {
                  currentpage = value;
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),

                    width: double.infinity,
                    child: Image.asset(
                      slideimg[index % slideimg.length],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            TabPageSelector(controller: _tabcontroller),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Recommended',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            MidBox(boxItemsList: recommendeditem),
          ],
        ),
      ),
      bottomNavigationBar: buttonnavigation(),
    );
  }

  BottomNavigationBar buttonnavigation() {
    return BottomNavigationBar(
      currentIndex: selectedindex,

      onTap: (index) {
        setState(() {
          selectedindex = index;
          if (selectedindex == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => cartpage()),
            );
          } else if (selectedindex == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ContactPage()),
            );
          }
        });
      },

      selectedItemColor: Color.fromARGB(243, 237, 4, 4),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contact Us'),
      ],
    );
  }
}
