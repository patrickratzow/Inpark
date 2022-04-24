import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String title;

  const FullScreenImage({
    Key? key,
    required this.imageUrl,
    required this.tag,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
        ),
        title: Text(title),
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
      ),
      body: Center(
        child: SizedBox.expand(
          child: InteractiveViewer(
            maxScale: 7,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
