import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../c_search_bar.dart';
import 'chat_list_item.dart';
import 'new_message_dialog/new_message_dialog.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  @override
  Widget build(BuildContext context) {
    // final TextEditingController _searchController = TextEditingController();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CSearchbar(hinttext: AppStrings.searchforMessage),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const NewMessageDialog();
                      },
                    );
                  },
                  child: CustomImage(imageSrc: AppIcons.addchat),
                ),
              ],
            ),
            Text(
              AppStrings.message,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15, // widget.comments.length
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.chatsScreen),
                    child: ChatListItem(
                      userImage: AppConstants.profileImage,
                      username: AppStrings.userName,
                      commentText: AppStrings.commentTex,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
