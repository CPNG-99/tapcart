import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/domain/entities/product/product.dart';

class BuyerSummaryCard extends StatefulWidget {
  final Product product;

  const BuyerSummaryCard({Key? key, required this.product}) : super(key: key);

  @override
  State<BuyerSummaryCard> createState() => _BuyerSummaryCardState();
}

class _BuyerSummaryCardState extends State<BuyerSummaryCard> {
  void _setQty(quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> selectedItems = {
      "prouctId": widget.product.productId,
      "qty": quantity,
      "total": quantity * widget.product.price,
    };

    String encodedMap = json.encode(selectedItems);

    prefs.setString(widget.product.productId, encodedMap);
  }

  void _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedMap = prefs.getString(widget.product.productId) ?? "0";
    Map<String, dynamic> decodedMap = json.decode(encodedMap);
    setState(() {
      _counter = decodedMap["qty"];
    });
  }

  void _removeCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(widget.product.productId);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _setQty(_counter);
    });
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
        _setQty(_counter);
      });
    } else {
      setState(() {
        _counter--;
        _removeCart();
      });
    }
  }

  late int _counter = 0;

  @override
  Widget build(BuildContext context) {
    _getCounter();
    if (_counter == 0) {
      return Container();
    } else {
      return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kGrey, width: 0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        shadowColor: kGrey,
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
                child: Image.network(
                  widget.product.image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.productName,
                      style: kButtonText,
                    ),
                    Text(
                      widget.product.price.toString(),
                      style: kSubtitle,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kGreySoft.withOpacity(0.8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _decrementCounter();
                                  });
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kLightBrown,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(_counter.toString())),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _incrementCounter();
                                  });
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kLightBrown,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
