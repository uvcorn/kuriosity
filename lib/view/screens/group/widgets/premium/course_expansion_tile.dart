// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../models/course_model.dart';

class CourseExpansionTile extends StatefulWidget {
  final CourseModel course;

  const CourseExpansionTile({super.key, required this.course});

  @override
  State<CourseExpansionTile> createState() => _CourseExpansionTileState();
}

class _CourseExpansionTileState extends State<CourseExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: Get.height * 0.015),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            _isExpanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_right,
                            color: AppColors.primary,
                          ),
                          Expanded(
                            child: Text(
                              widget.course.title,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (!_isExpanded)
                    Padding(
                      padding: EdgeInsets.only(left: 24),
                      child: _buildExpansionBottom(textTheme),
                    ),
                ],
              ),
              if (_isExpanded) ...[
                SizedBox(height: Get.height * 0.015),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.description,
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      _buildExpansionBottom(textTheme),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpansionBottom(TextTheme textTheme) {
    return Row(
      children: [
        Text(
          widget.course.date,
          style: textTheme.bodySmall?.copyWith(color: AppColors.black),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoutes.workshopVideoConference);
          },
          child: Text(AppStrings.join),
        ),
      ],
    );
  }
}
