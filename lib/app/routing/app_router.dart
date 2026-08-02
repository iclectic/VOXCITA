import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/features/capture/presentation/capture_screen.dart';
import 'package:voxcita/features/insights/presentation/insights_screen.dart';
import 'package:voxcita/features/library/presentation/library_screen.dart';
import 'package:voxcita/features/review/presentation/review_screen.dart';
import 'package:voxcita/features/settings/presentation/settings_screen.dart';
import 'package:voxcita/features/transcription/presentation/transcription_screen.dart';
import 'package:voxcita/features/trustworthy_ask/presentation/trustworthy_ask_screen.dart';
import 'package:voxcita/shared/widgets/app_scaffold.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.library,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppScaffold(child: child);
        },
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
            path: AppRoutes.transcription,
            builder: (context, state) => const TranscriptionScreen(),
          ),
          GoRoute(
            path: AppRoutes.insights,
            builder: (context, state) => const InsightsScreen(),
          ),
          GoRoute(
            path: AppRoutes.trustworthyAsk,
            builder: (context, state) => const TrustworthyAskScreen(),
          ),
          GoRoute(
            path: AppRoutes.review,
            builder: (context, state) => const ReviewScreen(),
          ),
          GoRoute(
            path: AppRoutes.settings,
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
});
