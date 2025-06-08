import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class BoxItems {
  String name;
  String imgpath;
  Color bkclr;
  Widget? page;

  BoxItems({
    required this.name,
    required this.imgpath,
    required this.bkclr,
    required this.page,
  });
}

class Categoree extends StatelessWidget {
  final BoxItems items;
  const Categoree({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (items.page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => items.page!),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("This page is not available.")),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: items.bkclr,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(50),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ClipOval(
                          child: SvgPicture.asset(
                            items.imgpath,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(items.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 450,
                      width: 300,
                      // color: mycolor[7],
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close dialog
                                },
                                icon: Icon(Icons.close),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(items.imgpath),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            items.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                            },
                            child: const Text("Close"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );*/
class RecommendedItems {
  String name;
  String imgpath;

  Widget? page;

  RecommendedItems({
    required this.name,
    required this.imgpath,

    required this.page,
  });
}

class MidBox extends StatelessWidget {
  final List<RecommendedItems> boxItemsList;
  const MidBox({required this.boxItemsList, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 250,
            ),
            itemCount: boxItemsList.length,
            itemBuilder: (context, index) {
              final boxitm = boxItemsList[index];
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(228, 230, 236, 238),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(boxitm.imgpath, fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        boxitm.name,
                        style: TextStyle(
                          fontSize: 16,
                          //fontWeight: FontWeig,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
