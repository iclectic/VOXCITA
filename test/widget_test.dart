import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/capture/presentation/capture_screen.dart';
import 'package:voxcita/features/library/presentation/library_screen.dart';
import 'package:voxcita/features/settings/presentation/settings_screen.dart';
import 'package:voxcita/shared/widgets/app_scaffold.dart';

void main() {
  GoRouter buildTestRouter() {
    return GoRouter(
      initialLocation: AppRoutes.library,
      routes: [
        ShellRoute(
          builder: (context, state, child) => AppScaffold(child: child),
          routes: [
            GoRoute(
              path: AppRoutes.library,
              builder: (context, state) => const LibraryScreen(),
            ),
            GoRoute(
              path: AppRoutes.capture,
              builder: (context, state) => const CaptureScreen(),
            ),
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> pumpRouter(WidgetTester tester, GoRouter router) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          voxCitaDatabaseProvider.overrideWith((ref) {
            final db = VoxCitaDatabase.forTesting(NativeDatabase.memory());
            ref.onDispose(db.close);
            return db;
          }),
          uuidProvider.overrideWith((ref) => const Uuid()),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets(
    'AppScaffold renders all navigation destinations with correct labels',
    (tester) async {
      await pumpRouter(tester, buildTestRouter());

      expect(find.text('Library'), findsWidgets);
      expect(find.text('Capture'), findsWidgets);
      expect(find.text('Insights'), findsWidgets);
      expect(find.text('Ask'), findsWidgets);
      expect(find.text('Review'), findsWidgets);
      expect(find.text('Settings'), findsWidgets);
    },
  );

  testWidgets('AppScaffold shows LibraryScreen as initial destination', (
    tester,
  ) async {
    await pumpRouter(tester, buildTestRouter());

    expect(find.text('Your library is empty'), findsOneWidget);
  });

  testWidgets(
    'Tapping Settings navigation destination routes to SettingsScreen',
    (tester) async {
      await pumpRouter(tester, buildTestRouter());

      await tester.tap(find.text('Settings').last);
      await tester.pumpAndSettle();

      expect(find.text('Appearance'), findsOneWidget);
      expect(find.text('Security'), findsOneWidget);
      expect(find.text('Data'), findsOneWidget);
    },
  );

  testWidgets(
    'Tapping Capture navigation destination routes to CaptureScreen',
    (tester) async {
      await pumpRouter(tester, buildTestRouter());

      await tester.tap(find.text('Capture').last);
      await tester.pumpAndSettle();

      expect(find.text('Ready to record'), findsOneWidget);
    },
  );

  testWidgets('Navigation destinations have tooltips for accessibility', (
    tester,
  ) async {
    await pumpRouter(tester, buildTestRouter());

    final navBar = tester.widget<NavigationBar>(find.byType(NavigationBar));
    expect(navBar.destinations.length, 6);

    for (final dest in navBar.destinations) {
      final navDest = dest as NavigationDestination;
      expect(navDest.tooltip, isNotEmpty);
      expect(navDest.label, isNotEmpty);
    }
  });
}
