// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import 'workshop_detailed_content.dart';
import 'workshop_image_content.dart';
import 'workshop_page_indicator.dart';

class WorkshopCard extends StatefulWidget {
  final String title;
  final String instructorName;
  final String date;
  final List<String> tags;
  final int participants;
  final int spacesLeft;
  final String profileImageUrl;
  final String profileImage2Url;
  final List<String>? fullImageUrls;
  final bool isFinished;

  const WorkshopCard({
    super.key,
    required this.title,
    required this.instructorName,
    required this.date,
    required this.tags,
    required this.participants,
    required this.spacesLeft,
    required this.profileImageUrl,
    this.fullImageUrls,
    required this.profileImage2Url,
    this.isFinished = false,
  });

  @override
  State<WorkshopCard> createState() => _WorkshopCardState();
}

class _WorkshopCardState extends State<WorkshopCard> {
  final PageController _pageController = PageController();
  double _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double cardHeight = Get.height * 0.33;
    final List<String> imageSlides = widget.fullImageUrls ?? [];
    final int totalPages = 1 + imageSlides.length;

    return Card(
      color: AppColors.backgroundWhite,
      margin: EdgeInsets.symmetric(
        // vertical: Get.height * 0.002,
        horizontal: Get.width * 0.02,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: cardHeight,
        width: Get.width * 0.95,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: totalPages,
              itemBuilder: (context, index) {
                final diff = index - _currentPageValue;
                final scale = 1.0 - (diff.abs() * 0.05);
                final offset = diff * (Get.width * 0.02);

                Widget child;
                if (index == 0) {
                  child = WorkshopDetailedContent(
                    title: widget.title,
                    instructorName: widget.instructorName,
                    date: widget.date,
                    tags: widget.tags,
                    participants: widget.participants,
                    spacesLeft: widget.spacesLeft,
                    profileImageUrl: widget.profileImageUrl,
                    profileImage2Url: widget.profileImage2Url,
                  );
                } else {
                  child = WorkshopImageContent(
                    imageUrl: imageSlides[index - 1],
                    title: widget.title,
                    instructorName: widget.instructorName,
                    profileImageUrl: widget.profileImageUrl,
                  );
                }

                return Transform.scale(
                  scale: scale.clamp(1, 1),
                  child: Transform.translate(
                    offset: Offset(offset, 0),
                    child: child,
                  ),
                );
              },
            ),
            // SizedBox(height: 8),
            if (totalPages > 1)
              WorkshopPageIndicator(
                totalPages: totalPages,
                currentPageValue: _currentPageValue,
              ),
            if (widget.isFinished)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
