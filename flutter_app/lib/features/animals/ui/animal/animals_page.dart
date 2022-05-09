import "package:flutter/material.dart";
import "package:flutter_app/common/colors.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/common/ui/cancel_button.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:flutter_app/features/animals/models/animals_model.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:provider/provider.dart";

import "animal_card.dart";
import "animal_screen.dart";

class AnimalsScreen extends HookWidget implements Screen {
  const AnimalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useProvider<AnimalsModel>(
      onInit: (provider) => provider.fetchAnimals(),
    );

    return Scaffold(
      body: Consumer<AnimalsModel>(
        builder: (context, model, child) {
          var isLoading = model.loading || model.hasError;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(isLoading ? 0 : 48),
                  child: Container(),
                ),
                pinned: false,
                snap: false,
                automaticallyImplyLeading: false,
                elevation: 0,
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                floating: true,
                flexibleSpace: _buildAppBar(),
              ),
              const AnimalsOverviewList()
            ],
          );
        },
      ),
    );
  }

  Widget _buildAppBar() {
    return Consumer<AnimalsModel>(
      builder: (context, animalsModel, child) {
        final isLoading = animalsModel.loading || animalsModel.hasError;
        final isSearching = animalsModel.isSearching;
        final List<Widget> actions;
        final Widget? leading;
        final String? title;
        if (isSearching) {
          leading = Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minHeight: 56,
                  minWidth: 48,
                ),
                icon: Icon(
                  Icons.search,
                  color: CustomColor.green.middle,
                  size: 28,
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  autofocus: true,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 18 / 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Søg her...",
                    hintStyle: TextStyle(color: Color(0xff93A990)),
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    animalsModel.search = text;
                  },
                ),
              ),
            ],
          );
          title = null;
          actions = [
            IconButton(
              constraints: const BoxConstraints(minHeight: 48, minWidth: 30),
              padding: const EdgeInsets.only(top: 2),
              onPressed: () {},
              icon: const Icon(Icons.mic_none),
              color: CustomColor.green.middle,
              iconSize: 24,
            ),
            CancelButton(onPressed: animalsModel.stopSearching)
          ];
        } else {
          leading = null;
          title = "Vores dyr";
          actions = [
            buildSearchIcon(animalsModel),
          ];
        }

        return ScreenAppBar(
          title: title,
          actions: actions,
          leading: leading,
          automaticallyImplyLeading: false,
          flexibleSpace: isLoading ? null : _buildCategories(animalsModel),
        );
      },
    );
  }

  Widget _buildCategories(AnimalsModel model) {
    return Row(
      children: [
        const SizedBox(width: 8),
        ...model.categories
            .map(
              (x) => CategoryButton(
                categoryName: x.name,
                enabled: x.enabled,
                onPressed: () {
                  model.toggleCategory(x);
                },
              ),
            )
            .cast<Widget>()
            .toList(),
      ],
    );
  }

  Widget buildSearchIcon(AnimalsModel model) {
    return IconButton(
      onPressed: () {
        model.startSearching();
      },
      icon: const Icon(Icons.search),
      color: CustomColor.green.middle,
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final bool enabled;
  final VoidCallback onPressed;

  const CategoryButton({
    required this.enabled,
    required this.categoryName,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 36 * MediaQuery.of(context).textScaleFactor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            backgroundColor:
                enabled ? CustomColor.green.middle : const Color(0xffEEF2EE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ).copyWith(
              side:
                  enabled ? null : BorderSide(color: CustomColor.green.darkest),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 14,
              height: 16 / 14,
              color: enabled
                  ? CustomColor.green.lightest
                  : CustomColor.green.darkest,
            ),
          ),
        ),
      ),
    );
  }
}

class AnimalsOverviewList extends HookWidget {
  const AnimalsOverviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigation = useNavigator();

    return Consumer<AnimalsModel>(
      builder: (context, animalsModel, child) {
        if (animalsModel.loading) {
          return SliverFillRemaining(
            child: _loadingIndicator(),
          );
        }

        if (animalsModel.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text("An error happened: " + animalsModel.error),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index >= animalsModel.animals.length) {
                return null;
              }

              final animal = animalsModel.animals[index];
              final double topPadding = index == 0 ? 16 : 0;
              return Padding(
                padding: EdgeInsets.fromLTRB(16, topPadding, 16, 0),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () => navigation.push(
                    context,
                    AnimalScreen(animal: animal),
                    hide: true,
                  ),
                  child: AnimalCard(animal: animal),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
