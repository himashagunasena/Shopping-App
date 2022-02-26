import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  String title, image,imagev, description;
  int id, price,qty,selectqty;
  Color color;

  Item({
    required this.title,
    required this.price,
    required this.id,
    required this.description,
    required this.image,
    required this.imagev,
    required this.color,
    required this.qty,
    required this.selectqty,
  });
}

List<Item> items = [
  Item(
      id: 1,
      title: "Backpack",
      price: 2500,
      description: text,
      image: "assets/images/bag1.png",
      color: Color(0xFFE8D3B5), imagev: 'assets/images/bagv1.png', qty: 10, selectqty: n),
  Item(
      id: 2,
      title: "office bag",
      price: 2000,
      description: text,
      image: "assets/images/bag2.png",
      color: Color(0x000000), imagev: 'assets/images/bagv2.png', qty: 3, selectqty: n),
  Item(
      id: 3,
      title: "Diaper Bag",
      price: 4000,
      description: text,
      image: "assets/images/bag3.png",
      color: Color(0xFFE8D3B5), imagev: 'assets/images/bagv3.png', qty: 8, selectqty: n),
  Item(
      id: 4,
      title: " Simple bag",
      price: 2000,
      description: text,
      image: "assets/images/bag4.png",
      color: Color(0xFFE8D3B5), imagev: 'assets/images/bagv4.png', qty: 18, selectqty: n),
];
String text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu dui ut felis scelerisque hendrerit eu nec mi. Nam in urna ante. Nullam nunc velit, sollicitudin eget euismod vel, faucibus et elit. Duis eu mauris ex. Curabitur porta ullamcorper turpis, quis molestie tortor laoreet et.";
int n=0;