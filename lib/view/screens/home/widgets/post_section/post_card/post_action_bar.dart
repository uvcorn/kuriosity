// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../../utils/app_colors/app_colors.dart';
// import '../../../../../../utils/app_icons/app_icons.dart';
// import '../../../../../components/custom_image/custom_image.dart';
// import '../../comment_section/comment_draggable_sheet.dart';
// import '../../../controllers/post_card_controller.dart';
// import '../share_menu.dart';

// class PostActionBar extends StatelessWidget {
//   final String postId;
//   const PostActionBar({super.key, required this.postId});

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final PostCardController postCardController = Get.find<PostCardController>(
//       tag: postId,
//     );

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Expanded(
//           child: GestureDetector(
//             onTap: postCardController
//                 .toggleReactionOptions, // Trigger reaction popup
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Obx(
//                 () => Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CustomImage(
//                       imageSrc:
//                           postCardController
//                               .selectedReactionIconPath
//                               .value
//                               .isNotEmpty
//                           ? postCardController.selectedReactionIconPath.value
//                           : AppIcons.handshake, // Default 'like' icon
//                       size: 20,
//                       imageColor:
//                           postCardController
//                               .selectedReactionIconPath
//                               .value
//                               .isNotEmpty
//                           ? AppColors
//                                 .primary // Assuming primary color for active reaction
//                           : AppColors.gray, // Default color
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       'Like', // Changed to "Like" as per Facebook style
//                       style: textTheme.bodyMedium?.copyWith(
//                         color:
//                             postCardController
//                                 .selectedReactionIconPath
//                                 .value
//                                 .isNotEmpty
//                             ? AppColors.primary
//                             : AppColors.gray,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: GestureDetector(
//             onTap: () {
//               // Open comment sheet
//               showModalBottomSheet(
//                 isScrollControlled: true,
//                 context: context,
//                 backgroundColor: Colors.transparent,
//                 builder: (_) => const CommentDraggableSheet(comments: []),
//               );
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CustomImage(
//                     imageSrc: AppIcons.chats,
//                     size: 20,
//                     imageColor: AppColors.gray,
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     'Comment',
//                     style: textTheme.bodyMedium?.copyWith(
//                       color: AppColors.gray,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: GestureDetector(
//             onTap: () {
//               showModalBottomSheet(
//                 isScrollControlled: true,
//                 context: context,
//                 backgroundColor: Colors.transparent,
//                 builder: (_) => const ShareMenu(), // Open share menu
//               );
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CustomImage(
//                     imageSrc: AppIcons.share,
//                     size: 20,
//                     imageColor: AppColors.gray,
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     'Share',
//                     style: textTheme.bodyMedium?.copyWith(
//                       color: AppColors.gray,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
