import "package:flutter/material.dart";

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String route;
  final String name;

  const HomeAppBar({Key? key, required this.name, required this.route})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const ImageIcon(
          AssetImage("assets/zoo_logo.png"),
          size: 12,
          color: Colors.green,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                height: 16 / 14,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(route);
            },
          )
        ],
      ),
    );
  }
}
