import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod/models/product.dart';

const List<Product> allProducts = [
  Product(
    id: 1,
    title: 'Laptop',
    price: 1000,
    image: 'assets/images/laptop.jpg',
  ),
  Product(
    id: 2,
    title: 'Smartphone',
    price: 500,
    image: 'assets/images/smartphone.jpg',
  ),
  Product(
    id: 3,
    title: 'Tablet',
    price: 300,
    image: 'assets/images/tablet.jpg',
  ),
  Product(
    id: 4,
    title: 'Smartwatch',
    price: 200,
    image: 'assets/images/smartwatch.jpg',
  ),
  Product(
    id: 5,
    title: 'Headphones',
    price: 100,
    image: 'assets/images/headphones.jpg',
  ),
  Product(
    id: 6,
    title: 'Camera',
    price: 800,

    image: 'assets/images/camera.jpg',
  ),
  Product(
    id: 7,
    title: 'Printer',
    price: 200,
    image: 'assets/images/printer.jpg',
  ),
  Product(
    id: 8,
    title: 'Monitor',
    price: 300,
    image: 'assets/images/monitor.jpg',
  ),
];
final productsProvider = Provider((ref) => allProducts);
final reducedProductsProvider = Provider((ref) {

  return allProducts.where((product) => product.price < 50).toList();
});