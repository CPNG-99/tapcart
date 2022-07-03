import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';

class SellerProfilePage extends StatefulWidget{
  const SellerProfilePage({Key? key}) : super(key: key);

  @override
  State<SellerProfilePage> createState() => _SellerProfilePageState();
}

class _SellerProfilePageState extends State<SellerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              Center(
                child: Stack(
                  children: [
                    Container(
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
                  ]
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              Text("Store Name", style: kButtonText,),
              TextFormField(
                readOnly: true,
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
                readOnly: true,
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
                readOnly: true,
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
              ElevatedButton(
                  onPressed: (){
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(130, 40)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.qr_code_scanner, size: 20,),
                        SizedBox(width: 5,),
                        Text(
                            "QR"
                        ),
                      ],
                    ),
                  )
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, SELLER_EDIT_PROFILE_PAGE);
                  },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}