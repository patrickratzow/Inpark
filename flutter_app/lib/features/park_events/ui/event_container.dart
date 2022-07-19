import "package:flutter/material.dart";
import "../../../common/feature.dart";
import "../../../common/ui/title_bar.dart";
import "event.dart";
import "../../../hooks/hooks.dart";
import "package:provider/provider.dart";

import "../models/event_model.dart";

class EventContainer extends FrontPageWidget {
  final EdgeInsets padding = EdgeInsets.only(bottom: 8);

  EventContainer({super.key});

  @override
  Widget build(BuildContext context) {
    useProvider<ParkEventModel>().fetchParkEvents();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: TitleBar(
            name: "Kommende arrangementer",
          ),
        ),
        Consumer<ParkEventModel>(
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
            return SizedBox(
              height: 149,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Row(
                      children: List.generate(
                        parkEvent.parkEvents.length,
                        (index) => Event(
                          parkEvent: parkEvent.parkEvents[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  bool shouldHide(BuildContext context) => false;
}
