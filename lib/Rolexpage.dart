import 'package:flutter/material.dart';

class Rolex extends StatelessWidget {
  const Rolex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rolex pages'),
        centerTitle: true,
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
              ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Header')),
            ListTile(title: Text('contact')),
            ListTile(title: Text('service')),
            ListTile(title: Text('about us')),
          ],
        ),
      ),
    );
  }
}
