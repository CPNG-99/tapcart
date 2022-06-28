import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/domain/entities/product/product.dart';

class BuyerCardProduct extends StatefulWidget{
  final Product product;

  const BuyerCardProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<BuyerCardProduct> createState() => _BuyerCardProductState();
}

class _BuyerCardProductState extends State<BuyerCardProduct> {
  late int _counter = 0;

  void _setQty(quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> selectedItems = {
      "prouctId": widget.product.productId,
      "qty": quantity as int,
      "total": quantity*widget.product.price,
    };

    String encodedMap = json.encode(selectedItems);
    print(encodedMap);

    prefs.setString(widget.product.productId, encodedMap);
  }

  void _getCounter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedMap = prefs.getString(widget.product.productId) ?? "0";
    if(encodedMap!="0"){
      Map<String,dynamic> decodedMap = json.decode(encodedMap);
      setState(() {
        _counter = decodedMap["qty"];
      });
    }
    //
    // print(decodedMap);
    // print(decodedMap["qty"]);
  }
  void _removeCart() async{
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
    if(_counter>1) {
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

  @override
  Widget build(BuildContext context) {
    // final UriData? base64Image = Uri.parse(widget.product.image).data;
    // final image = base64Image?.contentAsBytes();
    _getCounter();
    return Container(
      height: 500,
      child: Card(
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kGrey, width: 0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        shadowColor: kGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment(0.9,1.6),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.product.image),
                    ),
                  ),
                ),
                _counter!=0
                 ? Container(
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kGreySoft.withOpacity(0.8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState((){
                              _decrementCounter();
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: kLightBrown,
                            ),
                            child: Icon(Icons.remove, size: 13,color: Colors.white,),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(_counter.toString())
                        ),
                        GestureDetector(
                          onTap: () {
                            _incrementCounter();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: kLightBrown,
                            ),
                            child: Icon(Icons.add, size: 13,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  )
                : GestureDetector(
                  onTap: () {
                    setState((){
                      _incrementCounter();
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kGreySoft.withOpacity(0.8),
                    ),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: kLightBrown,
                      ),
                      child: Icon(Icons.add, size: 13,color: Colors.white,),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    widget.product.productName,
                    style: kTitleCardText,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(widget.product.price.toString(), style: kSubtitleCard),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}