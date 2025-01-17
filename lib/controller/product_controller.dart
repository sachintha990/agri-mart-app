import 'package:get/get.dart';

class Product {
  final String name;
  final String imageUrl;
  final String price;

  Product({required this.name, required this.imageUrl, required this.price});
}

class ProductController extends GetxController {
  var productList = <Product>[].obs; // Reactive product list
  var isLoading = false.obs;

  get products => null; // Observable to manage loading state

  @override
  void onInit() {
    super.onInit();
    fetchProducts(); // Call to load products on initialization
    
  }

  void fetchProducts() async {
    isLoading.value = true; // Start loading
    try {
      // Simulate a delay to mimic an API call
      await Future.delayed(const Duration(seconds: 2));

      // Simulated fetched data
      var fetchedProducts = [
        Product(
          name: 'Potato',
          imageUrl: 'assets/product/potato.png',
          price: '240.00',
        ),
        Product(
          name: 'Potato',
          imageUrl: 'assets/product/potato.png',
          price: '240.00',
        ),
        Product(
          name: 'Potato',
          imageUrl: 'assets/product/potato.png',
          price: '240.00',
        ),
        Product(
          name: 'Potato',
          imageUrl: 'assets/product/potato.png',
          price: '240.00',
        ),
        
        
      ];

      productList.value = fetchedProducts; // Update product list
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
