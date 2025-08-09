// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import '../../../utils/app_colors/app_colors.dart';

class CustomLinkPreview extends StatefulWidget {
  final String url;
  final Function(bool success) onPreviewLoad;

  const CustomLinkPreview({
    super.key,
    required this.url,
    required this.onPreviewLoad,
  });

  @override
  _CustomLinkPreviewState createState() => _CustomLinkPreviewState();
}

class _CustomLinkPreviewState extends State<CustomLinkPreview> {
  Metadata? _metadata;

  @override
  void initState() {
    super.initState();
    _fetchMetadata();
  }

  Future<void> _fetchMetadata() async {
    final data = await MetadataFetch.extract(widget.url);
    if (mounted) {
      setState(() => _metadata = data);
      widget.onPreviewLoad(data != null);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_metadata == null) {
      return const SizedBox(); // or loading indicator if needed
    }

    final imageUrl = _metadata?.image ?? '';
    final title = _metadata?.title ?? '';
    final description = _metadata?.description ?? '';
    // final domain = Uri.tryParse(widget.url)?.host ?? '';

    return Container(
      height: 120,
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          // Left-side image
          if (imageUrl.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

          // Right-side content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
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
