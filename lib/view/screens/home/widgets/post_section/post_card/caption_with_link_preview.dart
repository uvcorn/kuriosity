import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:any_link_preview/any_link_preview.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_strings.dart/app_strings.dart';

class CaptionWithLinkPreview extends StatelessWidget {
  final String caption;

  const CaptionWithLinkPreview({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final linkElements = linkify(
      caption,
    ).whereType<LinkableElement>().cast<LinkableElement>().toList();

    final firstUrl = linkElements.isNotEmpty ? linkElements.first.url : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Linkify(
            text: caption,
            onOpen: (link) async {
              final url = Uri.parse(link.url);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            style: textTheme.bodySmall?.copyWith(color: AppColors.black),
            linkStyle: textTheme.bodySmall?.copyWith(color: AppColors.primary),
          ),
        ),
        if (firstUrl != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AnyLinkPreview(
              link: firstUrl,
              cache: const Duration(hours: 1),
              displayDirection: UIDirection.uiDirectionHorizontal,
              showMultimedia: true,
              bodyMaxLines: 3,
              bodyTextOverflow: TextOverflow.ellipsis,
              errorBody: AppStrings.notLoad,
              errorTitle: AppStrings.notLoad,
              errorWidget: Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.all(8),
                child: const Text(AppStrings.notLoad),
              ),
              borderRadius: 12,
              removeElevation: true,
            ),
          ),
      ],
    );
  }
}
