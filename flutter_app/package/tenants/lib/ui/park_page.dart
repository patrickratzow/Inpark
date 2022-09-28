import 'package:collection_ext/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:provider/provider.dart';
import '../models/park.dart';
import '../models/park_model.dart';

class ParkPage extends HookWidget {
  const ParkPage({super.key});

  @override
  Widget build(BuildContext context) {
    var tenant = Provider.of<ParkModel>(context);
    useEffectOnce(() {
      tenant.fetchParks();

      print(tenant.parks);
      return null;
    });

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ParkList(parks: tenant.parks),
            ],
          ),
        ),
      ),
    );
  }
}

class ParkList extends StatelessWidget {
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
            (idx, speak) => ParkRow(park: speak, id: idx),
          )
          .toList(),
    );
  }
}

class ParkRow extends HookWidget {
  final Park park;
  final int id;

  const ParkRow({
    super.key,
    required this.park,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Text(park.name);
  }
}
