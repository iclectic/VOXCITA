import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final currentDestination = AppDestination.values.firstWhere(
      (d) => location.startsWith(d.route),
      orElse: () => AppDestination.library,
    );

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: AppDestination.values.indexOf(currentDestination),
        onDestinationSelected: (index) {
          context.go(AppDestination.values[index].route);
        },
        destinations: AppDestination.values.map((dest) {
          final isSelected = dest == currentDestination;
          return NavigationDestination(
            icon: Semantics(
              label: '${dest.label} tab',
              child: Icon(dest.icon),
            ),
            selectedIcon: Semantics(
              label: '${dest.label} tab, selected',
              child: Icon(dest.selectedIcon),
            ),
            label: dest.label,
          );
        }).toList(),
      ),
    );
  }
}
