import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "park_event_screen.dart";
import "../../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../../common/colors.dart";
import "../../../generated_code/zooinator.models.swagger.dart";

class Event extends HookWidget {
  final ParkEventDto parkEvent;

  const Event({
    super.key,
    required this.parkEvent,
  });

  @override
  Widget build(BuildContext context) {
    final navigation = useNavigator();
    final date = useDateRange(parkEvent.start, parkEvent.end, fullMonth: false);
    final theme = useTheme();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 154,
          minHeight: 200,
        ),
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 6,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            parkEvent.title,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: CustomColor.green.middle,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            date,
                            softWrap: true,
                            textScaleFactor: 1,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: CustomColor.green.middle,
                            ),
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
