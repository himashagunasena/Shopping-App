import 'package:ecommerce/Data/Dao/cart_dao.dart';
import 'package:ecommerce/Data/entity/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../Data/item.dart';
import '../../Utils/utils.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();

  final CartDao dao;
  Cart({Key? key, required this.dao}) : super(key: key);
}

class _CartState extends State<Cart> {

  Widget build(BuildContext context) {
bool _istrue= true;

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
          centerTitle: true,
          title: Text(
            "My Cart",
            style: const TextStyle(color: Colors.black),
          )),
      body: StreamBuilder(
        stream: widget.dao.getAllCartItemByUid("not_sign"),
        builder: (context, snapshot) {
          var product = snapshot.data as List<CartItem>;
          return Column(
            children: [

              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    if(items[index].selectqty==0){ }
                    return Card(
                      elevation: 0,
                      color: Colors.white,
                      margin: EdgeInsets.only(
                          top: DefaultPadding, left: DefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(items[index].image),
                        Align(
                            alignment: Alignment.centerLeft,
                          child:Column(

                            children: [

                                  Container(
                                      margin:
                                          EdgeInsets.only(left: DefaultPadding,top: DefaultPadding),
                                      child: Text(
                                        items[index].title,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      )),
                              Container(
                                  margin:
                                  EdgeInsets.only(top: DefaultPadding/2,left: DefaultPadding),
                                  child: Text(
                                    "Rs ${items[index].price} .00",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  )),
                        Container(
                          margin:
                          EdgeInsets.only(top: DefaultPadding/2,left: DefaultPadding),
                          child: Text("${items[index].selectqty}"))
                            ],
                          )),
                          Container( margin:
                          EdgeInsets.only(left: DefaultPadding*2),child: IconButton(icon:Icon(Icons.delete), onPressed: () async{
                            if (item!=0){

                            setState(() {

    }
                            );};},),)
                        ],

                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
