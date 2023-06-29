import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerController {
  Future<String> scanBarcode() async {
    final result = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      false,
      ScanMode.BARCODE,
    );
    return result;
  }
}
