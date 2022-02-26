import 'package:ecommerce/Data/entity/cart_item.dart';
import 'package:ecommerce/Data/item.dart';
import 'package:ecommerce/Data/Dao/cart_dao.dart';
import 'package:ecommerce/Presentation/View/cart.dart';
import 'package:ecommerce/Utils/utils.dart';
import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Data/database/database.dart';
import '../buy.dart';

class BottomBtn extends StatelessWidget {
  final Item item;
  final CartDao dao;

  const BottomBtn({
    required this.item,
    required this.dao,
  });

  @override
  Widget build(BuildContext context) {
    final id = UniqueKey().hashCode;

    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: 50,
        color: TextLightColor,
        margin: EdgeInsets.only(top: DefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () async {
                  try {
                    var cartItem =
                        await dao.getCartItemByUid('not_sign', item.id);
                    if (cartItem != null) {
                      cartItem.qty += 1;
                      await dao.updateCartItem(cartItem);
                      //showSnackBar(context, 'update item in cart success');
                    } else {
                      CartItem cartItem = CartItem(
                          price: item.price,
                          name: item.title,
                          image: item.image,
                          qty: item.qty,
                          uid: "not_sign",
                          selecteqty: item.selectqty,
                          itemid: id);
                      await dao.insertCartItem(cartItem);

                      //showSnackBar(context, "insert itm into the cart");
                    }
                  } catch (e) {
                    showSnackBar(context, "");
                  }
                },
                child: const Padding(
                    padding: EdgeInsets.only(left: DefaultPadding),
                    child: Text(
                      "Add Cart",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ))),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Buy( item: item,)),
                  );
                },
                child: Padding(
                    padding: EdgeInsets.only(right: DefaultPadding),
                    child: Text("Buy",
                        style: TextStyle(fontSize: 16, color: Colors.black))))
          ],
        ));
  }

  void showSnackBar(BuildContext context, String s) {
    void Save() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cart(dao: dao)),
      );
      setState(() {
        item.selectqty;
      });
    }

    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('$s'),
        action: SnackBarAction(label: "view cart", onPressed: Save)));
  }

  void setState(Null Function() param0) {}
}
