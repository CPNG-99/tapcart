import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';

class BuyerSummaryCard extends StatefulWidget {
  final CartItems product;

  const BuyerSummaryCard({Key? key, required this.product}) : super(key: key);

  @override
  State<BuyerSummaryCard> createState() => _BuyerSummaryCardState();
}

class _BuyerSummaryCardState extends State<BuyerSummaryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kGrey, width: 0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      shadowColor: kGrey,
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 120,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),
              child: Image.network(
                widget.product.image,
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
                    widget.product.total.toString(),
                    style: kSubtitle,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: kLightBrown.withOpacity(0.8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child:
                                    Text(widget.product.quantity.toString())),
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
