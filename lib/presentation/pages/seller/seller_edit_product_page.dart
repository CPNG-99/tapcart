import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/domain/entities/product/product.dart';

class SellerEditProductPage extends StatefulWidget{
  final Product product;
  const SellerEditProductPage({Key? key, required  this.product}) : super(key: key);

  @override
  State<SellerEditProductPage> createState() => _SellerEditProductPageState();
}

class _SellerEditProductPageState extends State<SellerEditProductPage> {
  late bool isAvail = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name", style: kButtonText,),
            SizedBox(height: 10,),
            TextFormField(
              controller: TextEditingController(text:  widget.product.productName),
              cursorColor: Colors.grey,
              cursorHeight: 20,
              keyboardType: TextInputType.name,
              validator: (value) {
                if(value!.isEmpty){
                  return "This field cannot be empty";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Product Name",
              ),
            ),
            SizedBox(height: 10,),
            Text("Price", style: kButtonText,),
            SizedBox(height: 10,),
            TextFormField(
              controller: TextEditingController(text:  widget.product.price.toString()),
              cursorColor: Colors.grey,
              cursorHeight: 20,
              keyboardType: TextInputType.number,
              validator: (value) {
                if(value!.isEmpty){
                  return "This field cannot be empty";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Price",
              ),
            ),
            SizedBox(height: 80,),
            ElevatedButton(
                onPressed: (){
                },
                child: Text(
                    "Save"
                )
            )
          ],
        ),
      ),
    );
  }
}