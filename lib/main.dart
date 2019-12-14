import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp>{

  GlobalKey qrKey = GlobalKey();

  var qrtexto = "";

  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Column(

      children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(key: qrKey,
            overlay: QrScannerOverlayShape(
              borderRadius: 10,
              borderColor: Colors.red,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300 ),
             onQRViewCreated: _onQRviewCreated),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(child: Text('resultado do scanner: $qrtexto'),),
                      ),
                    ],
                  ),
                );
              }
            
              @override
              void dispose(){
                controller?.dispose();
                super.dispose();
              }
            
  void _onQRviewCreated(QRViewController controller) {

    this.controller = controller;
    controller.scannedDataStream.listen((scanData){
      setState(() {
       qrtexto = scanData;
      });
    });

  }
}
