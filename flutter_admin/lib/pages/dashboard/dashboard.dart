import 'package:flutter/material.dart';
import 'package:flutter_admin/components/sidebar/sidebar_divider.dart';
import 'package:flutter_admin/components/sidebar/sidebar_section_header.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/sidebar/sidebar.dart';
import '../../components/sidebar/sidebar_button.dart';

class Dashboard extends HookWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final active = useState(0);
    final leading = SvgPicture.asset(
      "assets/sidebar_icon.svg",
      height: 12,
      width: 12,
    );
    const trailing = Text(
      "100+",
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        color: Color(0xff1D192B),
        fontWeight: FontWeight.bold,
        height: (20 / 14),
        letterSpacing: 0.1,
      ),
    );

    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            children: [
              const SidebarSectionHeader("Generelt"),
              SidebarButton(
                isActive: active.value == 0,
                leading: leading,
                text: "Dashboard",
                trailing: trailing,
                onPressed: () {
                  active.value = 0;
                },
              ),
              SidebarButton(
                isActive: active.value == 1,
                leading: leading,
                text: "Dyr",
                onPressed: () {
                  active.value = 1;
                },
              ),
              SidebarButton(
                isActive: active.value == 2,
                leading: leading,
                text: "Arrangementer",
                onPressed: () {
                  active.value = 2;
                },
              ),
              SidebarButton(
                isActive: active.value == 3,
                leading: leading,
                text: "Åbningstider",
                onPressed: () {
                  active.value = 3;
                },
              ),
              SidebarButton(
                isActive: active.value == 4,
                leading: leading,
                text: "Brugere",
                onPressed: () {
                  active.value = 4;
                },
              ),
              const SidebarDivider(),
              const SidebarSectionHeader("Kort"),
              SidebarButton(
                isActive: active.value == 5,
                leading: leading,
                text: "Kort",
                onPressed: () {
                  active.value = 5;
                },
              ),
              SidebarButton(
                isActive: active.value == 6,
                leading: leading,
                text: "Data visualisering",
                onPressed: () {
                  active.value = 6;
                },
              ),
            ],
          ),
          const Center(
            child: Text('Dashboard'),
          ),
        ],
      ),
    );
  }
}
