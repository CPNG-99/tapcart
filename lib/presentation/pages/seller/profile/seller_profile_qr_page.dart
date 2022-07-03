import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tapcart/domain/entities/store/store.dart';

class SellerProfileQrPage extends StatefulWidget {
  final Store store;
  const SellerProfileQrPage({Key? key, required this.store}) : super(key: key);

  @override
  State<SellerProfileQrPage> createState() => _SellerProfileQrPageState();
}

class _SellerProfileQrPageState extends State<SellerProfileQrPage> {
  @override
  Widget build(BuildContext context) {
    final _image = base64Decode(widget.store.qrCode);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Qr"),
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
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  image: MemoryImage(_image),
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
