import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final temporaryImage = File(image.path);
      setState((){
        this.image = temporaryImage;
      });
    } on PlatformException catch (e) {
      print("Failed to load image:$e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 487 / 451,
                child:
                image!=null
                    ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kGreySoft),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      image: FileImage(
                        image!,
                      ),
                    ),
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kGreySoft),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    image: const DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          "assets/img/tapcart-medium.png"
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () => pickImage(),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 30)
                    ),
                    child: const Text(
                      "Add Photo", style: TextStyle(fontSize: 10),
                    )
                ),
              ),
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
      ),
    );
  }
}