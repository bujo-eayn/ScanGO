import 'package:flutter/material.dart';
import 'package:scan_go/controllers/cart_controller.dart';
import 'package:scan_go/models/cart_item_model.dart';

class CartPage extends StatelessWidget {
  final CartController cartController;

  CartPage({required this.cartController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartController.cartItems[index];
                return ListTile(
                  title: Text(cartItem.barcode),
                  subtitle: Text('Quantity: ${cartItem.quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => cartController.decreaseQuantity(cartItem.barcode),
                        icon: Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: () => cartController.increaseQuantity(cartItem.barcode),
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Total Price: \$${cartController.getTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement checkout functionality
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
