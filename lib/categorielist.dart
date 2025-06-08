import 'categoriesss.dart';
import 'package:flutter/material.dart';

import 'NextPage.dart';

final List<BoxItems> items = [
  BoxItems(
    name: 'Fast Food',
    imgpath: 'assets/icons/fastfood.svg',
    bkclr: mycolor[1],
    page: Nextpage(),
  ),

  BoxItems(
    name: 'SmartPhone',
    imgpath: 'assets/icons/phone.svg',
    bkclr: mycolor[4],
    page: Nextpage(),
  ),
  BoxItems(
    name: 'HeadPhones',
    imgpath: 'assets/icons/headphone.svg',
    bkclr: mycolor[0],
    page: Nextpage(),
  ),
  BoxItems(
    name: 'Laptops',
    imgpath: 'assets/icons/laptop.svg',
    bkclr: mycolor[3],
    page: Nextpage(),
  ),
  BoxItems(
    name: 'Clothes',
    imgpath: 'assets/icons/clothes.svg',
    bkclr: mycolor[4],
    page: Nextpage(),
  ),
  BoxItems(
    name: 'Watch',
    imgpath: 'assets/icons/watch.svg',
    bkclr: mycolor[5],
    page: Nextpage(),
  ),
  BoxItems(
    name: 'Utensil',
    imgpath: 'assets/icons/utensil.svg',
    bkclr: mycolor[0],
    page: Nextpage(),
  ),
];
List slideimg = [
  'assets/icons/Icecream.png',
  'assets/icons/Pizza.jpg',
  'assets/icons/Icecream.png',
  'assets/icons/Thuppa.jpg',
];

final List<Color> mycolor = [
  Color.fromARGB(185, 106, 106, 130),
  Color.fromARGB(220, 211, 137, 198),
  Color.fromARGB(211, 167, 189, 101),
  Color.fromARGB(180, 68, 143, 145),
  Color.fromARGB(131, 89, 47, 144),
  Color.fromARGB(131, 114, 114, 135),
  Color.fromARGB(131, 114, 114, 135),
  Color.fromARGB(183, 190, 90, 44),
  Color.fromARGB(203, 156, 86, 163),
];
final List<RecommendedItems> recommendeditem = [
  RecommendedItems(
    name: 'IceCream\nPrice:Rs250-Rs1500/-',
    imgpath: 'assets/icons/Icecream.png',
    page: Nextpage(),
  ),
  RecommendedItems(
    name: 'MacMini M4\nPrice:Rs101000/-',
    imgpath: 'assets/icons/macmini.jpg.webp',
    page: Nextpage(),
  ),
  RecommendedItems(
    name: 'Dell Latitude 14\nPrice:Rs125400/-',
    imgpath: 'assets/icons/dell.jpg',
    page: Nextpage(),
  ),
  RecommendedItems(
    name: 'Iphone 16 Pro\npRICE:-Rs145000/-',
    imgpath: 'assets/icons/iphone16pro.jpg',
    page: Nextpage(),
  ),
  RecommendedItems(
    name: 'Pizza 8 inch\nPrice:-Rs550/-',
    imgpath: 'assets/icons/Pizza.jpg',
    page: Nextpage(),
  ),
];
