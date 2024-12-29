import 'package:devmaters_delivery/fetaures/home/controllers/home_controller.dart';
import 'package:devmaters_delivery/fetaures/orders/controller/OrderController.dart';
import 'package:devmaters_delivery/fetaures/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebase
  await dotenv.load(fileName: ".env");
  Get.lazyPut(() => HomeController(), tag: "Home Controller");
  Get.lazyPut(() => OrderController(),tag: "Order Controller");
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
              surfaceTintColor: Colors.white
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom().copyWith(
            backgroundColor: const WidgetStatePropertyAll(Colors.green),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),
              shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))
          )
        ),
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
          color: Colors.white
        )
      ),
      home: SplashScreen(),
    );
  }
}



