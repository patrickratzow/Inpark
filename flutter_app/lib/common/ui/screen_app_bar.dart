import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../hooks/hooks.dart";
import "../../navigation/navigation_model.dart";
import "../colors.dart";

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout(this.toolbarHeight);

  final double toolbarHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: toolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, toolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) =>
      toolbarHeight != oldDelegate.toolbarHeight;
}

class ScreenAppBar extends HookWidget implements PreferredSizeWidget {
  final String? title;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final Color? backgroundColor;
  final Color? leadingColor;
  final double? height;

  const ScreenAppBar({
    super.key,
    this.title,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.actions,
    this.flexibleSpace,
    this.systemUiOverlayStyle,
    this.backgroundColor,
    this.leadingColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final navigation = useNavigator();

    // If the toolbar is allocated less than toolbarHeight make it
    // appear to scroll upwards within its shrinking container.
    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: _ToolbarContainerLayout(preferredSize.height),
        child: Container(),
      ),
    );

    // Add leading icons & actions
    appBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildLeading(context, navigation),
        ),
        Row(
          children: _buildActions(context),
        )
      ],
    );

    // Add title
    if (flexibleSpace != null) {
      appBar = Column(
        children: [
          appBar,
          flexibleSpace!,
        ],
      );
    }

    // Safe area the entire thing
    appBar = SafeArea(
      bottom: false,
      child: appBar,
    );

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiOverlayStyle ??
            SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: CustomColor.green.lightest,
            ),
        child: Material(
          color: backgroundColor ?? CustomColor.green.lightest,
          elevation: 0,
          shadowColor: Colors.transparent,
          child: Semantics(
            explicitChildNodes: true,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: kToolbarHeight + 48,
              ),
              child: appBar,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLeading(
    BuildContext context,
    NavigationModel navigation,
  ) {
    final policies = usePolicies();
    final theme = useTheme(context: context);

    List<Widget> results = [];
    if (automaticallyImplyLeading) {
      results.add(
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minHeight: 56,
            minWidth: 48,
          ),
          icon: Icon(
            policies.appBarBackButton,
            color: leadingColor ?? CustomColor.green.middle,
            size: 18,
          ),
          onPressed: () => navigation.pop(context),
        ),
      );
    }
    if (leading != null) {
      results.add(leading!);
    }
    if (title != null) {
      final padding = automaticallyImplyLeading
          ? const EdgeInsets.only(left: 2, top: 2)
          // Hack for sizing when no back button
          : const EdgeInsets.fromLTRB(16, 22, 0, 20);
      results.add(
        Padding(
          padding: padding,
          child: Text(
            title!,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.125,
              color: const Color(0xff718D6D),
            ),
          ),
        ),
      );
    }

    return results;
  }

  List<Widget> _buildActions(BuildContext context) {
    return actions ?? [];
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 56);
}
