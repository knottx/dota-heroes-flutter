import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ImageFromNetwork extends StatefulWidget {
  final String? url;
  final BoxFit fit;
  final Widget? placeholder;

  const ImageFromNetwork({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.placeholder,
  });

  @override
  State<ImageFromNetwork> createState() => _ImageFromNetworkState();
}

class _ImageFromNetworkState extends State<ImageFromNetwork> {
  final CancellationToken _cancelToken = CancellationToken();

  @override
  void dispose() {
    _cancelToken.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.url;
    return (imageUrl != null && imageUrl.isNotEmpty)
        ? ExtendedImage.network(
            key: widget.key,
            imageUrl,
            fit: widget.fit,
            timeRetry: const Duration(seconds: 1),
            cancelToken: _cancelToken,
            loadStateChanged: (state) {
              switch (state.extendedImageLoadState) {
                case LoadState.failed:
                  return Center(
                    child: IconButton(
                      onPressed: () {
                        state.reLoadImage();
                      },
                      icon: const Icon(
                        Icons.refresh,
                      ),
                    ),
                  );

                default:
                  return null;
              }
            },
          )
        : widget.placeholder ??
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey.shade200,
              child: const Icon(
                Icons.image_outlined,
              ),
            );
  }
}
