import "package:flutter/material.dart";
import 'package:flutter_app/common/ui/title_bar.dart';
import 'package:flutter_app/features/home/ui/event..dart';
import 'package:flutter_app/features/home/ui/navigation_link.dart';
import 'package:provider/provider.dart';

import '../models/event_model.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    context.read<ParkEventModel>().fetchParkEvents();

    return Column(children: [
      TitleBar(
        fontSize: 16,
        name: title,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Consumer<ParkEventModel>(
          builder: (context, parkEvent, child) {
            if (parkEvent.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (parkEvent.error.isNotEmpty) {
              return const Center(
                child: Text(
                  "Ingen tilgængelige arrangementer, prøv igen senere",
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: SizedBox(
                height: 147,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    parkEvent.parkEvents.length,
                    (index) => Event(
                      parkEvent: parkEvent.parkEvents[index],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
