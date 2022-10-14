import 'package:collection_ext/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tenants/ui/park/park_card.dart';

import '../../models/park.dart';

class ParkList extends HookWidget {
  final List<Park> parks;

  const ParkList({
    super.key,
    required this.parks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: parks
          .mapIndexed(
            (idx, park) => ParkCard(park: park, id: idx),
          )
          .toList(),
    );
  }
}
