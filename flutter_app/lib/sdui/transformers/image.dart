import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class ImageTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Image");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final fit = element.resolveAttribute<BoxFit>(
      "fit",
      context,
      BoxFit.cover,
    );
    final src = element.getAttribute("src")?.value;
    if (src == null) throw new Exception("Missing src attribute");
    final blendMode = element.resolveAttribute<BlendMode>(
      "blend-mode",
      context,
      BlendMode.color,
    );

    return CachedNetworkImage(
      fit: fit,
      imageUrl: src,
      colorBlendMode: blendMode,
      placeholder: (context, url) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
