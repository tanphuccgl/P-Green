import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:p_green/utils/bottom_navi.dart';
import 'package:p_green/utils/dialog.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  static const String routeName = "/QRViewExample";
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: const BottomNar(index: 1,),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),

        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
   // bool a = false;

    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() async {
        result = scanData;
        if (result != null ) {
     //     a = true;
          await controller.pauseCamera();
          showOk(controller,result!.code);

      }else
        {
          controller.pauseCamera();
          showCancel(controller);
        }


      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  void showOk(QRViewController controller,String data) {
    var alert = new AlertDialog1(
      title: "",
      description: data,
      onPressed: () {
        setState(() {
          Navigator.pop(context);

          controller.resumeCamera();
        });
      },
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return alert;
        });
  }

  void showCancel(QRViewController controller) {
    var alert = new AlertDialog1(
      title: "ERROR",
      description: "Invalid QR code",
      onPressed: () {
Navigator.pop(context);
        controller.resumeCamera();
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}