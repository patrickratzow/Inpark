import "package:flutter/material.dart";
import 'package:flutter_app/common/ui/title_bar.dart';
import 'package:flutter_app/features/home/ui/event..dart';
import 'package:flutter_app/features/home/ui/navigation_link.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({
    Key? key,
    required this.title,
    required this.eventArr,
  }) : super(key: key);

  final String title;
  final List<Event> eventArr;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TitleBar(
        fontSize: 16,
        name: title,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: GridView.count(
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(
            eventArr.length,
            (index) {
              return Center(
                child: eventArr[index],
              );
            },
          ),
        ),
      ),
    ]);
  }
}
