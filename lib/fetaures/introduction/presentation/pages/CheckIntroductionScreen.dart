import 'package:devmaters_delivery/fetaures/home/view/page/homepage.dart';
import 'package:devmaters_delivery/fetaures/introduction/presentation/pages/IntroductionPage.dart';
import 'package:devmaters_delivery/fetaures/introduction/presentation/pages/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class CheckIntroductionScreen extends StatelessWidget {
  final box = GetStorage(); // GetStorage instance

  @override
  Widget build(BuildContext context) {
    // Check if introduction screen was shown
    bool hasSeenIntro = box.read('seenIntro') ?? false;
    print("hasSeenIntro"+hasSeenIntro.toString());

    if (hasSeenIntro) {
      return AuthWrapper(); // Navigate to HomePage if already seen
    } else {
      return IntroductionPage(); // Show introduction screen if not
    }
  }
}
