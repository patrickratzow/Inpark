import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_app/common/ui/title_bar.dart";

import "../colors.dart";

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const HomeAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56 + (title != null ? 29 : 0));

  @override
  Widget build(BuildContext context) {
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
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: CustomColor.green.lightest,
                ),
                elevation: 0,
                leading: ImageIcon(
                  const AssetImage("assets/zoo_logo.png"),
                  size: 12,
                  color: CustomColor.green.icon,
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: CustomColor.green.icon,
                    ),
                    onPressed: () {},
                  ),
                  // IconButton(
                  //   icon: const Icon(
                  //     Icons.login_outlined,
                  //     color: CustomColor.green.icon,
                  //   ),
                  //   onPressed: () {},
                  // ),
                ],
              ),
              title != null
                  ? TitleBar(
                      name: title!,
                      fontSize: 16,
                      color: CustomColor.green.text,
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
