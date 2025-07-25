// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';

class GroupCapacityDesign extends StatefulWidget {
  const GroupCapacityDesign({super.key});

  @override
  _GroupCapacityDesignState createState() => _GroupCapacityDesignState();
}

class _GroupCapacityDesignState extends State<GroupCapacityDesign> {
  final TextEditingController _controller = TextEditingController(text: '0');

  int get _capacity => int.tryParse(_controller.text) ?? 0;

  void _updateCapacity(int value) {
    setState(() {
      _controller.text = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.groupCapacity, style: textTheme.bodyMedium),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 120,
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Icon(Icons.keyboard_arrow_up, size: 20),
                        onTap: () => _updateCapacity(_capacity + 1),
                      ),
                      InkWell(
                        child: Icon(Icons.keyboard_arrow_down, size: 20),
                        onTap: () =>
                            _updateCapacity(_capacity > 0 ? _capacity - 1 : 0),
                      ),
                    ],
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                ),
                onChanged: (text) {
                  // Optional: Validate input
                  final value = int.tryParse(text);
                  if (value == null || value < 0) {
                    _controller.text = '0';
                  }
                },
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 4),
            Text(
              AppStrings.participants,
              style: TextStyle(color: AppColors.black, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
