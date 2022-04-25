import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:flutter_app/common/ui/title_bar.dart';
import 'package:flutter_app/routes.dart';

import '../../../common/colors.dart';

class Event extends StatelessWidget {
  const Event({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.route,
  }) : super(key: key);

  final String title;
  final String description;
  final String imageUrl;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.green.superLight,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          Routes.goToRoute(context, route);
        },
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image(
                  image: CachedNetworkImageProvider(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TitleBar(
                      fontSize: 12,
                      name: title,
                      color: CustomColor.green.middle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 10,
                        color: CustomColor.green.middle,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
