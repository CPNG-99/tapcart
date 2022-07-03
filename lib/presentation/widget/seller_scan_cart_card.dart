import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/domain/entities/cart/get_cart.dart';

class SellerScanCartCard extends StatefulWidget {
  final GetCartItems cartItems;

  const SellerScanCartCard({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<SellerScanCartCard> createState() => _SellerScanCartCard();
}

class _SellerScanCartCard extends State<SellerScanCartCard> {
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
                widget.cartItems.image,
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
                    widget.cartItems.productName,
                    style: kButtonText,
                  ),
                  Text(
                    widget.cartItems.price.toString(),
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
                                Text(widget.cartItems.quantity.toString())),
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