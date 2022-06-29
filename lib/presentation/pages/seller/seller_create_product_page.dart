import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class SellerCreateProductPage extends StatefulWidget{
  const SellerCreateProductPage({Key? key}) : super(key: key);

  @override
  State<SellerCreateProductPage> createState() => _SellerCreateProductPageState();
}

class _SellerCreateProductPageState extends State<SellerCreateProductPage> {
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
            SizedBox(height: 10,),
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
            SizedBox(height: 80,),
            ElevatedButton(
                onPressed: (){
                },
                child: Text(
                    "Add Product"
                )
            )
          ],
        ),
      ),
    );
  }
}