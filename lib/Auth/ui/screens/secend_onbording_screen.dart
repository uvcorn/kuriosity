import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/Auth/ui/screens/third_onbording_screen.dart';
import 'package:kuriosity/Auth/ui/widgets/action_button.dart';

class SecendOnbordingScreen extends StatefulWidget {
  const SecendOnbordingScreen({super.key});

  @override
  State<SecendOnbordingScreen> createState() => _SecendOnbordingScreenState();
}

class _SecendOnbordingScreenState extends State<SecendOnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              'It’s easy to become \nan eco-influencer!',
              style: textStyle.titleLarge,
            ),
            Spacer(),
            Text('1. Build dialog with people', style: textStyle.bodyMedium),
            SizedBox(height: 16),
            Text(
              'Post your lifestyle, ask questions, and \ncelebrate the small win toward a healthy \nplanet',
              style: textStyle.bodySmall,
            ),
            SizedBox(height: 32),
            Text('2. Join group activities', style: textStyle.bodyMedium),
            SizedBox(height: 16),
            Text(
              'Want to learn how to eat healthy, drive \neco-friendly, and grow a beautiful garden \nin your backyard? Let’s do it together',
              style: textStyle.bodySmall,
            ),
            SizedBox(height: 32),
            Text('3. Share your knowledge', style: textStyle.bodyMedium),
            SizedBox(height: 16),
            Text(
              'Become a power influencer by hosting \nyour own workshops. The more you share \nvaluable tips, the more eco-friendly future',
              style: textStyle.bodySmall,
            ),
            SizedBox(height: 32),
            ActionButton(
              title: 'Next',
              onPressed: () => Get.off(ThirdOnbordingScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
