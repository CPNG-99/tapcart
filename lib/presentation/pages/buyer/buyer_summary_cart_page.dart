import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';
import 'package:tapcart/domain/entities/product/product.dart';
import 'package:tapcart/presentation/widget/buyer_summary_card.dart';

class BuyerSummaryCartPage extends StatefulWidget {
  final List<CartItems> cartItems;

  const BuyerSummaryCartPage({Key? key, required this.cartItems})
      : super(key: key);

  @override
  State<BuyerSummaryCartPage> createState() => _BuyerSummaryCartPageState();
}

class _BuyerSummaryCartPageState extends State<BuyerSummaryCartPage> {
  late int _price = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.cartItems) {
      setState(() {
        _price += item.total;
      });
    }
  }

  // late int _counter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, idx) {
                  final CartItems item = widget.cartItems[idx];
                  return BuyerSummaryCard(product: item);
                },
                itemCount: widget.cartItems.length,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: kButtonText,
                    ),
                    Text(
                      _price.toString(),
                      style: kButtonText,
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, BUYER_DETAIL_CART_PAGE);
                    },
                    child: const Center(
                      child: Text("Create Cart"),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
