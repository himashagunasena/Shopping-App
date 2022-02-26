import 'package:ecommerce/Data/item.dart';
import 'package:ecommerce/Utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterBtn extends StatefulWidget {
  CounterBtnState createState() => CounterBtnState();
  late Item item;
  CounterBtn({Key? key, required this.item}) : super(key: key);
}

class CounterBtnState extends State<CounterBtn> {
  int _n = 0;
  bool sold = false;
  void add() {
    setState(() {
      widget.item.selectqty++;

    });
  }

  void minus() {
    setState(() {
      if ( widget.item.selectqty != 0)  widget.item.selectqty--;

    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.item.selectqty> widget.item.qty && sold == false) {
      sold = true;
    }

    return Row(
      children: <Widget>[
        FlatButton(
          minWidth: 24,
          height: 50,
          onPressed: add,
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 20,
          ),
          color: TextLightColor,
        ),
        SizedBox(
            width: 40,
            child: Text(
              '${widget.item.selectqty}',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            )),
        FlatButton(
          minWidth: 20,
          height: 50,
          onPressed: minus,
          child: const Icon(
            Icons.remove,
            color: Colors.black,
            size: 20,
          ),
          color: TextLightColor,
        ),
        Visibility(visible: sold, child: Sold())
      ],
    );
  }
}

class Sold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: DefaultPadding),
        child: Text(
      "Sold Out",
      style: TextStyle(color: Colors.red),
    ));
  }
}
