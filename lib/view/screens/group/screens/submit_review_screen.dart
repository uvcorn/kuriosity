import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/core/app_routes/app_routes.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';

class SubmitReviewScreen extends StatefulWidget {
  const SubmitReviewScreen({super.key});

  @override
  State<SubmitReviewScreen> createState() => _SubmitReviewScreenState();
}

class _SubmitReviewScreenState extends State<SubmitReviewScreen> {
  int _rating = 0;
  final TextEditingController _controller = TextEditingController();

  void _setRating(int index) {
    setState(() {
      _rating = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Text(
              'How was the workshops?',
              style: textTheme.bodyLarge?.copyWith(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: index < _rating ? Colors.blue : Colors.grey,
                    size: 32,
                  ),
                  onPressed: () => _setRating(index + 1),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: _controller,
                  maxLines: 5,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Share your experience on workshops',
                    hintStyle: textTheme.bodyMedium?.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.bottomNavBar);
              },
              child: Container(
                height: 45,
                width: 300,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  AppStrings.done,
                  style: textTheme.bodySmall?.copyWith(color: AppColors.white),
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
