import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../models/park.dart';

class ParkCard extends HookWidget {
  final Park park;

  const ParkCard({
    super.key,
    required this.park,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(park.name));
  }
}
