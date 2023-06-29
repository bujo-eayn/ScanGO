import 'package:flutter/material.dart';
import 'package:scan_go/pages/barcode_scanner_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Scan Go',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarcodeScannerPage(),
    );
  }
}
