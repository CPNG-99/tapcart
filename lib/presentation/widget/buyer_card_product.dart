import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class BuyerCardProduct extends StatefulWidget{

  @override
  State<BuyerCardProduct> createState() => _BuyerCardProductState();
}

class _BuyerCardProductState extends State<BuyerCardProduct> {
  // final Product product;
  late int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  "https://cdn.discordapp.com/attachments/856786757516918784/984871033486078012/pexels-riccardo-bertolo-4245826.jpg",
                  fit: BoxFit.cover,
                ),
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
                  'Farm House Lembang',
                  style: kTitleCardText,
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Rp 50.000', style: kSubtitleCard),
              ],
            ),
          )
        ],
      ),
    );
  }
}