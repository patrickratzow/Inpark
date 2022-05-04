import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_app/common/colors.dart';
import "dart:io" show Platform;

import '../../routes.dart';

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

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? flexibleSpace;

  const ScreenAppBar({
    Key? key,
    this.title,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.actions,
    this.flexibleSpace,
  }) : super(key: key);

  bool get isMaterial => !Platform.isIOS;

  @override
  Widget build(BuildContext context) {
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
          children: _buildLeading(context),
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
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: CustomColor.green.lightest,
        ),
        child: Material(
          color: CustomColor.green.lightest,
          elevation: 0,
          shadowColor: Colors.transparent,
          child: Semantics(
            explicitChildNodes: true,
            child: appBar,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLeading(BuildContext context) {
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
            isMaterial ? Icons.arrow_back : Icons.arrow_back_ios,
            color: CustomColor.green.middle,
            size: 18,
          ),
          onPressed: () => Routes.popPage(context),
        ),
      );
    }
    if (leading != null) {
      results.add(leading!);
    }
    if (title != null) {
      results.add(
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            title!,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 14,
              height: 16 / 14,
              color: Color(0xff718D6D),
            ),
          ),
        ),
      );
    }

    return results;
  }

  List<Widget> _buildActions(BuildContext context) {
    return actions ??
        [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: CustomColor.green.icon,
            ),
            onPressed: () {},
          ),
        ];
  }

  @override
  Size get preferredSize {
    double height = 56;
    // Add a way to find the height when using flexible space

    return Size.fromHeight(height);
  }
}
