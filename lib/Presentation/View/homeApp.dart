import 'package:ecommerce/Data/item.dart';
import 'package:ecommerce/Presentation/View/body.dart';
import 'package:ecommerce/Utils/utils.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Data/Dao/cart_dao.dart';
import 'cart.dart';

class Home extends StatelessWidget {
  final CartDao dao;
  Home({required this.dao});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            //Here you can set what ever background color you need.
            backgroundColor: Colors.black,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              top: DefaultPadding * 3, left: DefaultPadding),
                          child: const Text(
                            "Bella",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: TextLightColor),
                          )),
                      Container(
                        padding: const EdgeInsets.only(
                            top: DefaultPadding * 3, left: DefaultPadding),
                        child: IconButton(
                          icon: const Icon(
                              Icons.add_shopping_cart,color:TextLightColor,size: 28,),
                          onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>new Cart( dao: dao,)));},
                        ),
                      ),
                    ]),
                Container(
                    padding: const EdgeInsets.only(left: DefaultPadding),
                    child: const Text(
                      "Find your dream bag",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    )),
               BodyofItem(dao),],
            )));
  }
}
