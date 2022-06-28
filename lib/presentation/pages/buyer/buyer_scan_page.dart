import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/presentation/widget/qr_scanner_overlay.dart';

class BuyerScanPage extends StatefulWidget {
  const BuyerScanPage({Key? key}) : super(key: key);


  @override
  State<BuyerScanPage> createState() => _BuyerScanPageState();
}

class _BuyerScanPageState extends State<BuyerScanPage> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scan Merchant'),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: Stack(
          children: [
            MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) {
                  if (barcode.rawValue == null) {
                    debugPrint('Failed to scan Barcode');
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to scan Barcode')));
                  } else {
                    final String code = barcode.rawValue!;
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(code)));
                    debugPrint('Barcode found! $code');
                    Navigator.pushNamed(
                        context,
                        BUYER_MERCHANT_PAGE,
                        arguments: code
                    );
                  }
                }
            ),
            QRScannerOverlay(overlayColour: kLightBrown.withOpacity(0.1)),
          ],
        )
    );
  }
}


