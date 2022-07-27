import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "../../features/settings/ui/settings.dart";
import "../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../colors.dart";

class HomeAppBar extends HookWidget implements PreferredSizeWidget {
  final String? title;

  const HomeAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56 + (title != null ? 29 : 0));

  @override
  Widget build(BuildContext context) {
    final navigator = useNavigator();
    final theme = useTheme();

    return Container(
      decoration: BoxDecoration(
        color: CustomColor.green.lightest,
      ),
      child: Column(
        children: [
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
                  statusBarColor: CustomColor.green.lightest,
                ),
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  child: SvgPicture.asset(
                    "assets/zoo_logo.svg",
                    color: CustomColor.green.middle,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: CustomColor.green.icon,
                    ),
                    onPressed: () => navigator.push(
                      context,
                      const SettingsScreen(),
                    ),
                  ),
                ],
              ),
              title != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        title!,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: CustomColor.green.text,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
