import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class SellerCardProduct extends StatelessWidget{

  // final Product product;
  //
  // SellerCardProduct(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: kGrey, width: 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: kGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              child: Image.network(
                  "https://cdn.discordapp.com/attachments/856786757516918784/984871033486078012/pexels-riccardo-bertolo-4245826.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Farm House Lembang',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Lembang', style: TextStyle(fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}