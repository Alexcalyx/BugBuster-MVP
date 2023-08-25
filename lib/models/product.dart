class Product {
  final String name;
  final String teamEmail;

  Product(this.name, this.teamEmail);
}

class ProductService {
  final List<Product> _products = [];

  List<Product> getAllProducts() => _products;
  void addProduct(Product product) => _products.add(product);
// ... More methods for editing, removing, etc.
}