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

  void _fetchMetadata() async {
    final data = await MetadataFetch.extract(widget.url);
    if (mounted) {
      setState(() {
        _metadata = data;
      });
      bool success =
          data != null &&
          (data.title?.isNotEmpty == true || data.image?.isNotEmpty == true);
      widget.onPreviewLoad(success);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_metadata == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final imageUrl = _metadata!.image ?? '';
    final title = _metadata!.title ?? '';
    final domain = Uri.parse(widget.url).host;

    return SizedBox(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image side
            if (imageUrl.isNotEmpty)
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            // Text area
            Expanded(
              child: Container(
                color: AppColors.backgroundLightGray,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      domain,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      maxLines: 4,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
