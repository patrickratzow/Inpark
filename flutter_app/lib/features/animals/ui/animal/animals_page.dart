import "dart:async";

import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_use/flutter_use.dart";

import "../../../../common/colors.dart";
import "../../../../common/screen.dart";
import "../../../../common/ui/screen_app_bar.dart";
import "../../../../hooks/hooks.dart";
import "../../../../sdui/elements/node_element.dart";
import "../../../../sdui/parser/parser.dart";
import "../../../../sdui/transformers/transformer.dart";
import "../../models/animals_model.dart";
import "animal_card.dart";
import "animal_screen.dart";
import "animals_categories.dart";
import "search_app_bar.dart";

class AnimalsScreen extends HookWidget implements Screen {
  const AnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = useProvider<AnimalsModel>(watch: true);
    final isLoading = model.loading ||
        model.hasError ||
        (!model.isSearching && model.animals.isEmpty);
    final isSearching = model.isSearching;
    final controller = useAnimationController();
    final Animation<Offset> animation = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate,
      ),
    );
    useEffectOnce(
      () {
        model.fetchAnimals();

        return null;
      },
    );
    useEffect(
      () {
        controller.animateTo(
          isSearching ? 1 : 0,
          duration: const Duration(milliseconds: 200),
        );

        return null;
      },
      [model.isSearching],
    );

    final scale = MediaQuery.of(context).textScaleFactor;
    final height = 40 + (isLoading ? 0 : 48) + (16 * scale);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            automaticallyImplyLeading: false,
            elevation: 0,
            expandedHeight: height,
            toolbarHeight: height,
            shadowColor: Colors.transparent,
            backgroundColor: CustomColor.green.lightest,
            floating: true,
            flexibleSpace: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 56,
                    child: Stack(
                      children: [
                        ScreenAppBar(
                          title: "Vores dyr",
                          actions: [
                            if (!isLoading)
                              IconButton(
                                onPressed: () {
                                  model.startSearching();
                                },
                                icon: const Icon(Icons.search),
                                color: CustomColor.green.middle,
                              ),
                          ],
                          automaticallyImplyLeading: false,
                        ),
                        Container(
                          child: isLoading
                              ? null
                              : AnimatedBuilder(
                                  animation: controller,
                                  builder: (context, child) {
                                    return SlideTransition(
                                      position: animation,
                                      child: const SearchAppBar(),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: CustomColor.green.lightest,
                      child: isLoading
                          ? null
                          : const Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: AnimalsCategories(),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const _AnimalsOverviewList()
        ],
      ),
    );
  }
}

void useAsyncEffect(Future<Dispose?> Function() effect, [List<Object?>? keys]) {
  useEffect(
    () {
      final disposeFuture = Future.microtask(effect);
      return () => disposeFuture.then((dispose) => dispose?.call());
    },
    keys,
  );
}

class SDUITemplate extends HookWidget {
  static Map<String, NodeElement> _cache = {};
  final String template;
  final Map<String, dynamic> data;
  final Widget Function(BuildContext context, Widget child)? builder;

  SDUITemplate({
    required this.template,
    required this.data,
    this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final attributes = data.entries
        .map((entry) => ":${entry.key}=\"${entry.value}\"")
        .join(" ");
    final template = """<${this.template} ${attributes}/>""";
    final id = "template_${this.template}";
    final parsed = useMemoized(
      () {
        if (_cache.containsKey(id)) {
          return _cache[id]!;
        }

        final parsed = Parser().parse(
          template,
          id,
          ParserData(),
        );
        _cache[id] = parsed;

        return parsed;
      },
    );
    final renderedContent = useState<Widget?>(null);

    useAsyncEffect(
      () {
        try {
          final widget = Transformer.transformOne(parsed, context);
          renderedContent.value = widget;
        } catch (error, stack) {
          print(error);
          FirebaseCrashlytics.instance.recordError(error, stack);
        }

        return Future.value(null);
      },
      const [],
    );

    if (renderedContent.value != null) {
      return builder?.call(context, renderedContent.value!) ??
          renderedContent.value!;
    }

    return const Center(child: CircularProgressIndicator.adaptive());
  }
}

class _AnimalsOverviewList extends HookWidget {
  const _AnimalsOverviewList({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = useNavigator();
    final model = useProvider<AnimalsModel>(watch: true);

    if (model.loading) {
      return SliverFillRemaining(
        child: _loadingIndicator(),
      );
    }

    if (model.hasError) {
      return SliverFillRemaining(
        child: Center(
          child: Text("An error happened: " + model.error),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index >= model.animals.length) {
          return null;
        }

        final animal = model.animals[index];
        final double topPadding = index == 0 ? 16 : 0;
        final double bottomPadding =
            index == model.animals.length - 1 ? 16 : 12;

        return Padding(
          padding: EdgeInsets.fromLTRB(16, topPadding, 16, bottomPadding),
          child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              navigation.push(
                context,
                AnimalScreen(animal: animal),
                hide: true,
              );
            },
            child: AnimalCard(
              animal: animal,
            ),
          ),
        );
      }),
    );
  }

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
