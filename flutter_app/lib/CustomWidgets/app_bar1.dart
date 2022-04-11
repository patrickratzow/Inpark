import 'package:flutter/material.dart';

class AppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final String route;
  final String name;

  AppBar1(this.name, this.route);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const ImageIcon(AssetImage('assets/zoo_logo.png'),
            size: 12, color: Colors.green),
        actions: <Widget>[
          TextButton(
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(route);
            },
          )
        ]);
  }
}
