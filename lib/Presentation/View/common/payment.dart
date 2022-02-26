import 'package:ecommerce/Data/Dao/cart_dao.dart';
import 'package:ecommerce/Data/entity/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Data/item.dart';
import '../../../Utils/utils.dart';

class Payment extends StatelessWidget {
  final Item item;
  Payment({required this.item});

  @override
  Widget build(BuildContext context) {
    bool _istrue = true;
    Size size = MediaQuery.of(context).size;
    int shipping = 250;
    int total = (item.price * item.selectqty) + shipping;

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
              "Payment",
              style: const TextStyle(color: Colors.black),
            )),
        body: Column(

            children: [
              Column(children: [
                Container(
                    margin: EdgeInsets.all(DefaultPadding),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Choose Payment Method",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )),
                Container(
                  margin: EdgeInsets.only(top: DefaultPadding),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minWidth: size.width * 3 / 4,
                      height: 52,
                      onPressed: () {},
                      color: TextLightColor,
                      child: Text(
                        " Cash on delivery",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(top: DefaultPadding * 3),
                    alignment: Alignment.center,
                    child: Text(
                      "or",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )),
                Container(
                    margin: EdgeInsets.all(DefaultPadding),
                    padding: EdgeInsets.only(top: DefaultPadding),
                    child: TextField(
                      decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: Colors.orange),
                        border: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.grey, width: 2)),
                        labelText: 'Card Holder Name',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: TextLightColor,
                          ),
                        ),
                      ),
                    )),
                Row(children: [
                  Container(
                      margin: EdgeInsets.all(DefaultPadding),
                      width: size.width *2/ 4,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(color: Colors.orange),
                          border: UnderlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.grey, width: 2)),
                          labelText: 'Card Number',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: TextLightColor,
                            ),
                          ),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.all(DefaultPadding),
                      width: size.width*1/ 3.5,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(color: Colors.orange),
                          border: UnderlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.grey, width: 2)),
                          labelText: 'CVV',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: TextLightColor,
                            ),
                          ),
                        ),
                      )),
                ])
              ]),
              Container(
                margin: EdgeInsets.only(top: DefaultPadding*4),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: size.width * 3 / 4,
                    height: 52,
                    onPressed: () {},
                    color: TextLightColor,
                    child: Text(
                      " Buy  Rs $total.00",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    )),
              ),
            ]));
  }
}
