import 'package:ecommerce/Data/Dao/cart_dao.dart';
import 'package:ecommerce/Data/item.dart';
import 'package:ecommerce/Utils/utils.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Data/database/database.dart';
import 'Product.dart';

Future<void> main() async{WidgetsFlutterBinding.ensureInitialized();
final database = await $FloorAppDatabase.databaseBuilder("shopping_cart.db")
    .build();
final dao = database.cartDao;
}
class BodyofItem extends StatelessWidget {
  final CartDao dao;
  BodyofItem(this.dao);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
            child: GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.60,
                    mainAxisSpacing: DefaultPadding,
                    crossAxisSpacing: DefaultPadding),
                itemBuilder: (context, index) => CardItem(
                      item: items[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Product(item: items[index], dao: dao,))),
                    ))));
  }
}

class CardItem extends StatelessWidget {
  late Item item;
  late Function press;

  CardItem({required this.item, required this.press});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(bottom: 20),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            item.image,
            width: 200,
          ),
          Container(
              padding: const EdgeInsets.only(left: DefaultPadding / 2),
              child: Text(
                item.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )),
          Container(
              padding: const EdgeInsets.only(
                  top: DefaultPadding / 2, left: DefaultPadding / 2),
              child: Text(
                "Rs." + "${item.price}" + ".00",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              )),
          Center(
              child: Container(
                  padding: const EdgeInsets.only(
                    top: DefaultPadding / 2,
                  ),
                  child: RaisedButton(
                    child: Text('Buy Now'),
                    elevation: 0,
                    color: TextLightColor,
                    onPressed: () {
                      press();
                    },
                  )))
        ]),
      )
    ]);
  }
}
