import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../utils/product_description/product.dart';
import '../../widget/home/product_detail/product_description.dart';
import '../../widget/home/product_detail/product_image.dart';
import '../../widget/home/product_detail/top_rounded_container.dart';

import '../cart/my_cart_screen.dart';


class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<Product> cartItems = []; // Cart items list

  @override
  Widget build(BuildContext context) {
    final product = demoProducts[0]; // Example product, you can change this

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(product: product),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavbar(product),
    );
  }

  Widget _buildBottomNavbar(Product product) {
    return TopRoundedContainer(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 15),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                padding: const EdgeInsets.all(12),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF156650)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.favorite_border_rounded,
                    size: 20,
                  ),
                ),
              ),
              const Gap(15),
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cartItems.add(product); // Add product to cart
                    });

                    // Navigate to the AddToCartScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCartScreen(cartItems: cartItems),
                      ),
                    );
                  },
                  child: const Text("Add To Cart"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
