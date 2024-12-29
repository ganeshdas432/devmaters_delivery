import 'package:devmaters_delivery/fetaures/home/view/page/homepage.dart';
import 'package:devmaters_delivery/fetaures/introduction/presentation/pages/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              decoration: PageDecoration(pageColor: Colors.white),
              title: "Welcome to My App",
              body: "Discover features that enhance your experience.",
              image: Center(child: Image.asset('assets/res/introduction_1.jpg')),
            ),
            PageViewModel(
              decoration: PageDecoration(pageColor: Colors.white),
              title: "Stay Connected",
              body: "Connect with people and stay updated.",
              image: Center(child: Image.asset('assets/res/introduction_2.jpg')),
            ),
            PageViewModel(
              decoration: PageDecoration(pageColor: Colors.white),
              title: "Get Started",
              body: "Tap below to begin your journey!",
              image: Center(child: Image.asset('assets/res/introduction_3.jpg'),),
              footer: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Save state and navigate to HomePage
                    box.write('seenIntro', true); // Mark intro as seen
                    Get.off(AuthWrapper()); // Navigate to HomePage
                  },
                  child: Text("Let's Go!"),
                ),
              ),
            ),
          ],
          onDone: () {
            box.write('seenIntro', true); // Mark intro as seen
            Get.off(AuthWrapper()); // Navigate to HomePage
          },
          showSkipButton: true,
          skip: Text("Skip"),
          next: Icon(Icons.arrow_forward),
          done: Text("Done", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
