import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/common/ui/home_app_bar.dart';
import 'package:flutter_app/common/ui/screen_app_bar.dart';
import 'package:flutter_app/common/ui/title_bar.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

class ZooinatorScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final List<Widget>? actions;

  ZooinatorScreenAppBar(
      {Key? key,
      required this.title,
      this.automaticallyImplyLeading = true,
      this.leading,
      this.actions})
      : super(key: key);

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
          children: _buildLeading(context),
        ),
        Row(
          children: _buildActions(context),
        )
      ],
    );

    // Add title
    if (title != null) {
      appBar = Column(
        children: [
          appBar,
          const SizedBox(height: 2),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TitleBar(
                  name: title!,
                  fontSize: 16,
                  color: CustomColor.green.text,
                ),
              ),
            ],
          ),
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
    Widget result;
    if (leading != null) {
      result = leading!;
    } else if (automaticallyImplyLeading) {
      result = Padding(
        padding: const EdgeInsets.only(left: 2, top: 8),
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minHeight: 32,
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
    } else {
      return [];
    }

    return [
      result,
    ];
  }

  List<Widget> _buildActions(BuildContext context) {
    return actions ?? [];
  }

  @override
  Size get preferredSize {
    double height = 48;
    if (title != null) {
      height += 29 + 2;
    }

    return Size.fromHeight(height);
  }
}

class CalendarScreen extends HookWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZooinatorScreenAppBar(
        title: "Kalendar",
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xffeef2ee),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildHeaderRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Oktober 2022")],
    );
  }
}
