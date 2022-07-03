import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tapcart/common/constants.dart';

class SellerEditProfilePage extends StatefulWidget{
  const SellerEditProfilePage({Key? key}) : super(key: key);

  @override
  State<SellerEditProfilePage> createState() => _SellerEditProfilePageState();
}

class _SellerEditProfilePageState extends State<SellerEditProfilePage> {
  // final _formKey = GlobalKey<FormState>();
  late String base64string;
  File? image;
  // final _nameProductController = TextEditingController();
  // final _priceController = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final temporaryImage = File(image.path);

      Uint8List imageBytes = await temporaryImage.readAsBytes();

      setState(() {
        base64string = base64.encode(imageBytes);
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
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: kGreySoft),
                    borderRadius: BorderRadius.circular(100),
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
                        fixedSize: const Size(120, 30)),
                    child: const Text(
                      "Add Photo",
                      style: TextStyle(fontSize: 10),
                    )),
              ),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              Text("Store Name", style: kButtonText,),
              TextFormField(
                controller: TextEditingController(text:  "widget.product.price.toString()"),
                cursorColor: Colors.grey,
                cursorHeight: 20,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value!.isEmpty){
                    return "This field cannot be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Store Name",
                ),
              ),
              const SizedBox(height: 10,),
              Text("Store Address", style: kButtonText,),
              TextFormField(
                controller: TextEditingController(text:  "widget.product.price.toString()"),
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
                  hintText: "Store Address",
                ),
              ),
              const SizedBox(height: 10,),
              Text("Open Hour", style: kButtonText,),
              TextFormField(
                controller: TextEditingController(text:  "widget.product.price.toString()"),
                cursorColor: Colors.grey,
                cursorHeight: 20,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if(value!.isEmpty){
                    return "This field cannot be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Open Hour",
                ),
              ),
              const SizedBox(height: 10,),
              const SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: (){
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, size: 18,),
                      SizedBox(width: 5,),
                      Text(
                          "Save"
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}