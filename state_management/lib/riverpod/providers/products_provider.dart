import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/riverpod/models/product.dart';

part 'products_provider.g.dart';

const List<Product> allProducts = [
  Product(
    id: 1,
    title: 'Laptop',
    price: 1000,
    image: 'assets/products/backpack.png',
  ),
  Product(
    id: 2,
    title: 'Smartphone',
    price: 500,
    image: 'assets/products/drum.png',
  ),
  Product(
    id: 3,
    title: 'Tablet',
    price: 300,
    image: 'assets/products/guitar.png',
  ),
  Product(
    id: 4,
    title: 'Smartwatch',
    price: 200,
    image: 'assets/products/jeans.png',
  ),
  Product(
    id: 5,
    title: 'Headphones',
    price: 100,
    image: 'assets/products/karati.png',
  ),
  Product(
    id: 6,
    title: 'Camera',
    price: 800,
    image: 'assets/products/shorts.png',
  ),
  Product(
    id: 7,
    title: 'Printer',
    price: 200,
    image: 'assets/products/skates.png',
  ),
  Product(
    id: 8,
    title: 'Monitor',
    price: 300,
    image: 'assets/products/suitcase.png',
  ),
];
// final productsProvider = Provider((ref) => allProducts);
// final reducedProductsProvider = Provider((ref) {
//   return allProducts.where((product) => product.price < 500).toList();
// });
@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<Product> reducedProducts(ref) {
  return allProducts.where((product) => product.price < 500).toList();
}
