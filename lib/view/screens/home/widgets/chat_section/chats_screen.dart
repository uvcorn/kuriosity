import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../c_search_bar.dart';
import '../post_section/post_card/user_info_section.dart';
import 'new_message_dialog/new_message_dialog.dart';
import 'user_chat_menu.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    // final TextEditingController _searchController = TextEditingController();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 0,
        title: UserInfoSection(
          username: AppStrings.userName,
          subtitle: AppStrings.userTitle,
          imageUrl: AppConstants.profileImage,
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) => const UserChatMenu(),
            );
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: [
            //     Expanded(
            //       child: CSearchbar(hinttext: AppStrings.searchforMessage),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return const NewMessageDialog();
            //           },
            //         );
            //       },
            //       child: CustomImage(imageSrc: AppIcons.addchat),
            //     ),
            //   ],
            // ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: 5,
                itemBuilder: (context, index) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
