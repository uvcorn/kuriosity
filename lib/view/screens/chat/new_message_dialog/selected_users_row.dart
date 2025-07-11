import 'package:flutter/material.dart';

import '../../../../utils/app_strings.dart/app_strings.dart';

class SelectedUsersRow extends StatelessWidget {
  final List<String> selectedUsers;
  final TextEditingController searchController;
  final ScrollController scrollController;
  final Function(String) onUserRemoved;

  const SelectedUsersRow({
    required this.selectedUsers,
    required this.searchController,
    required this.scrollController,
    required this.onUserRemoved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            "To:",
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...selectedUsers.map(
                    (user) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(
                        label: Text(user),
                        onDeleted: () => onUserRemoved(user),
                        deleteIcon: const Icon(Icons.close, size: 18),
                        backgroundColor: const Color(0xFFDEE9FB),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        padding: const EdgeInsets.all(4),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:
                        searchController.text.isEmpty && selectedUsers.isEmpty
                        ? 100
                        : null,
                    child: IntrinsicWidth(
                      stepWidth: 10,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: AppStrings.searchHint,
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
