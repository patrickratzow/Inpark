import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_app/common/ui/title_bar.dart";
import "package:flutter_app/features/park_events/ui/park_event_screen.dart";
import "package:flutter_app/hooks/use_date_range.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:intl/intl.dart";

import "../../../common/colors.dart";
import "../../../generated_code/zooinator.models.swagger.dart";

class Event extends HookWidget {
  final ParkEventDto parkEvent;

  const Event({
    Key? key,
    required this.parkEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigation = useNavigator();
    final date = useDateRange(parkEvent.start, parkEvent.end, fullMonth: false);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColor.green.superLight,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () => navigation.push(
            context,
            ParkEventScreen(parkEvent: parkEvent),
            hide: true,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 154,
              minHeight: 200,
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 100 / 62,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image(
                      image: CachedNetworkImageProvider(
                        parkEvent.image.previewUrl,
                      ),
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleBar(
                          fontSize: 12,
                          name: parkEvent.title,
                          color: CustomColor.green.middle,
                          textScaleFactor: 1,
                        ),
                        Text(
                          date,
                          softWrap: true,
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontSize: 10,
                            color: CustomColor.green.middle,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
