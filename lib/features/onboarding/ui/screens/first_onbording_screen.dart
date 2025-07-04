import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/features/onboarding/ui/screens/secend_onbording_screen.dart';
import 'package:kuriosity/shared/widgets/action_button.dart';
import 'package:kuriosity/shared/widgets/coustom_appbar.dart';

class FirstOnbordingScreen extends StatefulWidget {
  const FirstOnbordingScreen({super.key});

  @override
  State<FirstOnbordingScreen> createState() => _FirstOnbordingScreenState();
}

class _FirstOnbordingScreenState extends State<FirstOnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              'Become an \neco-influencer \nfor each other',
              style: textTheme.titleLarge,
            ),
            Spacer(),
            Text(
              'Find an effective path to achieve your self-actualization goals of sustainable living',
            ),
            Spacer(),
            ActionButton(
              title: 'Start',
              onPressed: () => Get.off(() => SecendOnbordingScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
