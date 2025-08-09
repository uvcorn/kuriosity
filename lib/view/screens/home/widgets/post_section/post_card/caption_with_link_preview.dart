import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../components/custom_link_preview/custom_link_preview.dart';

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
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Caption with clickable links
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

          // "See more" / "See less"
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

          // ✅ Always show link preview if URL found
          if (_firstUrl != null)
            CustomLinkPreview(
              url: _firstUrl!,
              onPreviewLoad: (success) {
                // optional: handle preview state
              },
            ),
        ],
      ),
    );
  }
}
