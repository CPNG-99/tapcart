import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';
import 'package:tapcart/domain/entities/product/product.dart';

class BuyerCardProduct extends StatefulWidget {
  final Product product;
  final void Function(CartItems data) setCart;

  const BuyerCardProduct(
      {Key? key, required this.product, required this.setCart})
      : super(key: key);

  @override
  State<BuyerCardProduct> createState() => _BuyerCardProductState();
}

class _BuyerCardProductState extends State<BuyerCardProduct> {
  late int _counter = 0;


  void _setQty(quantity) async {
    late CartItems data = CartItems(
        quantity as int,
        quantity * widget.product.price,
        widget.product.productName,
        widget.product.image ?? "",
        widget.product.productId);
    widget.setCart(data);
  }

  void _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedMap = prefs.getString(widget.product.productId) ?? "0";
    if (encodedMap != "0") {
      Map<String, dynamic> decodedMap = json.decode(encodedMap);
      setState(() {
        _counter = decodedMap["qty"];
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _setQty(_counter);
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _setQty(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    final UriData? base64Image = Uri.parse(widget.product.image ?? "").data;
    final image = base64Image?.contentAsBytes();

    _getCounter();
    return SizedBox(
      height: 500,
      child: Card(
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: kGrey, width: 0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        shadowColor: kGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: image != null
                  ? Stack(
                      alignment: const Alignment(0.9, 1.6),
                      children: [
                        Image.memory(
                          image,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: const BorderRadius.only(
                        //         topLeft: Radius.circular(5),
                        //         topRight: Radius.circular(5)),
                        //     image: DecorationImage(
                        //       alignment: Alignment.center,
                        //       fit: BoxFit.fill,
                        //       image: MemoryImage(image),
                        //     ),
                        //   ),
                        // ),
                        _counter != 0
                            ? Container(
                                height: 35,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: kGreySoft.withOpacity(0.8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        setState(() {
                                          _decrementCounter();
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: kLightBrown,
                                        ),
                                        child: const Icon(
                                          Icons.remove,
                                          size: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(_counter.toString())),
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        _incrementCounter();
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: kLightBrown,
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          size: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  setState(() {
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
                                    child: const Icon(
                                      Icons.add,
                                      size: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                      ],
                    )
                  : Container(),
            ),
            const SizedBox(
              height: 10,
            ),
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
                  const SizedBox(
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
