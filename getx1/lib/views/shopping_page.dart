import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/controllers/cartControler.dart';
import 'package:getx1/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Add to Cart'),
                            ),
                            // Obx(() => IconButton(
                            //       icon: controller
                            //               .products[index].isFavorite.value
                            //           ? Icon(Icons.check_box_rounded)
                            //           : Icon(Icons
                            //               .check_box_outline_blank_outlined),
                            //       onPressed: () {
                            //         controller.products[index].isFavorite
                            //             .toggle();
                            //       },
                            //     ))
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            //To make the things visible
            GetX<CartController>(builder: (controller) {
              return Text("Total Amount: \$ ${controller.totalPrice}");
            }),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.add_shopping_cart),
        label: GetX<CartController>(
          builder: (controller) {
            return Text("${controller.count.toString()}");
          }
        ),
      ),
    );
  }
}
