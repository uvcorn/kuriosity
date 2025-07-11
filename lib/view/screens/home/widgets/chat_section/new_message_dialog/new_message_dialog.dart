import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_strings.dart/app_strings.dart';
import 'selected_users_row.dart';
import 'suggested_user_tile.dart';

class NewMessageDialog extends StatefulWidget {
  const NewMessageDialog({super.key});

  @override
  State<NewMessageDialog> createState() => _NewMessageDialogState();
}

class _NewMessageDialogState extends State<NewMessageDialog> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<String> _suggestedUsers = [
    "Diana Baldwin",
    "John Doe",
    "Jane Smith",
    "Peter Jones",
    "Alice Wonderland",
    "Robert Green",
    "Emily White",
    "Michael Brown",
    "Sarah Black",
    "David Grey",
    "Olivia Red",
    "William Blue",
  ];

  final List<String> _selectedUsers = [];
  List<String> _filteredSuggestedUsers = [];

  @override
  void initState() {
    super.initState();
    _filteredSuggestedUsers = _suggestedUsers;
    _searchController.addListener(_onSearchChanged);
    _onSearchChanged();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredSuggestedUsers = _suggestedUsers.where((user) {
        return !_selectedUsers.contains(user) &&
            user.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _toggleUserSelection(String user) {
    setState(() {
      if (_selectedUsers.contains(user)) {
        _selectedUsers.remove(user);
      } else {
        _selectedUsers.add(user);
      }
      _onSearchChanged();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
        height: screenHeight * 0.6,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.newMessage,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),

            Divider(color: AppColors.lightBorder, height: 0),

            // Chips + Search Input
            SelectedUsersRow(
              selectedUsers: _selectedUsers,
              searchController: _searchController,
              scrollController: _scrollController,
              onUserRemoved: _toggleUserSelection,
            ),

            Divider(color: AppColors.lightBorder, height: 0),

            const SizedBox(height: 8),

            // Suggested Users Title
            Text(
              AppStrings.suggested,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Suggested Users List
            Expanded(
              child: ListView.builder(
                itemCount: _filteredSuggestedUsers.length,
                itemBuilder: (context, index) {
                  final user = _filteredSuggestedUsers[index];
                  return SuggestedUserTile(
                    user: user,
                    selected: _selectedUsers.contains(user),
                    onTap: () => _toggleUserSelection(user),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Action Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedUsers.isEmpty
                    ? null
                    : () {
                        Navigator.of(context).pop();
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.chatsScreen),
                  child: Text(
                    _selectedUsers.length <= 1
                        ? AppStrings.chatButton
                        : '${AppStrings.groupChatButton} (${_selectedUsers.length})',
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
