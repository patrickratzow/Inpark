import "package:flutter/material.dart";
import "../../../../common/colors.dart";
import "../../../../common/ui/cancel_button.dart";
import "../../../../common/ui/screen_app_bar.dart";
import "../../models/animals_model.dart";
import "../../../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class SearchAppBar extends HookWidget {
  final Widget? flexibleSpace;

  const SearchAppBar({
    super.key,
    this.flexibleSpace,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final model = useProvider<AnimalsModel>(watch: true);
    final theme = useTheme();

    useValueChanged(model.isSearching, (_, __) {
      if (model.isSearching) {
        focusNode.requestFocus();
      } else if (focusNode.hasFocus) {
        focusNode.unfocus();
      }

      return model.isSearching;
    });

    Widget _leading() {
      return Row(
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
              focusNode: focusNode,
              style: theme.textTheme.headlineMedium?.copyWith(
                height: 18 / 16,
              ),
              decoration: InputDecoration(
                hintText: "Søg her...",
                hintStyle: theme.textTheme.bodyLarge?.copyWith(
                  color: const Color(0xff93A990),
                ),
                border: InputBorder.none,
              ),
              onChanged: (text) {
                model.search = text;
              },
            ),
          ),
        ],
      );
    }

    List<Widget> _actions() {
      return [
        CancelButton(onPressed: model.stopSearching),
      ];
    }

    return ScreenAppBar(
      leading: _leading(),
      actions: _actions(),
      automaticallyImplyLeading: false,
      flexibleSpace: flexibleSpace,
    );
  }
}
