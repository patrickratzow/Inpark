import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tenants/ui/location/distance_to_park.dart';
import '../../common/color.dart';
import '../../models/park.dart';

class ParkCard extends HookWidget {
  final Park park;
  final int id;
  final double height = 153;
  final double width = 343;

  const ParkCard({
    super.key,
    required this.park,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 18,
        bottom: 18,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColor.green.lightest,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        height: height + 55,
        child: Column(
          children: [
            Stack(
              children: [
                _buildImage(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(9, 6, 9, 6),
                  child: DistanceToPark(park: park),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4, left: 12, right: 12, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        park.name,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${park.address.street} ${park.address.number} - ${park.address.city}, ${park.address.zipCode}",
                        style: const TextStyle(fontSize: 8),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15, bottom: 14, right: 16),
                  child: InkWell(
                    onTap: () => {},
                    child: SvgPicture.asset(
                        "package/tenants/assets/box_arrow.svg"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return CachedNetworkImage(
      imageUrl: park.imageUrl,
      imageBuilder: ((context, imageProvider) => Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          )),
    );
  }
}
