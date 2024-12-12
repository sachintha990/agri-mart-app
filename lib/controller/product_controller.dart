import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product {
  final String name;
  final String imageUrl;
  final String price;

  Product({required this.name, required this.imageUrl, required this.price});
}

class ProductController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() {
    // Simulated API call
    var fetchedProducts = [
      Product(
        name: 'Potato',
        imageUrl: 'https://s3-alpha-sig.figma.com/img/97e3/ef17/2268d95452808e7f4e7868160412c57c?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lsJei6qKPzRsXT6o9EgB7xwRn6TgKXeeY~RqKqteOGEy0XQMhB8UzPjnJs4pLNkLsyQaiv4oKQlZlAKFGB996~8zYYaqPzrwue1fcAiGsxYIi1TsYc2-bdFQ06zR~4zIsPyUgcxQT9TvhXsbIwq-t26vrs6DTA~UjZrWlYL4TNeozxsM9DC5sEh8SMpVoYIUNwMqjT7sGrOsQyZr9gJxPOfUhVonUNmqx16oEvWvnuJd1FUrtjXXVvDRQV2ltX1N8qpjIEMjSnv8ZnrwVRVq7RiSjAJqmG~P0BsEf~5jgCrFgJNzAXKPfBeN34l7Ddcc01ngUkZiOrDbI01TCVghQA__' ,
        price: '240.00',
        
      ),
      Product(
        name: 'Eggplant',
        imageUrl: 'https://s3-alpha-sig.figma.com/img/8c10/a023/df3776e2328cccf76fbeb1f602f99ea4?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JUyJiEPsjaQN0B8sI-5vKYF8F0Ld7mAhct9eVckaOsMMEd5apNAskigz~aGV~eD8fB2FQbyios6PwXr1z4-n8O9KGGUfhfwcmJ-kyAN8WPXK6mqShMpWsDhQMlDxmmYiN1AYZ9PkXwtWwcaH2Z-CaVuxSJ~JmxS6zYXDshWbsDZ-7Nu5EQkm279jUe0aN0mh7S9LjTkBt~icjALnBORTYVM0LBDRMOW-WQuyTwEPWSF7yShoXxA~-ZwxjEvZwKBv8w7~BNtGYC~GoT5suED-7JakFJPvsdMYxJuMXpkmuwi7uyK5Suh34h4MtQnjVVA8WYWPeaXnOdwpfdsKDnAtcA__',
        price: '240.00',
      ),
      Product(
        name: 'Green Chili',
        imageUrl: 'https://s3-alpha-sig.figma.com/img/1a99/3406/3ffeb8340a36d00273b42c194876787a?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kr-LdlWj2gJ1S74uFIWRhe7actOEUUVKwWJx4Gi6jf3-c27QzbMXoHAX6um0v-BiqvxhTOAd73S3AYxP40DmClzSanJdM3GX8rnREcSY5Ruc0WFsbauEgKJL0ttRq-~hlMNrDjf4OysZT4mO-8eMmW0JQy9yzH3v0ffUr0NeBfOCFEvPdzCuNIqCc6uKh5yN3rW26CC~wwB09gxbLKOnd1K4MABrJUuN9vXC-yKN8aqd-nxyFxt5ustCyRZwtbmb-uVxhqdFJ~E3aW0xIbwSk5B5z6QLmoMDk32bDzndHpra3dDNkG~bY51wckIaZf9LxGzHGUJsusnjVl0UuRdM7g__',
        price: '240.00',
      ),
    ];

    productList.value = fetchedProducts;
  }
}
