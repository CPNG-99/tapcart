import 'package:flutter/material.dart';
import 'package:tapcart/domain/entities/store/store.dart';

class SellerProfileQrPage extends StatefulWidget{
  final Store store;
  const SellerProfileQrPage({Key? key,required this.store}) : super(key: key);

  @override
  State<SellerProfileQrPage> createState() => _SellerProfileQrPageState();
}

class _SellerProfileQrPageState extends State<SellerProfileQrPage> {
  @override
  Widget build(BuildContext context) {
    final UriData? base64Image = Uri.parse(widget.store.qrCode).data;
    final image = base64Image?.contentAsBytes();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Qr"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5)),
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  image: MemoryImage(image!),
                ),
              ),
            ),
            Text(widget.store.storeId),
          ],
        ),
      ),
    );
  }
}