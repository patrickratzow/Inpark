import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../components/sidebar/sidebar.dart';

class Dashboard extends HookWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Sidebar(
            children: [],
          ),
          Center(
            child: Text('Dashboard'),
          ),
        ],
      ),
    );
  }
}
