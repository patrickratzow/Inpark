import 'package:flutter/material.dart';
import 'package:flutter_admin/pages/animals/animals_page.dart';
import 'package:flutter_admin/pages/dashboard/dashboard.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Dashboard();
      },
    ),
    GoRoute(
      path: '/animals',
      builder: (BuildContext context, GoRouterState state) {
        return const AnimalsPage();
      },
    ),
  ],
);
