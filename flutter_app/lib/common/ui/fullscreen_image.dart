import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_app/navigation/navigation_model.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class FullScreenImage extends HookWidget {
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
    final navigation = useProvider<NavigationModel>();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
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
            navigation.show(),
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
