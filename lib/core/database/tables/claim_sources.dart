import 'package:drift/drift.dart';
import 'package:voxcita/core/database/tables/insight_claims.dart';
import 'package:voxcita/core/database/tables/transcript_segments.dart';

class ClaimSources extends Table {
  TextColumn get id => text()();
  TextColumn get claimId => text().references(InsightClaims, #id)();
  TextColumn get transcriptSegmentId =>
      text().references(TranscriptSegments, #id)();
  IntColumn get audioStartMs => integer()();
  IntColumn get audioEndMs => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
