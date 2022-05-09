import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_app/common/ui/title_bar.dart";
import "package:flutter_app/features/park_events/ui/park_event_screen.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_app/navigation/navigation_model.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:intl/intl.dart";
import "../../../common/colors.dart";
import "../../../generated_code/zooinator.models.swagger.dart";

class Event extends HookWidget {
  final ParkEventDto parkEvent;
  final DateFormat formatter = DateFormat("dd. MMMM yyyy", "da");

  Event({Key? key, required this.parkEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigation = useProvider<NavigationModel>();

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
          onPressed: () =>
              navigation.push(context, ParkEventScreen(parkEvent: parkEvent)),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 154,
              minHeight: 151,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        ),
                        Text(
                          formatter.format(parkEvent.start),
                          softWrap: true,
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
