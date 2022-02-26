import 'package:ecommerce/Presentation/View/common/bottom_btn.dart';
import 'package:ecommerce/Presentation/View/common/counter_btn.dart';
import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Data/Dao/cart_dao.dart';
import '../../Data/database/database.dart';
import '../../Data/item.dart';
import '../../Utils/utils.dart';
import 'cart.dart';

class Product extends StatelessWidget {
  late Item item;
  final CartDao dao;
  Product({Key? key, required this.item, required this.dao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(num);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
            child: Text(
          item.title,
          style: const TextStyle(color: Colors.black),
        )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new Cart(
                              dao: dao,
                            )));
              },
              icon: const Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
                size: 28,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Image.asset(
            item.imagev,
            fit: BoxFit.contain,
            width: size.width,
          )),
          Container(
              padding: const EdgeInsets.only(
                  left: DefaultPadding, top: DefaultPadding),
              child: Text(
                "Rs." + "${item.price}" + ".00",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )),
          Container(
              padding: const EdgeInsets.only(
                  top: DefaultPadding,
                  left: DefaultPadding,
                  right: DefaultPadding),
              child: Text(
                item.description,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              )),
          Padding(
              padding:
                  EdgeInsets.only(top: DefaultPadding, left: DefaultPadding),
              child: CounterBtn(
                item: item,
              )),
          BottomBtn(
            dao: dao,
            item: item,
          ),
        ],
      ),
    );
  }
}
