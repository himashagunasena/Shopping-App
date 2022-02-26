import 'package:ecommerce/Data/Dao/cart_dao.dart';
import 'package:ecommerce/Data/entity/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../Data/item.dart';
import '../../Utils/utils.dart';
import 'payment.dart';

class Buy extends StatefulWidget {
  BuyState createState() => BuyState();
  final Item item;

  Buy({required this.item});
}

@override
class BuyState extends State<Buy> {
  Widget build(BuildContext context) {
    bool _istrue = true;
    Size size = MediaQuery.of(context).size;
    int shipping = 250;
    int total = (widget.item.price * widget.item.selectqty) + shipping;
    final _text = TextEditingController();
    bool _validate = false;

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
              "CheckOut",
              style: const TextStyle(color: Colors.black),
            )),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Container(
                    margin: EdgeInsets.all(DefaultPadding),
                    padding: EdgeInsets.only(top: DefaultPadding * 2),
                    child: TextField(
                      controller: _text,
                      decoration: InputDecoration(
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        floatingLabelStyle: TextStyle(color: Colors.orange),
                        border: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.grey, width: 2)),
                        labelText: 'Full Name',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: TextLightColor,
                          ),
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(
                        left: DefaultPadding, right: DefaultPadding),
                    child: TextField(
                      decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: Colors.orange),
                        border: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.grey, width: 2)),
                        labelText: 'Address',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: TextLightColor,
                          ),
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.all(DefaultPadding),
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
                        labelText: 'Phone number',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: TextLightColor,
                          ),
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.all(DefaultPadding),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Shipping Value" + "  Rs $shipping.00",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ))
              ]),
              FlatButton(
                minWidth: size.width,
                height: 52,
                onPressed: () {
                  setState(() {
                    _text.text.isEmpty ? _validate = true : _validate = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Payment(
                              item: widget.item,
                            )),
                  );
                },
                color: TextLightColor,
                child: Padding(
                    padding: EdgeInsets.only(left: DefaultPadding),
                    child: Text(
                      "Buy Rs." + "$total" + ".00",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )),
              )
            ]));
  }
}
