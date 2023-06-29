import 'package:scan_go/models/cart_item_model.dart';

class CartController {
  List<CartItemModel> cartItems = [];

  void addItem(String barcode) {
  final existingItemIndex = cartItems.indexWhere((item) => item.barcode == barcode);

  if (existingItemIndex != -1) {
    cartItems[existingItemIndex].quantity++;
  } else {
    cartItems.add(CartItemModel(barcode: barcode));
  }
}


  void removeItem(String barcode) {
    cartItems.removeWhere((item) => item.barcode == barcode);
  }

  void increaseQuantity(String barcode) {
    final item = cartItems.firstWhere((item) => item.barcode == barcode);
    item.quantity++;
  }

  void decreaseQuantity(String barcode) {
    final item = cartItems.firstWhere((item) => item.barcode == barcode);
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      cartItems.remove(item);
    }
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }
}
