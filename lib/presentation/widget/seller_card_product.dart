import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/domain/entities/product/product.dart';

class SellerCardProduct extends StatefulWidget {
  final Product product;

  const SellerCardProduct(this.product, {Key? key}) : super(key: key);

  @override
  State<SellerCardProduct> createState() => _SellerCardProductState();
}

class _SellerCardProductState extends State<SellerCardProduct> {
  @override
  Widget build(BuildContext context) {
    // final UriData? base64Image = Uri.parse(widget.product.image).data;
    // final image = base64Image?.contentAsBytes();

    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kGrey, width: 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: kGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5)),
                child: Image.network(
                  widget.product.image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                )
              ),
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
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(widget.product.price.toString(),
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}