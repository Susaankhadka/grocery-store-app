import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practiceapps/cartpage.dart';
import 'package:practiceapps/categoriesss.dart';
import 'package:practiceapps/contact.dart';
//import 'package:practiceapps/loginpage.dart';
//import 'package:practiceapps/rado.dart';
import 'categorielist.dart';
import 'dart:async';
//import 'package:marquee/marquee.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [MyHomePage(), ContactPage(), cartpage()];
  var selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),

      body: IndexedStack(index: selectedindex, children: _pages),
      bottomNavigationBar: buttonnavigation(),
    );
  }

  BottomNavigationBar buttonnavigation() {
    return BottomNavigationBar(
      currentIndex: selectedindex,

      onTap: (index) {
        setState(() {
          selectedindex = index;
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var currentpage = 0;

  late Timer _timer;

  late TabController _tabcontroller;

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
    _tabcontroller.dispose();
    slidercontroller.dispose();
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Bazar Sansar',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            'assets/icons/shopinglogo.svg',
            height: 20,
            width: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Builder(
              builder:
                  (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: SvgPicture.asset('assets/icons/profile.svg'),
                  ),
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
      endDrawer: Drawer(
        width: 280,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 70,
                      child: SvgPicture.asset(
                        'assets/icons/profile.svg',
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Susaan', style: TextStyle(fontSize: 22)),

                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // no extra padding
                          minimumSize: Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'View profile',
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_outlined),
                    title: Text('Your Profile'),
                  ),

                  ListTile(
                    leading: Icon(Icons.control_point_duplicate_sharp),
                    title: Text('Reward and Earn'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Setting'),
                  ),
                  ListTile(
                    leading: Icon(Icons.support_agent),
                    title: Text('Help/Supports'),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notification'),
                  ),

                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text('About'),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout_rounded),
                    title: Text('Log Out'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
