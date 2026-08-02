import 'package:drift/drift.dart';
import 'package:voxcita/core/database/tables/insight_claims.dart';

class UserFeedback extends Table {
  TextColumn get id => text()();
  TextColumn get claimId => text().nullable().references(InsightClaims, #id)();
  TextColumn get feedbackType => text()();
  TextColumn get feedbackDetail => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
