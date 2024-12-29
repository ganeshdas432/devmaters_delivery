import 'dart:math';
import 'package:devmaters_delivery/fetaures/cart/cart_page.dart';
import 'package:devmaters_delivery/fetaures/orders/model/cart_order_item.dart';
import 'package:devmaters_delivery/fetaures/porter/view/page/porter_details_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../home/controllers/my_location_picker_controller.dart';
import '../model/cart_model.dart';

class CartController extends GetxController {
  // Observable list to hold cart items
  RxList<CartItem> cartItems = <CartItem>[].obs;
  List<CartOrderitem> cartOrderItemList = [];

  RxDouble distance = 00.00.obs;
  String googleAPIKey = dotenv.env['GOOGLE_API_KEY']!;
  final MyLocationPickerController myLocationPickerController = Get.find();



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
          addCartOrderList(
            CartOrderitem(productId: newItem.productId!,
                productName: newItem.productName.toString(),
                productPrice: newItem.price!,
                quantity: newItem.quantity,
                selectedAttribute: newItem.selectedAttribute!)
          );
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

        addCartOrderList(
            CartOrderitem(productId: newItem.productId!,
                productName: newItem.productName.toString(),
                productPrice: newItem.price!,
                quantity: newItem.quantity,
                selectedAttribute: newItem.selectedAttribute!)
        );
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
        Get.to(CartPage()); // Replace '/cart' with your cart route name
      },
      onCancel: () {
        Get.back(); // Close the dialog and allow the user to continue shopping
      },
    );
  }
  // Function to clear the cart
  void clearCart() {
    cartItems.clear();
    cartOrderItemList.clear();
  }

  void removeCartItem(int productId) {
    cartItems.removeWhere((item) => item.productId == productId);
    cartOrderItemList.removeWhere((item) => item.productId == productId);
    cartItems.refresh();

  }

  // Other functions, such as removing an item, getting total price, etc.
  // Getter to calculate the subtotal of all items in the cart
  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + (item.price! * item.quantity));
  }

  double get delivery_charge {
    return 12*distance.value;
  }

  // Additional function to get total price if there are other fees (e.g., tax, delivery fee)
  double get totalPrice {
    return subtotal + 0.0 + delivery_charge;
  }


  double calculateDistance(lat1, lon1, lat2, lon2) {
    const double radius = 6371; // Earth's radius in kilometers
    double dLat = _deg2rad(lat2 - lat1);
    double dLon = _deg2rad(lon2 - lon1);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_deg2rad(lat1)) * cos(_deg2rad(lat2)) *
            sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return radius * c;
  }

  double _deg2rad(double deg) {
    return deg * (pi / 180);
  }

  getDistance() async {
    try {

      print("Shop lat"+cartItems.first.shoplat!.toString());

      PolylinePoints polylinePoints = PolylinePoints();
      LatLng _pickedLocation = LatLng(cartItems.first.shoplat!, cartItems.first.shoplong!);
      LatLng _destLocation = LatLng(myLocationPickerController.pickuplat.toDouble(), myLocationPickerController.pickuplong.toDouble());

      PointLatLng startPoint = PointLatLng(_pickedLocation.latitude, _pickedLocation.longitude);
      PointLatLng endPoint = PointLatLng(_destLocation.latitude, _destLocation.longitude);

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        request: PolylineRequest(
          origin: startPoint,
          destination: endPoint,
          mode: TravelMode.driving,
        ),
        googleApiKey: googleAPIKey,
      );

      if (result.points.isNotEmpty) {
        print('Route points: ${result.points}');

        if (result.points.length > 1) {
          double totalDistance = 0.0;
          for (int i = 0; i < result.points.length - 1; i++) {
            totalDistance += calculateDistance(
                result.points[i].latitude,
                result.points[i].longitude,
                result.points[i + 1].latitude,
                result.points[i + 1].longitude);
          }
          distance.value = double.parse(totalDistance.toStringAsFixed(2));
          print("Total distance: ${totalDistance.toStringAsFixed(2)} km");
        } else {
          print("Only one route point found. No route distance calculated.");
        }
      } else {
        print('No route found.');
      }
    } catch (e) {
      print('Error fetching route: $e');
    }
  }

  addCartOrderList(CartOrderitem cartorderitem){
    cartOrderItemList.add(cartorderitem);
  }






}
