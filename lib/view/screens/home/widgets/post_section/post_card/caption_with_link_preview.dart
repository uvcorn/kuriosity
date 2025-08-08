import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:any_link_preview/any_link_preview.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_strings/app_strings.dart';

class CaptionWithLinkPreview extends StatefulWidget {
  final String caption;

  const CaptionWithLinkPreview({super.key, required this.caption});

  @override
  State<CaptionWithLinkPreview> createState() => _CaptionWithLinkPreviewState();
}

class _CaptionWithLinkPreviewState extends State<CaptionWithLinkPreview> {
  bool _isExpanded = false;
  bool _showSeeMore = false;
  final int _maxLines = 3;
  String? _firstUrl;

  @override
  void initState() {
    super.initState();

    // Extract URL (only first one)
    final linkElements = linkify(
      widget.caption,
    ).whereType<LinkableElement>().cast<LinkableElement>().toList();

    if (linkElements.isNotEmpty) {
      _firstUrl = linkElements.first.url;
    }

    // Wait until first layout to check for overflow
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final textSpan = TextSpan(
        text: widget.caption,
        style: const TextStyle(fontSize: 14),
      );

      final textPainter = TextPainter(
        text: textSpan,
        maxLines: _maxLines,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 32);

      if (textPainter.didExceedMaxLines) {
        setState(() {
          _showSeeMore = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Caption
          LayoutBuilder(
            builder: (context, constraints) {
              return Linkify(
                text: widget.caption,
                maxLines: _isExpanded ? null : _maxLines,
                overflow: _isExpanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                onOpen: (link) async {
                  final url = Uri.parse(link.url);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                style: textTheme.bodySmall?.copyWith(color: AppColors.black),
                linkStyle: textTheme.bodySmall?.copyWith(
                  color: AppColors.primary,
                ),
              );
            },
          ),

          // "See more" or "See less"
          if (_showSeeMore)
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  _isExpanded ? 'See less' : 'See more',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),

          // Link Preview (only show when expanded)
          if (_isExpanded && _firstUrl != null)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightBorder),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: AnyLinkPreview(
                    backgroundColor: AppColors.backgroundWhite,
                    link: _firstUrl!,
                    cache: const Duration(hours: 1),
                    displayDirection: UIDirection.uiDirectionHorizontal,
                    showMultimedia: true,
                    bodyMaxLines: 3,
                    bodyTextOverflow: TextOverflow.ellipsis,
                    errorBody: AppStrings.notLoad,
                    errorTitle: AppStrings.notLoad,
                    errorWidget: Container(
                      color: AppColors.white,
                      padding: const EdgeInsets.all(8),
                      child: const Text(AppStrings.notLoad),
                    ),
                    borderRadius: 12,
                    removeElevation: true,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
