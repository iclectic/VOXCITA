import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/app/routing/app_router.dart';
import 'package:voxcita/app/theme/app_theme.dart';

class VoxCitaApp extends ConsumerWidget {
  const VoxCitaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'VoxCita',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      highContrastTheme: AppTheme.highContrastLight,
      highContrastDarkTheme: AppTheme.highContrastDark,
      routerConfig: router,
    );
  }
}
