class CartItemModel {
  final String barcode;
  double price;
  int quantity;

  CartItemModel({
    required this.barcode,
    this.price = 0.0,
    this.quantity = 1,
  });
}
