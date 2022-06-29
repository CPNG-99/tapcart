import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

import '../../../domain/entities/product/product.dart';

class SellerDetailProductPage extends StatefulWidget{
  final Product product;
  const SellerDetailProductPage({required this.product, Key? key}) : super(key: key);

  @override
  State<SellerDetailProductPage> createState() => _SellerDetailProductPageState();
}

class _SellerDetailProductPageState extends State<SellerDetailProductPage> {
  late bool isAvail = widget.product.isAvailable;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.product.image ?? "",
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.4),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.productName, style: kHeading,),
                  Text(widget.product.price.toString(),
                    style: TextStyle(
                      fontSize: 22,
                      color: kLightBrown,
                      fontWeight: FontWeight.bold
                  ), ),
                  SizedBox(height: 20,),
                  Text("Category", style: kButtonText,),
                  Text("Snack", style: kSubtitle,),

                  SizedBox(height: 20,),
                  Text("Product Status", style: kButtonText,),
                  SizedBox(height: 10,),
                  isAvail
                  ? Row(
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            setState((){
                              isAvail = !isAvail;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size(170, 50)
                          ),
                          child: Text(
                              "Available"
                          )
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size(170, 50)
                          ),
                          child: Text(
                              "Unavailable"
                          )
                      )
                    ],
                  )
                  : Row(
                    children: [
                      ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size(170, 50)
                          ),
                          child: Text(
                              "Available"
                          )
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(
                          onPressed: (){
                            setState((){
                              isAvail = !isAvail;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size(170, 50)
                          ),
                          child: Text(
                              "Unavailable"
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Manage Product", style: kButtonText,),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              maximumSize: Size(170, 50)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit, size: 18,),
                              SizedBox(width: 5,),
                              Text(
                                  "Edit"
                              ),
                            ],
                          )
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            maximumSize: Size(170, 50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete, size: 18, color: kRedSoft,),
                              SizedBox(width: 5,),
                              Text(
                                  "Delete", style: TextStyle(color: kRedSoft),
                              ),
                            ],
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}