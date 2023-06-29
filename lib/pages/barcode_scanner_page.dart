import 'package:flutter/material.dart';
import 'package:scan_go/controllers/barcode_scanner_controller.dart';
import 'package:scan_go/controllers/cart_controller.dart';
import 'package:scan_go/pages/cart_page.dart';

class BarcodeScannerPage extends StatelessWidget {
  final BarcodeScannerController _barcodeScannerController =
      BarcodeScannerController();
  final CartController _cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await _barcodeScannerController.scanBarcode();
                if (result != '-1') {
                  _cartController.addItem(result);
                }
              },
              child: Text('Scan Barcode'),
            ),
            SizedBox(height: 16.0),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartController: _cartController),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
            SizedBox(height: 8.0),
            Text(
              'Cart (${_cartController.cartItems.length})',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
