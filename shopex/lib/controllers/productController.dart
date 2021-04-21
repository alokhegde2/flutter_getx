import 'package:get/get.dart';
import 'package:shopex/models/product.dart';
import 'package:shopex/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = List<Product>().obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading(false);
    }
  }
}
