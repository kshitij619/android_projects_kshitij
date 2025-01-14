class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.currency = '₹',
  });
  final int id;
  final String name;
  final double price;
  final String image;
  final String currency;
}
