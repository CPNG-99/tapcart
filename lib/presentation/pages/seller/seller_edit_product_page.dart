import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/domain/entities/product/createDTO.dart';
import 'package:tapcart/domain/entities/product/product.dart';
import 'package:tapcart/presentation/bloc/product/update_product/update_product_bloc.dart';

class SellerEditProductPage extends StatefulWidget {
  final Product product;
  const SellerEditProductPage({Key? key, required this.product})
      : super(key: key);

  @override
  State<SellerEditProductPage> createState() => _SellerEditProductPageState();
}

class _SellerEditProductPageState extends State<SellerEditProductPage> {
  final _formKey = GlobalKey<FormState>();
  late bool isAvail = true;
  late String base64Image;
  File? image;
  final _nameProductController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _nameProductController.text = widget.product.productName;
      _priceController.text = widget.product.price.toString();
      base64Image = widget.product.image ?? "";
    });
  }

  _updateProduct() {
    CreateDTO payload = CreateDTO(
        productName: _nameProductController.text,
        image: base64Image,
        price: int.parse(_priceController.text),
        isAvailable: isAvail);
    context
        .read<UpdateProductBloc>()
        .add(OnUpdateProductEvent(payload, widget.product.productId));
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final temporaryImage = File(image.path);
      Uint8List imageBytes = await temporaryImage.readAsBytes();

      setState(() {
        base64Image = base64.encode(imageBytes);
        this.image = temporaryImage;
      });
    } on PlatformException catch (e) {
      print("Failed to load image:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _image = base64Decode(widget.product.image ?? "");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 487 / 451,
                  child: image != null
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
                      : widget.product.image != null
                          ? Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kGreySoft),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                    image: MemoryImage(_image)),
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
                                      "assets/img/tapcart-medium.png"),
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
                Text(
                  "Name",
                  style: kButtonText,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameProductController,
                  cursorColor: Colors.grey,
                  cursorHeight: 20,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field cannot be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Product Name",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Price",
                  style: kButtonText,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _priceController,
                  cursorColor: Colors.grey,
                  cursorHeight: 20,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field cannot be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Price",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Product Status",
                  style: kButtonText,
                ),
                SizedBox(
                  height: 10,
                ),
                isAvail
                    ? Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isAvail = !isAvail;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  maximumSize: Size(170, 50)),
                              child: Text("Available")),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                  maximumSize: Size(170, 50)),
                              child: Text("Unavailable"))
                        ],
                      )
                    : Row(
                        children: [
                          ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                  maximumSize: Size(170, 50)),
                              child: Text("Available")),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isAvail = !isAvail;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  maximumSize: Size(170, 50)),
                              child: Text("Unavailable"))
                        ],
                      ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _updateProduct();
                        Navigator.pushNamed(context, SELLER_PAGE);
                      }
                    },
                    child: Text("Save"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
