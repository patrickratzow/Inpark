import "package:flutter/material.dart";
import "package:flutter_app/common/extensions/iterable.dart";
import "package:flutter_app/common/feature.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../../common/ui/home_app_bar.dart";

class HomeScreen extends HookWidget implements Screen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final frontPageFeatures = Features.frontPage.toList();
    final futures = useRef(
      Future.wait(
        frontPageFeatures.map((e) => e.setup(context)),
      ),
    );
    final future = useFuture(futures.value);

    Widget body;
    if (future.connectionState == ConnectionState.done) {
      body = SingleChildScrollView(
        child: Column(
          children: _buildFeatureWidgets(
            frontPageFeatures,
            context,
          ),
        ),
      );
    } else {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: const HomeAppBar(),
      body: body,
    );
  }

  List<Widget> _buildFeatureWidgets(
    List<FrontPageFeature> features,
    BuildContext context,
  ) {
    final frontPageFeatures = features
        .where((feature) => feature.frontPageMaterial != null)
        .where((feature) => !(feature.frontPageMaterial!.shouldHide(context)))
        .toList();

    return frontPageFeatures
        .mapIndexed((feature, idx) {
          final widgets = <Widget>[
            Padding(
              padding: feature.frontPageMaterial!.padding,
              child: feature.frontPageMaterial,
            ),
          ];

          final isNotLast = idx != frontPageFeatures.length - 1;
          if (isNotLast) {
            widgets.add(const SizedBox(height: 8));
          }

          return widgets;
        })
        .expand((widget) => widget)
        .cast<Widget>()
        .toList();
  }
}
