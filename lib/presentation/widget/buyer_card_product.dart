import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/domain/entities/product/product.dart';

class BuyerCardProduct extends StatefulWidget{
  final Product product;

  const BuyerCardProduct({Key? key, required this.product}) : super(key: key);


  @override
  State<BuyerCardProduct> createState() => _BuyerCardProductState();
}

class _BuyerCardProductState extends State<BuyerCardProduct> {

  late int counter = 0;
  @override
  Widget build(BuildContext context) {
    // final UriData? base64Image = Uri.parse(widget.product.image).data;
    // final image = base64Image?.contentAsBytes();

    return SizedBox(
      height: 400,
      width: 350,
      child: Card(
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
                ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5)),
                  child: Image.network(
                    widget.product.image,
                    fit: BoxFit.cover,
                  )
                ),
                counter!=0
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
                              counter=counter-1;
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
                          child: Text(counter.toString())
                        ),
                        GestureDetector(
                          onTap: () {
                            setState((){
                              counter=counter+1;
                            });
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
                      counter=counter+1;
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