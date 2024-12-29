import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class CartController extends GetxController {
  // Observable list to hold cart items
  RxList<CartItem> cartItems = <CartItem>[].obs;

  // Function to check if the cart is empty or has products from another shop
  bool _isDifferentShop(int shopId) {
    return cartItems.isNotEmpty && cartItems.first.shopId != shopId;
  }

  // Function to add a product to the cart
  void addProductToCart(CartItem newItem) {
    if (_isDifferentShop(newItem.shopId!)) {
      // Show a dialog if the product is from a different shop
      Get.defaultDialog(
        title: "Switch Shop?",
        content: Text(
            "Your cart already contains items from another shop. Would you like to clear the cart and add items from this shop instead?"),
        textCancel: "No",
        textConfirm: "Yes",
        confirmTextColor: Colors.white,
        onConfirm: () {
          // Clear cart and add the new item
          cartItems.clear();
          cartItems.add(newItem);
          Get.back(); // Close the dialog
        },
      );
    } else {
      // Add item to cart directly if it's the same shop
      var existingItemIndex =
      cartItems.indexWhere((item) => item.productId == newItem.productId);

      if (existingItemIndex != -1) {
        // If the product is already in the cart, increase the quantity
        cartItems[existingItemIndex].quantity++;
        cartItems.refresh();
      } else {
        // Otherwise, add as a new item
        cartItems.add(newItem);
      }
      _showCartOptionsDialog();

    }
  }
  void _showCartOptionsDialog() {
    Get.defaultDialog(
      title: "Product Added",
      content: Text("The product has been added to your cart."),
      textCancel: "Add More",
      textConfirm: "View Cart",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(); // Close the dialog
        // Navigate to the Cart screen
        Get.toNamed('/cart'); // Replace '/cart' with your cart route name
      },
      onCancel: () {
        Get.back(); // Close the dialog and allow the user to continue shopping
      },
    );
  }
  // Function to clear the cart
  void clearCart() {
    cartItems.clear();
  }

  // Other functions, such as removing an item, getting total price, etc.
  // Getter to calculate the subtotal of all items in the cart
  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + (item.price! * item.quantity));
  }

  // Additional function to get total price if there are other fees (e.g., tax, delivery fee)
  double totalPrice({double tax = 0, double deliveryFee = 0}) {
    return subtotal + tax + deliveryFee;
  }
}
