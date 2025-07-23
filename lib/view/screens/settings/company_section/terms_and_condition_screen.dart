import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
              // vertical: screenHeight * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Expanded(
                      child: Text(
                        AppStrings.introduction,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  "This app is your go-to platform for discovering, sharing, and embracing eco-friendly habits in everyday life. Whether you’re passionate about sustainable food, green products, or reducing waste, you’ll find a supportive community ready to inspire and connect with you. Share your own experiences through photos, videos, and posts, and join group sessions to learn and collaborate on sustainability projects.",
                  style: textTheme.bodyMedium,
                ),
                SizedBox(height: 16),
                Text(
                  "Our goal is to make sustainable living easy, engaging, and social. Explore categorized topics, participate in workshops, and connect with like-minded people who care about making a positive impact on the planet.",
                  style: textTheme.bodyMedium,
                ),
                SizedBox(height: 24),
                Text("Key Features:", style: textTheme.bodyMedium),
                SizedBox(height: 12),
                _BulletPoint(
                  text: "Share multimedia posts focused on sustainability.",
                ),
                _BulletPoint(
                  text: "Comment, react, and chat with community members.",
                ),
                _BulletPoint(
                  text:
                      "Join group sessions and events to learn and collaborate.",
                ),
                _BulletPoint(
                  text:
                      "Browse categories like eco-friendly cooking, green fashion, and more.",
                ),
                _BulletPoint(
                  text:
                      "Track and celebrate your own sustainable lifestyle efforts.",
                ),
                SizedBox(height: 24),
                Text(
                  "Thank you for being part of this movement toward a greener future!",
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 14)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
