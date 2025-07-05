import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/shared/widgets/action_button.dart';
import 'package:kuriosity/features/onboarding/ui/screens/third_onbording_screen.dart';

class SecendOnbordingScreen extends StatefulWidget {
  const SecendOnbordingScreen({super.key});

  @override
  State<SecendOnbordingScreen> createState() => _SecendOnbordingScreenState();
}

class _SecendOnbordingScreenState extends State<SecendOnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 106),
              Text(
                'It’s easy to become \nan eco-influencer!',
                style: textTheme.titleLarge,
              ),
              SizedBox(height: 44),
              Text('1. Build dialog with people', style: textTheme.bodyMedium),
              SizedBox(height: 22),
              Text(
                'Post your lifestyle, ask questions, and \ncelebrate the small win toward a healthy \nplanet',
                style: textTheme.bodySmall,
              ),
              SizedBox(height: 23),
              Divider(
                height: 0,
                thickness: 1,
                color: Colors.grey[300],
                indent: 5,
                endIndent: 5,
              ),
              SizedBox(height: 41),
              Text('2. Join group activities', style: textTheme.bodyMedium),
              SizedBox(height: 22),
              Text(
                'Want to learn how to eat healthy, drive \neco-friendly, and grow a beautiful garden \nin your backyard? Let’s do it together',
                style: textTheme.bodySmall,
              ),
              SizedBox(height: 32),
              SizedBox(height: 23),
              Divider(
                height: 0,
                thickness: 1,
                color: Colors.grey[300],
                indent: 5,
                endIndent: 5,
              ),
              SizedBox(height: 41),
              Text('3. Share your knowledge', style: textTheme.bodyMedium),
              SizedBox(height: 22),
              Text(
                'Become a power influencer by hosting \nyour own workshops. The more you share \nvaluable tips, the more eco-friendly future',
                style: textTheme.bodySmall,
              ),
              SizedBox(height: 104),
              ActionButton(
                title: 'Next',
                onPressed: () => Get.off(() => ThirdOnbordingScreen()),
              ),
              SizedBox(height: 57),
            ],
          ),
        ),
      ),
    );
  }
}
