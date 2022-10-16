import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../common/color.dart';
import '../../models/location_model.dart';
import '../../models/park.dart';

class DistanceToPark extends HookWidget {
  final Park park;

  const DistanceToPark({super.key, required this.park});

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<LocationModel>(context);
    userLocation.subscribeToLocation();

    return Container(
        decoration: BoxDecoration(
            color: CustomColor.green.lightest,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        width: 47.45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset("package/tenants/assets/location_marker.svg"),
            kmText(userLocation),
          ],
        ));
  }

  Text kmText(LocationModel userLocation) {
    return Text(
      userLocation.currentPosition == null
          ? "20 Km"
          : userLocation.calculateDistance(
              userLocation.currentPosition?.latitude,
              userLocation.currentPosition?.longitude,
              park.location.x,
              park.location.y,
            ),
      style: const TextStyle(fontSize: 7.09),
    );
  }
}
