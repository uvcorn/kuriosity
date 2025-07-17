import 'package:flutter/material.dart';

import '../models/course_model.dart';
import '../models/workshop_model.dart';
import 'course_expansion_tile.dart';
import 'premuim_user_resource.dart';

class PremiumCoursesSection extends StatelessWidget {
  final List<CourseModel> demoCourses;
  final WorkshopModel workshop;

  const PremiumCoursesSection({
    super.key,
    required this.demoCourses,
    required this.workshop,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Courses',
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: demoCourses.map((course) {
            return CourseExpansionTile(course: course);
          }).toList(),
        ),
        SizedBox(height: 8),
        PremuimUserResource(workshop: workshop),
      ],
    );
  }
}
