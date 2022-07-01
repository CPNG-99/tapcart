import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class BuyerDetailCartArgs {
  final String purchaseId;
  final String qrCode;
  final int total;

  BuyerDetailCartArgs(this.purchaseId, this.qrCode, this.total);
}

class BuyerDetailCart extends StatelessWidget {
  final BuyerDetailCartArgs args;

  const BuyerDetailCart({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UriData? base64Image = Uri.parse(args.qrCode).data;
    final image = base64Image?.contentAsBytes();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kGreySoft,
                      border: Border.all(color: kGreySoft)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: image != null
                        ? Image.memory(
                            image,
                            fit: BoxFit.cover,
                          )
                        : Container(),
                  ),
                ),
                Center(
                  child: Text(
                    args.purchaseId,
                    style: kSubtitle,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: kButtonText,
                      ),
                      Text(
                        args.total.toString(),
                        style: kButtonText,
                      ),
                    ],
                  ),
                  const ElevatedButton(
                      onPressed: null,
                      child: Center(
                        child: Text("Delete Cart"),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
