import "package:flutter/material.dart";
import "package:flutter_app/features/speaks/models/speak_model.dart";
import "package:flutter_app/features/speaks/ui/speak_row.dart";
import "package:provider/provider.dart";
import "../../../common/ui/title_bar.dart";

class SpeaksPreview extends StatelessWidget {
  const SpeaksPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SpeakModel>().fetchSpeaksForToday();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const TitleBar(
            fontSize: 16,
            name: "Aktiviteter & Speaks i dag:",
          ),
          Consumer<SpeakModel>(
            builder: (context, value, child) {
              if (value.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (value.error.isNotEmpty) {
                return const Center(
                  child: Text("Der er ingen speaks i dag"),
                );
              }

              /*
              var speaks = value.topThreeSpeaks;
              if (speaks.isEmpty) {
                return const Center(
                  child: Text("Alle speaks for i dag er ovre :)"),
                );
              }*/

              return Column(
                children: value.topThreeSpeaks
                    .map(
                      (s) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SpeakRow(speak: s),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
