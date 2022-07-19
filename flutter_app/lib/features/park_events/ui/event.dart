import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_app/features/park_events/ui/park_event_screen.dart";
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: SizedBox(
        width: 154,
        height: 132,
        child: InkWell(
          onTap: () => navigation.push(
            context,
            ParkEventScreen(parkEvent: parkEvent),
            hide: true,
          ),
          child: Card(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                _buildImage(parkEvent),
                _buildText(parkEvent),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(ParkEventDto parkEvent) {
    return Positioned.fill(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: parkEvent.image.previewUrl,
      ),
    );
  }

  Widget _buildText(ParkEventDto parkEvent) {
    return HookBuilder(
      builder: (BuildContext context) {
        final theme = useTheme();
        const selectedColor = Color(0xffDDF8DA);
        final date =
            useDateRange(parkEvent.start, parkEvent.end, fullMonth: false);

        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              CustomColor.green.middle.withOpacity(0.8),
                              CustomColor.green.middle.withOpacity(0.0),
                            ],
                          ),
                        ),
                        child: SizedBox(
                          height: 25,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              CustomColor.green.middle.withOpacity(1),
                              CustomColor.green.middle.withOpacity(0.8),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(6, 0, 6, 6),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      parkEvent.title,
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: selectedColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    date,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: selectedColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
