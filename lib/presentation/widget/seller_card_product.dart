import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/domain/entities/product/product.dart';

class SellerCardProduct extends StatelessWidget {
  final Product product;

  const SellerCardProduct(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UriData? base64Image = Uri.parse(product.image).data;
    final image = base64Image?.contentAsBytes();

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
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: Image.memory(
                  image!,
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
                  product.productName,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(product.price.toString(),
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}