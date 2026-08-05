import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/analytics/domain/analytics_service.dart';

class AnalyticsState {
  const AnalyticsState({this.metrics, this.isLoading = false, this.error});

  final AnalyticsMetrics? metrics;
  final bool isLoading;
  final String? error;

  bool get hasError => error != null;
  bool get hasMetrics => metrics != null;

  AnalyticsState copyWith({
    AnalyticsMetrics? metrics,
    bool? isLoading,
    String? error,
  }) {
    return AnalyticsState(
      metrics: metrics ?? this.metrics,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class AnalyticsController extends StateNotifier<AnalyticsState> {
  AnalyticsController(this._service) : super(const AnalyticsState());

  final AnalyticsService _service;

  Future<void> loadMetrics() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final metrics = await _service.getMetrics();
      state = AnalyticsState(metrics: metrics, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return AnalyticsService(ref.watch(voxCitaDatabaseProvider));
});

final analyticsControllerProvider =
    StateNotifierProvider<AnalyticsController, AnalyticsState>((ref) {
      return AnalyticsController(ref.watch(analyticsServiceProvider));
    });
