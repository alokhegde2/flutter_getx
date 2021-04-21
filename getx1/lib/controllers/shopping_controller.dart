import 'package:get/get.dart';
import 'package:getx1/models/product.dart';

class ShoppingController extends GetxController {
  //items we want to bind it to our ui

  var products = List<Product>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: "some description about product",
          productImage: "adb",
          productName: "FirstProd"),
      Product(
          id: 2,
          price: 40,
          productDescription: "some description about product",
          productImage: "cdb",
          productName: "SecProd"),
      Product(
          id: 3,
          price: 60,
          productDescription: "some description about product",
          productImage: "zbc",
          productName: "ThirProd"),
    ];

    products.value = productResult;
  }
}
