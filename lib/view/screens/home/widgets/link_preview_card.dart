// // lib/screens/home/widgets/link_preview_card.dart
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart'; // Import for launching URLs

// import '../../../../utils/app_colors/app_colors.dart';
// import '../../../components/custom_image/custom_image.dart';
// import 'link_metadata.dart'; // Import the LinkMetadata class

// class LinkPreviewCard extends StatelessWidget {
//   final LinkMetadata metadata;

//   const LinkPreviewCard({super.key, required this.metadata});

//   @override
//   Widget build(BuildContext context) {
//     // Don't show the card if there's no meaningful content
//     if (metadata.title.isEmpty &&
//         metadata.description.isEmpty &&
//         metadata.imageUrl == null) {
//       return const SizedBox.shrink();
//     }

//     return GestureDetector(
//       onTap: () async {
//         if (metadata.url != null && metadata.url!.isNotEmpty) {
//           final uri = Uri.parse(metadata.url!);
//           if (await canLaunchUrl(uri)) {
//             await launchUrl(uri);
//           } else {
//             // Handle the error, e.g., show a snackbar
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Could not launch ${metadata.url}')),
//             );
//           }
//         }
//       },
//       child: Card(
//         margin: const EdgeInsets.only(top: 10), // Add some top margin
//         elevation: 1,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image section
//               if (metadata.imageUrl != null && metadata.imageUrl!.isNotEmpty)
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(6),
//                   child: CustomImage(
//                     imageSrc: metadata.imageUrl!,
//                     sizeWidth: 100, // Fixed width for the preview image
//                     sizeHeight: 100, // Fixed height for the preview image
//                     fit: BoxFit.cover,
//                   ),
//                 )
//               else
//                 // Placeholder if no image is available
//                 Container(
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: AppColors.backgroundLightGray,
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: Icon(
//                     Icons.link,
//                     color: AppColors.mediumGray,
//                     size: 40,
//                   ),
//                 ),
//               const SizedBox(width: 10), // Spacing between image and text
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Title
//                     Text(
//                       metadata.title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     // Description
//                     Text(
//                       metadata.description,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(color: Colors.grey[600], fontSize: 13),
//                     ),
//                     const SizedBox(height: 4),
//                     // URL Host (e.g., example.com)
//                     Text(
//                       metadata.url != null ? Uri.parse(metadata.url!).host : '',
//                       style: TextStyle(color: Colors.grey[400], fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
