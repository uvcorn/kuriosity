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
        preferredSize: Size.fromHeight(40),
        child: CustomAppbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 82),
              Text(
                'Become an \neco-influencer \nfor each other',
                style: textTheme.titleLarge,
              ),
              SizedBox(height: 322),
              Text(
                'Find an effective path to achieve \nyour self-actualization goals \nof sustainable living',
              ),
              SizedBox(height: 82),
              ActionButton(
                title: 'Start',
                onPressed: () => Get.off(() => SecendOnbordingScreen()),
              ),
              SizedBox(height: 57),
            ],
          ),
        ),
      ),
    );
  }
}
