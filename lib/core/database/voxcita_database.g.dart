// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voxcita_database.dart';

// ignore_for_file: type=lint
class $AudioAssetsTable extends AudioAssets
    with TableInfo<$AudioAssetsTable, AudioAsset> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AudioAssetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relativePathMeta = const VerificationMeta(
    'relativePath',
  );
  @override
  late final GeneratedColumn<String> relativePath = GeneratedColumn<String>(
    'relative_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('audio/m4a'),
  );
  static const VerificationMeta _durationMsMeta = const VerificationMeta(
    'durationMs',
  );
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
    'duration_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileSizeBytesMeta = const VerificationMeta(
    'fileSizeBytes',
  );
  @override
  late final GeneratedColumn<int> fileSizeBytes = GeneratedColumn<int>(
    'file_size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sha256HashMeta = const VerificationMeta(
    'sha256Hash',
  );
  @override
  late final GeneratedColumn<String> sha256Hash = GeneratedColumn<String>(
    'sha256_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _waveformJsonMeta = const VerificationMeta(
    'waveformJson',
  );
  @override
  late final GeneratedColumn<String> waveformJson = GeneratedColumn<String>(
    'waveform_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isOriginalMeta = const VerificationMeta(
    'isOriginal',
  );
  @override
  late final GeneratedColumn<bool> isOriginal = GeneratedColumn<bool>(
    'is_original',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_original" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _derivedFromIdMeta = const VerificationMeta(
    'derivedFromId',
  );
  @override
  late final GeneratedColumn<String> derivedFromId = GeneratedColumn<String>(
    'derived_from_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES audio_assets (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    relativePath,
    mimeType,
    durationMs,
    fileSizeBytes,
    sha256Hash,
    waveformJson,
    isOriginal,
    derivedFromId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audio_assets';
  @override
  VerificationContext validateIntegrity(
    Insertable<AudioAsset> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('relative_path')) {
      context.handle(
        _relativePathMeta,
        relativePath.isAcceptableOrUnknown(
          data['relative_path']!,
          _relativePathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relativePathMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
        _durationMsMeta,
        durationMs.isAcceptableOrUnknown(data['duration_ms']!, _durationMsMeta),
      );
    } else if (isInserting) {
      context.missing(_durationMsMeta);
    }
    if (data.containsKey('file_size_bytes')) {
      context.handle(
        _fileSizeBytesMeta,
        fileSizeBytes.isAcceptableOrUnknown(
          data['file_size_bytes']!,
          _fileSizeBytesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fileSizeBytesMeta);
    }
    if (data.containsKey('sha256_hash')) {
      context.handle(
        _sha256HashMeta,
        sha256Hash.isAcceptableOrUnknown(data['sha256_hash']!, _sha256HashMeta),
      );
    } else if (isInserting) {
      context.missing(_sha256HashMeta);
    }
    if (data.containsKey('waveform_json')) {
      context.handle(
        _waveformJsonMeta,
        waveformJson.isAcceptableOrUnknown(
          data['waveform_json']!,
          _waveformJsonMeta,
        ),
      );
    }
    if (data.containsKey('is_original')) {
      context.handle(
        _isOriginalMeta,
        isOriginal.isAcceptableOrUnknown(data['is_original']!, _isOriginalMeta),
      );
    }
    if (data.containsKey('derived_from_id')) {
      context.handle(
        _derivedFromIdMeta,
        derivedFromId.isAcceptableOrUnknown(
          data['derived_from_id']!,
          _derivedFromIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AudioAsset map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AudioAsset(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      relativePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relative_path'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      )!,
      durationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_ms'],
      )!,
      fileSizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size_bytes'],
      )!,
      sha256Hash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sha256_hash'],
      )!,
      waveformJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}waveform_json'],
      ),
      isOriginal: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_original'],
      )!,
      derivedFromId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}derived_from_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AudioAssetsTable createAlias(String alias) {
    return $AudioAssetsTable(attachedDatabase, alias);
  }
}

class AudioAsset extends DataClass implements Insertable<AudioAsset> {
  final String id;
  final String relativePath;
  final String mimeType;
  final int durationMs;
  final int fileSizeBytes;
  final String sha256Hash;
  final String? waveformJson;
  final bool isOriginal;
  final String? derivedFromId;
  final DateTime createdAt;
  const AudioAsset({
    required this.id,
    required this.relativePath,
    required this.mimeType,
    required this.durationMs,
    required this.fileSizeBytes,
    required this.sha256Hash,
    this.waveformJson,
    required this.isOriginal,
    this.derivedFromId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['relative_path'] = Variable<String>(relativePath);
    map['mime_type'] = Variable<String>(mimeType);
    map['duration_ms'] = Variable<int>(durationMs);
    map['file_size_bytes'] = Variable<int>(fileSizeBytes);
    map['sha256_hash'] = Variable<String>(sha256Hash);
    if (!nullToAbsent || waveformJson != null) {
      map['waveform_json'] = Variable<String>(waveformJson);
    }
    map['is_original'] = Variable<bool>(isOriginal);
    if (!nullToAbsent || derivedFromId != null) {
      map['derived_from_id'] = Variable<String>(derivedFromId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AudioAssetsCompanion toCompanion(bool nullToAbsent) {
    return AudioAssetsCompanion(
      id: Value(id),
      relativePath: Value(relativePath),
      mimeType: Value(mimeType),
      durationMs: Value(durationMs),
      fileSizeBytes: Value(fileSizeBytes),
      sha256Hash: Value(sha256Hash),
      waveformJson: waveformJson == null && nullToAbsent
          ? const Value.absent()
          : Value(waveformJson),
      isOriginal: Value(isOriginal),
      derivedFromId: derivedFromId == null && nullToAbsent
          ? const Value.absent()
          : Value(derivedFromId),
      createdAt: Value(createdAt),
    );
  }

  factory AudioAsset.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AudioAsset(
      id: serializer.fromJson<String>(json['id']),
      relativePath: serializer.fromJson<String>(json['relativePath']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      durationMs: serializer.fromJson<int>(json['durationMs']),
      fileSizeBytes: serializer.fromJson<int>(json['fileSizeBytes']),
      sha256Hash: serializer.fromJson<String>(json['sha256Hash']),
      waveformJson: serializer.fromJson<String?>(json['waveformJson']),
      isOriginal: serializer.fromJson<bool>(json['isOriginal']),
      derivedFromId: serializer.fromJson<String?>(json['derivedFromId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'relativePath': serializer.toJson<String>(relativePath),
      'mimeType': serializer.toJson<String>(mimeType),
      'durationMs': serializer.toJson<int>(durationMs),
      'fileSizeBytes': serializer.toJson<int>(fileSizeBytes),
      'sha256Hash': serializer.toJson<String>(sha256Hash),
      'waveformJson': serializer.toJson<String?>(waveformJson),
      'isOriginal': serializer.toJson<bool>(isOriginal),
      'derivedFromId': serializer.toJson<String?>(derivedFromId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AudioAsset copyWith({
    String? id,
    String? relativePath,
    String? mimeType,
    int? durationMs,
    int? fileSizeBytes,
    String? sha256Hash,
    Value<String?> waveformJson = const Value.absent(),
    bool? isOriginal,
    Value<String?> derivedFromId = const Value.absent(),
    DateTime? createdAt,
  }) => AudioAsset(
    id: id ?? this.id,
    relativePath: relativePath ?? this.relativePath,
    mimeType: mimeType ?? this.mimeType,
    durationMs: durationMs ?? this.durationMs,
    fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
    sha256Hash: sha256Hash ?? this.sha256Hash,
    waveformJson: waveformJson.present ? waveformJson.value : this.waveformJson,
    isOriginal: isOriginal ?? this.isOriginal,
    derivedFromId: derivedFromId.present
        ? derivedFromId.value
        : this.derivedFromId,
    createdAt: createdAt ?? this.createdAt,
  );
  AudioAsset copyWithCompanion(AudioAssetsCompanion data) {
    return AudioAsset(
      id: data.id.present ? data.id.value : this.id,
      relativePath: data.relativePath.present
          ? data.relativePath.value
          : this.relativePath,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      durationMs: data.durationMs.present
          ? data.durationMs.value
          : this.durationMs,
      fileSizeBytes: data.fileSizeBytes.present
          ? data.fileSizeBytes.value
          : this.fileSizeBytes,
      sha256Hash: data.sha256Hash.present
          ? data.sha256Hash.value
          : this.sha256Hash,
      waveformJson: data.waveformJson.present
          ? data.waveformJson.value
          : this.waveformJson,
      isOriginal: data.isOriginal.present
          ? data.isOriginal.value
          : this.isOriginal,
      derivedFromId: data.derivedFromId.present
          ? data.derivedFromId.value
          : this.derivedFromId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AudioAsset(')
          ..write('id: $id, ')
          ..write('relativePath: $relativePath, ')
          ..write('mimeType: $mimeType, ')
          ..write('durationMs: $durationMs, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('sha256Hash: $sha256Hash, ')
          ..write('waveformJson: $waveformJson, ')
          ..write('isOriginal: $isOriginal, ')
          ..write('derivedFromId: $derivedFromId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    relativePath,
    mimeType,
    durationMs,
    fileSizeBytes,
    sha256Hash,
    waveformJson,
    isOriginal,
    derivedFromId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AudioAsset &&
          other.id == this.id &&
          other.relativePath == this.relativePath &&
          other.mimeType == this.mimeType &&
          other.durationMs == this.durationMs &&
          other.fileSizeBytes == this.fileSizeBytes &&
          other.sha256Hash == this.sha256Hash &&
          other.waveformJson == this.waveformJson &&
          other.isOriginal == this.isOriginal &&
          other.derivedFromId == this.derivedFromId &&
          other.createdAt == this.createdAt);
}

class AudioAssetsCompanion extends UpdateCompanion<AudioAsset> {
  final Value<String> id;
  final Value<String> relativePath;
  final Value<String> mimeType;
  final Value<int> durationMs;
  final Value<int> fileSizeBytes;
  final Value<String> sha256Hash;
  final Value<String?> waveformJson;
  final Value<bool> isOriginal;
  final Value<String?> derivedFromId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AudioAssetsCompanion({
    this.id = const Value.absent(),
    this.relativePath = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.sha256Hash = const Value.absent(),
    this.waveformJson = const Value.absent(),
    this.isOriginal = const Value.absent(),
    this.derivedFromId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AudioAssetsCompanion.insert({
    required String id,
    required String relativePath,
    this.mimeType = const Value.absent(),
    required int durationMs,
    required int fileSizeBytes,
    required String sha256Hash,
    this.waveformJson = const Value.absent(),
    this.isOriginal = const Value.absent(),
    this.derivedFromId = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       relativePath = Value(relativePath),
       durationMs = Value(durationMs),
       fileSizeBytes = Value(fileSizeBytes),
       sha256Hash = Value(sha256Hash),
       createdAt = Value(createdAt);
  static Insertable<AudioAsset> custom({
    Expression<String>? id,
    Expression<String>? relativePath,
    Expression<String>? mimeType,
    Expression<int>? durationMs,
    Expression<int>? fileSizeBytes,
    Expression<String>? sha256Hash,
    Expression<String>? waveformJson,
    Expression<bool>? isOriginal,
    Expression<String>? derivedFromId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (relativePath != null) 'relative_path': relativePath,
      if (mimeType != null) 'mime_type': mimeType,
      if (durationMs != null) 'duration_ms': durationMs,
      if (fileSizeBytes != null) 'file_size_bytes': fileSizeBytes,
      if (sha256Hash != null) 'sha256_hash': sha256Hash,
      if (waveformJson != null) 'waveform_json': waveformJson,
      if (isOriginal != null) 'is_original': isOriginal,
      if (derivedFromId != null) 'derived_from_id': derivedFromId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AudioAssetsCompanion copyWith({
    Value<String>? id,
    Value<String>? relativePath,
    Value<String>? mimeType,
    Value<int>? durationMs,
    Value<int>? fileSizeBytes,
    Value<String>? sha256Hash,
    Value<String?>? waveformJson,
    Value<bool>? isOriginal,
    Value<String?>? derivedFromId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AudioAssetsCompanion(
      id: id ?? this.id,
      relativePath: relativePath ?? this.relativePath,
      mimeType: mimeType ?? this.mimeType,
      durationMs: durationMs ?? this.durationMs,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      sha256Hash: sha256Hash ?? this.sha256Hash,
      waveformJson: waveformJson ?? this.waveformJson,
      isOriginal: isOriginal ?? this.isOriginal,
      derivedFromId: derivedFromId ?? this.derivedFromId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (relativePath.present) {
      map['relative_path'] = Variable<String>(relativePath.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (fileSizeBytes.present) {
      map['file_size_bytes'] = Variable<int>(fileSizeBytes.value);
    }
    if (sha256Hash.present) {
      map['sha256_hash'] = Variable<String>(sha256Hash.value);
    }
    if (waveformJson.present) {
      map['waveform_json'] = Variable<String>(waveformJson.value);
    }
    if (isOriginal.present) {
      map['is_original'] = Variable<bool>(isOriginal.value);
    }
    if (derivedFromId.present) {
      map['derived_from_id'] = Variable<String>(derivedFromId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AudioAssetsCompanion(')
          ..write('id: $id, ')
          ..write('relativePath: $relativePath, ')
          ..write('mimeType: $mimeType, ')
          ..write('durationMs: $durationMs, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('sha256Hash: $sha256Hash, ')
          ..write('waveformJson: $waveformJson, ')
          ..write('isOriginal: $isOriginal, ')
          ..write('derivedFromId: $derivedFromId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _noteTypeMeta = const VerificationMeta(
    'noteType',
  );
  @override
  late final GeneratedColumn<String> noteType = GeneratedColumn<String>(
    'note_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _audioAssetIdMeta = const VerificationMeta(
    'audioAssetId',
  );
  @override
  late final GeneratedColumn<String> audioAssetId = GeneratedColumn<String>(
    'audio_asset_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES audio_assets (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFavouriteMeta = const VerificationMeta(
    'isFavourite',
  );
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
    'is_favourite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favourite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isPinnedMeta = const VerificationMeta(
    'isPinned',
  );
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
    'is_pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pinned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    body,
    noteType,
    audioAssetId,
    createdAt,
    updatedAt,
    isFavourite,
    isPinned,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Note> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    }
    if (data.containsKey('note_type')) {
      context.handle(
        _noteTypeMeta,
        noteType.isAcceptableOrUnknown(data['note_type']!, _noteTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_noteTypeMeta);
    }
    if (data.containsKey('audio_asset_id')) {
      context.handle(
        _audioAssetIdMeta,
        audioAssetId.isAcceptableOrUnknown(
          data['audio_asset_id']!,
          _audioAssetIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_favourite')) {
      context.handle(
        _isFavouriteMeta,
        isFavourite.isAcceptableOrUnknown(
          data['is_favourite']!,
          _isFavouriteMeta,
        ),
      );
    }
    if (data.containsKey('is_pinned')) {
      context.handle(
        _isPinnedMeta,
        isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      noteType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_type'],
      )!,
      audioAssetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_asset_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isFavourite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favourite'],
      )!,
      isPinned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pinned'],
      )!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final String id;
  final String title;
  final String body;
  final String noteType;
  final String? audioAssetId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isFavourite;
  final bool isPinned;
  const Note({
    required this.id,
    required this.title,
    required this.body,
    required this.noteType,
    this.audioAssetId,
    required this.createdAt,
    required this.updatedAt,
    required this.isFavourite,
    required this.isPinned,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['note_type'] = Variable<String>(noteType);
    if (!nullToAbsent || audioAssetId != null) {
      map['audio_asset_id'] = Variable<String>(audioAssetId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_favourite'] = Variable<bool>(isFavourite);
    map['is_pinned'] = Variable<bool>(isPinned);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      title: Value(title),
      body: Value(body),
      noteType: Value(noteType),
      audioAssetId: audioAssetId == null && nullToAbsent
          ? const Value.absent()
          : Value(audioAssetId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isFavourite: Value(isFavourite),
      isPinned: Value(isPinned),
    );
  }

  factory Note.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      noteType: serializer.fromJson<String>(json['noteType']),
      audioAssetId: serializer.fromJson<String?>(json['audioAssetId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isFavourite: serializer.fromJson<bool>(json['isFavourite']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'noteType': serializer.toJson<String>(noteType),
      'audioAssetId': serializer.toJson<String?>(audioAssetId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isFavourite': serializer.toJson<bool>(isFavourite),
      'isPinned': serializer.toJson<bool>(isPinned),
    };
  }

  Note copyWith({
    String? id,
    String? title,
    String? body,
    String? noteType,
    Value<String?> audioAssetId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isFavourite,
    bool? isPinned,
  }) => Note(
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
    noteType: noteType ?? this.noteType,
    audioAssetId: audioAssetId.present ? audioAssetId.value : this.audioAssetId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isFavourite: isFavourite ?? this.isFavourite,
    isPinned: isPinned ?? this.isPinned,
  );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      noteType: data.noteType.present ? data.noteType.value : this.noteType,
      audioAssetId: data.audioAssetId.present
          ? data.audioAssetId.value
          : this.audioAssetId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isFavourite: data.isFavourite.present
          ? data.isFavourite.value
          : this.isFavourite,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('noteType: $noteType, ')
          ..write('audioAssetId: $audioAssetId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('isPinned: $isPinned')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    body,
    noteType,
    audioAssetId,
    createdAt,
    updatedAt,
    isFavourite,
    isPinned,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.noteType == this.noteType &&
          other.audioAssetId == this.audioAssetId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isFavourite == this.isFavourite &&
          other.isPinned == this.isPinned);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> body;
  final Value<String> noteType;
  final Value<String?> audioAssetId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isFavourite;
  final Value<bool> isPinned;
  final Value<int> rowid;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.noteType = const Value.absent(),
    this.audioAssetId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String id,
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    required String noteType,
    this.audioAssetId = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isFavourite = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       noteType = Value(noteType),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Note> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? noteType,
    Expression<String>? audioAssetId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isFavourite,
    Expression<bool>? isPinned,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (noteType != null) 'note_type': noteType,
      if (audioAssetId != null) 'audio_asset_id': audioAssetId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isFavourite != null) 'is_favourite': isFavourite,
      if (isPinned != null) 'is_pinned': isPinned,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? body,
    Value<String>? noteType,
    Value<String?>? audioAssetId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isFavourite,
    Value<bool>? isPinned,
    Value<int>? rowid,
  }) {
    return NotesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      noteType: noteType ?? this.noteType,
      audioAssetId: audioAssetId ?? this.audioAssetId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFavourite: isFavourite ?? this.isFavourite,
      isPinned: isPinned ?? this.isPinned,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (noteType.present) {
      map['note_type'] = Variable<String>(noteType.value);
    }
    if (audioAssetId.present) {
      map['audio_asset_id'] = Variable<String>(audioAssetId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isFavourite.present) {
      map['is_favourite'] = Variable<bool>(isFavourite.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('noteType: $noteType, ')
          ..write('audioAssetId: $audioAssetId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('isPinned: $isPinned, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecordingSessionsTable extends RecordingSessions
    with TableInfo<$RecordingSessionsTable, RecordingSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordingSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<String> noteId = GeneratedColumn<String>(
    'note_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES notes (id)',
    ),
  );
  static const VerificationMeta _audioAssetIdMeta = const VerificationMeta(
    'audioAssetId',
  );
  @override
  late final GeneratedColumn<String> audioAssetId = GeneratedColumn<String>(
    'audio_asset_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES audio_assets (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkpointMsMeta = const VerificationMeta(
    'checkpointMs',
  );
  @override
  late final GeneratedColumn<int> checkpointMs = GeneratedColumn<int>(
    'checkpoint_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    noteId,
    audioAssetId,
    status,
    startedAt,
    endedAt,
    checkpointMs,
    errorMessage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recording_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecordingSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    }
    if (data.containsKey('audio_asset_id')) {
      context.handle(
        _audioAssetIdMeta,
        audioAssetId.isAcceptableOrUnknown(
          data['audio_asset_id']!,
          _audioAssetIdMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('checkpoint_ms')) {
      context.handle(
        _checkpointMsMeta,
        checkpointMs.isAcceptableOrUnknown(
          data['checkpoint_ms']!,
          _checkpointMsMeta,
        ),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecordingSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordingSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_id'],
      ),
      audioAssetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_asset_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
      checkpointMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}checkpoint_ms'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
    );
  }

  @override
  $RecordingSessionsTable createAlias(String alias) {
    return $RecordingSessionsTable(attachedDatabase, alias);
  }
}

class RecordingSession extends DataClass
    implements Insertable<RecordingSession> {
  final String id;
  final String? noteId;
  final String? audioAssetId;
  final String status;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int checkpointMs;
  final String? errorMessage;
  const RecordingSession({
    required this.id,
    this.noteId,
    this.audioAssetId,
    required this.status,
    required this.startedAt,
    this.endedAt,
    required this.checkpointMs,
    this.errorMessage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || noteId != null) {
      map['note_id'] = Variable<String>(noteId);
    }
    if (!nullToAbsent || audioAssetId != null) {
      map['audio_asset_id'] = Variable<String>(audioAssetId);
    }
    map['status'] = Variable<String>(status);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    map['checkpoint_ms'] = Variable<int>(checkpointMs);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    return map;
  }

  RecordingSessionsCompanion toCompanion(bool nullToAbsent) {
    return RecordingSessionsCompanion(
      id: Value(id),
      noteId: noteId == null && nullToAbsent
          ? const Value.absent()
          : Value(noteId),
      audioAssetId: audioAssetId == null && nullToAbsent
          ? const Value.absent()
          : Value(audioAssetId),
      status: Value(status),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      checkpointMs: Value(checkpointMs),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
    );
  }

  factory RecordingSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordingSession(
      id: serializer.fromJson<String>(json['id']),
      noteId: serializer.fromJson<String?>(json['noteId']),
      audioAssetId: serializer.fromJson<String?>(json['audioAssetId']),
      status: serializer.fromJson<String>(json['status']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      checkpointMs: serializer.fromJson<int>(json['checkpointMs']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'noteId': serializer.toJson<String?>(noteId),
      'audioAssetId': serializer.toJson<String?>(audioAssetId),
      'status': serializer.toJson<String>(status),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'checkpointMs': serializer.toJson<int>(checkpointMs),
      'errorMessage': serializer.toJson<String?>(errorMessage),
    };
  }

  RecordingSession copyWith({
    String? id,
    Value<String?> noteId = const Value.absent(),
    Value<String?> audioAssetId = const Value.absent(),
    String? status,
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
    int? checkpointMs,
    Value<String?> errorMessage = const Value.absent(),
  }) => RecordingSession(
    id: id ?? this.id,
    noteId: noteId.present ? noteId.value : this.noteId,
    audioAssetId: audioAssetId.present ? audioAssetId.value : this.audioAssetId,
    status: status ?? this.status,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    checkpointMs: checkpointMs ?? this.checkpointMs,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
  );
  RecordingSession copyWithCompanion(RecordingSessionsCompanion data) {
    return RecordingSession(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      audioAssetId: data.audioAssetId.present
          ? data.audioAssetId.value
          : this.audioAssetId,
      status: data.status.present ? data.status.value : this.status,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      checkpointMs: data.checkpointMs.present
          ? data.checkpointMs.value
          : this.checkpointMs,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecordingSession(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('audioAssetId: $audioAssetId, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('checkpointMs: $checkpointMs, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    noteId,
    audioAssetId,
    status,
    startedAt,
    endedAt,
    checkpointMs,
    errorMessage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordingSession &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.audioAssetId == this.audioAssetId &&
          other.status == this.status &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.checkpointMs == this.checkpointMs &&
          other.errorMessage == this.errorMessage);
}

class RecordingSessionsCompanion extends UpdateCompanion<RecordingSession> {
  final Value<String> id;
  final Value<String?> noteId;
  final Value<String?> audioAssetId;
  final Value<String> status;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<int> checkpointMs;
  final Value<String?> errorMessage;
  final Value<int> rowid;
  const RecordingSessionsCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.audioAssetId = const Value.absent(),
    this.status = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.checkpointMs = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecordingSessionsCompanion.insert({
    required String id,
    this.noteId = const Value.absent(),
    this.audioAssetId = const Value.absent(),
    required String status,
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    this.checkpointMs = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       status = Value(status),
       startedAt = Value(startedAt);
  static Insertable<RecordingSession> custom({
    Expression<String>? id,
    Expression<String>? noteId,
    Expression<String>? audioAssetId,
    Expression<String>? status,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<int>? checkpointMs,
    Expression<String>? errorMessage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteId != null) 'note_id': noteId,
      if (audioAssetId != null) 'audio_asset_id': audioAssetId,
      if (status != null) 'status': status,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (checkpointMs != null) 'checkpoint_ms': checkpointMs,
      if (errorMessage != null) 'error_message': errorMessage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecordingSessionsCompanion copyWith({
    Value<String>? id,
    Value<String?>? noteId,
    Value<String?>? audioAssetId,
    Value<String>? status,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
    Value<int>? checkpointMs,
    Value<String?>? errorMessage,
    Value<int>? rowid,
  }) {
    return RecordingSessionsCompanion(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      audioAssetId: audioAssetId ?? this.audioAssetId,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      checkpointMs: checkpointMs ?? this.checkpointMs,
      errorMessage: errorMessage ?? this.errorMessage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<String>(noteId.value);
    }
    if (audioAssetId.present) {
      map['audio_asset_id'] = Variable<String>(audioAssetId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (checkpointMs.present) {
      map['checkpoint_ms'] = Variable<int>(checkpointMs.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordingSessionsCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('audioAssetId: $audioAssetId, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('checkpointMs: $checkpointMs, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TranscriptSegmentsTable extends TranscriptSegments
    with TableInfo<$TranscriptSegmentsTable, TranscriptSegment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TranscriptSegmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<String> noteId = GeneratedColumn<String>(
    'note_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES notes (id)',
    ),
  );
  static const VerificationMeta _audioAssetIdMeta = const VerificationMeta(
    'audioAssetId',
  );
  @override
  late final GeneratedColumn<String> audioAssetId = GeneratedColumn<String>(
    'audio_asset_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES audio_assets (id)',
    ),
  );
  static const VerificationMeta _startMsMeta = const VerificationMeta(
    'startMs',
  );
  @override
  late final GeneratedColumn<int> startMs = GeneratedColumn<int>(
    'start_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMsMeta = const VerificationMeta('endMs');
  @override
  late final GeneratedColumn<int> endMs = GeneratedColumn<int>(
    'end_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalTextMeta = const VerificationMeta(
    'originalText',
  );
  @override
  late final GeneratedColumn<String> originalText = GeneratedColumn<String>(
    'original_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentTextMeta = const VerificationMeta(
    'currentText',
  );
  @override
  late final GeneratedColumn<String> currentText = GeneratedColumn<String>(
    'current_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _detectedLanguageMeta = const VerificationMeta(
    'detectedLanguage',
  );
  @override
  late final GeneratedColumn<String> detectedLanguage = GeneratedColumn<String>(
    'detected_language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speakerLabelMeta = const VerificationMeta(
    'speakerLabel',
  );
  @override
  late final GeneratedColumn<String> speakerLabel = GeneratedColumn<String>(
    'speaker_label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _engineNameMeta = const VerificationMeta(
    'engineName',
  );
  @override
  late final GeneratedColumn<String> engineName = GeneratedColumn<String>(
    'engine_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelVersionMeta = const VerificationMeta(
    'modelVersion',
  );
  @override
  late final GeneratedColumn<String> modelVersion = GeneratedColumn<String>(
    'model_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _processingSettingsMeta =
      const VerificationMeta('processingSettings');
  @override
  late final GeneratedColumn<String> processingSettings =
      GeneratedColumn<String>(
        'processing_settings',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    noteId,
    audioAssetId,
    startMs,
    endMs,
    originalText,
    currentText,
    confidence,
    detectedLanguage,
    speakerLabel,
    engineName,
    modelVersion,
    processingSettings,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transcript_segments';
  @override
  VerificationContext validateIntegrity(
    Insertable<TranscriptSegment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('audio_asset_id')) {
      context.handle(
        _audioAssetIdMeta,
        audioAssetId.isAcceptableOrUnknown(
          data['audio_asset_id']!,
          _audioAssetIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_audioAssetIdMeta);
    }
    if (data.containsKey('start_ms')) {
      context.handle(
        _startMsMeta,
        startMs.isAcceptableOrUnknown(data['start_ms']!, _startMsMeta),
      );
    } else if (isInserting) {
      context.missing(_startMsMeta);
    }
    if (data.containsKey('end_ms')) {
      context.handle(
        _endMsMeta,
        endMs.isAcceptableOrUnknown(data['end_ms']!, _endMsMeta),
      );
    } else if (isInserting) {
      context.missing(_endMsMeta);
    }
    if (data.containsKey('original_text')) {
      context.handle(
        _originalTextMeta,
        originalText.isAcceptableOrUnknown(
          data['original_text']!,
          _originalTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_originalTextMeta);
    }
    if (data.containsKey('current_text')) {
      context.handle(
        _currentTextMeta,
        currentText.isAcceptableOrUnknown(
          data['current_text']!,
          _currentTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentTextMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    if (data.containsKey('detected_language')) {
      context.handle(
        _detectedLanguageMeta,
        detectedLanguage.isAcceptableOrUnknown(
          data['detected_language']!,
          _detectedLanguageMeta,
        ),
      );
    }
    if (data.containsKey('speaker_label')) {
      context.handle(
        _speakerLabelMeta,
        speakerLabel.isAcceptableOrUnknown(
          data['speaker_label']!,
          _speakerLabelMeta,
        ),
      );
    }
    if (data.containsKey('engine_name')) {
      context.handle(
        _engineNameMeta,
        engineName.isAcceptableOrUnknown(data['engine_name']!, _engineNameMeta),
      );
    } else if (isInserting) {
      context.missing(_engineNameMeta);
    }
    if (data.containsKey('model_version')) {
      context.handle(
        _modelVersionMeta,
        modelVersion.isAcceptableOrUnknown(
          data['model_version']!,
          _modelVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_modelVersionMeta);
    }
    if (data.containsKey('processing_settings')) {
      context.handle(
        _processingSettingsMeta,
        processingSettings.isAcceptableOrUnknown(
          data['processing_settings']!,
          _processingSettingsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TranscriptSegment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranscriptSegment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_id'],
      )!,
      audioAssetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_asset_id'],
      )!,
      startMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_ms'],
      )!,
      endMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_ms'],
      )!,
      originalText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_text'],
      )!,
      currentText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_text'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      ),
      detectedLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detected_language'],
      ),
      speakerLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}speaker_label'],
      ),
      engineName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}engine_name'],
      )!,
      modelVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_version'],
      )!,
      processingSettings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}processing_settings'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TranscriptSegmentsTable createAlias(String alias) {
    return $TranscriptSegmentsTable(attachedDatabase, alias);
  }
}

class TranscriptSegment extends DataClass
    implements Insertable<TranscriptSegment> {
  final String id;
  final String noteId;
  final String audioAssetId;
  final int startMs;
  final int endMs;
  final String originalText;
  final String currentText;
  final double? confidence;
  final String? detectedLanguage;
  final String? speakerLabel;
  final String engineName;
  final String modelVersion;
  final String? processingSettings;
  final DateTime createdAt;
  const TranscriptSegment({
    required this.id,
    required this.noteId,
    required this.audioAssetId,
    required this.startMs,
    required this.endMs,
    required this.originalText,
    required this.currentText,
    this.confidence,
    this.detectedLanguage,
    this.speakerLabel,
    required this.engineName,
    required this.modelVersion,
    this.processingSettings,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['note_id'] = Variable<String>(noteId);
    map['audio_asset_id'] = Variable<String>(audioAssetId);
    map['start_ms'] = Variable<int>(startMs);
    map['end_ms'] = Variable<int>(endMs);
    map['original_text'] = Variable<String>(originalText);
    map['current_text'] = Variable<String>(currentText);
    if (!nullToAbsent || confidence != null) {
      map['confidence'] = Variable<double>(confidence);
    }
    if (!nullToAbsent || detectedLanguage != null) {
      map['detected_language'] = Variable<String>(detectedLanguage);
    }
    if (!nullToAbsent || speakerLabel != null) {
      map['speaker_label'] = Variable<String>(speakerLabel);
    }
    map['engine_name'] = Variable<String>(engineName);
    map['model_version'] = Variable<String>(modelVersion);
    if (!nullToAbsent || processingSettings != null) {
      map['processing_settings'] = Variable<String>(processingSettings);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TranscriptSegmentsCompanion toCompanion(bool nullToAbsent) {
    return TranscriptSegmentsCompanion(
      id: Value(id),
      noteId: Value(noteId),
      audioAssetId: Value(audioAssetId),
      startMs: Value(startMs),
      endMs: Value(endMs),
      originalText: Value(originalText),
      currentText: Value(currentText),
      confidence: confidence == null && nullToAbsent
          ? const Value.absent()
          : Value(confidence),
      detectedLanguage: detectedLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(detectedLanguage),
      speakerLabel: speakerLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(speakerLabel),
      engineName: Value(engineName),
      modelVersion: Value(modelVersion),
      processingSettings: processingSettings == null && nullToAbsent
          ? const Value.absent()
          : Value(processingSettings),
      createdAt: Value(createdAt),
    );
  }

  factory TranscriptSegment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranscriptSegment(
      id: serializer.fromJson<String>(json['id']),
      noteId: serializer.fromJson<String>(json['noteId']),
      audioAssetId: serializer.fromJson<String>(json['audioAssetId']),
      startMs: serializer.fromJson<int>(json['startMs']),
      endMs: serializer.fromJson<int>(json['endMs']),
      originalText: serializer.fromJson<String>(json['originalText']),
      currentText: serializer.fromJson<String>(json['currentText']),
      confidence: serializer.fromJson<double?>(json['confidence']),
      detectedLanguage: serializer.fromJson<String?>(json['detectedLanguage']),
      speakerLabel: serializer.fromJson<String?>(json['speakerLabel']),
      engineName: serializer.fromJson<String>(json['engineName']),
      modelVersion: serializer.fromJson<String>(json['modelVersion']),
      processingSettings: serializer.fromJson<String?>(
        json['processingSettings'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'noteId': serializer.toJson<String>(noteId),
      'audioAssetId': serializer.toJson<String>(audioAssetId),
      'startMs': serializer.toJson<int>(startMs),
      'endMs': serializer.toJson<int>(endMs),
      'originalText': serializer.toJson<String>(originalText),
      'currentText': serializer.toJson<String>(currentText),
      'confidence': serializer.toJson<double?>(confidence),
      'detectedLanguage': serializer.toJson<String?>(detectedLanguage),
      'speakerLabel': serializer.toJson<String?>(speakerLabel),
      'engineName': serializer.toJson<String>(engineName),
      'modelVersion': serializer.toJson<String>(modelVersion),
      'processingSettings': serializer.toJson<String?>(processingSettings),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TranscriptSegment copyWith({
    String? id,
    String? noteId,
    String? audioAssetId,
    int? startMs,
    int? endMs,
    String? originalText,
    String? currentText,
    Value<double?> confidence = const Value.absent(),
    Value<String?> detectedLanguage = const Value.absent(),
    Value<String?> speakerLabel = const Value.absent(),
    String? engineName,
    String? modelVersion,
    Value<String?> processingSettings = const Value.absent(),
    DateTime? createdAt,
  }) => TranscriptSegment(
    id: id ?? this.id,
    noteId: noteId ?? this.noteId,
    audioAssetId: audioAssetId ?? this.audioAssetId,
    startMs: startMs ?? this.startMs,
    endMs: endMs ?? this.endMs,
    originalText: originalText ?? this.originalText,
    currentText: currentText ?? this.currentText,
    confidence: confidence.present ? confidence.value : this.confidence,
    detectedLanguage: detectedLanguage.present
        ? detectedLanguage.value
        : this.detectedLanguage,
    speakerLabel: speakerLabel.present ? speakerLabel.value : this.speakerLabel,
    engineName: engineName ?? this.engineName,
    modelVersion: modelVersion ?? this.modelVersion,
    processingSettings: processingSettings.present
        ? processingSettings.value
        : this.processingSettings,
    createdAt: createdAt ?? this.createdAt,
  );
  TranscriptSegment copyWithCompanion(TranscriptSegmentsCompanion data) {
    return TranscriptSegment(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      audioAssetId: data.audioAssetId.present
          ? data.audioAssetId.value
          : this.audioAssetId,
      startMs: data.startMs.present ? data.startMs.value : this.startMs,
      endMs: data.endMs.present ? data.endMs.value : this.endMs,
      originalText: data.originalText.present
          ? data.originalText.value
          : this.originalText,
      currentText: data.currentText.present
          ? data.currentText.value
          : this.currentText,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      detectedLanguage: data.detectedLanguage.present
          ? data.detectedLanguage.value
          : this.detectedLanguage,
      speakerLabel: data.speakerLabel.present
          ? data.speakerLabel.value
          : this.speakerLabel,
      engineName: data.engineName.present
          ? data.engineName.value
          : this.engineName,
      modelVersion: data.modelVersion.present
          ? data.modelVersion.value
          : this.modelVersion,
      processingSettings: data.processingSettings.present
          ? data.processingSettings.value
          : this.processingSettings,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TranscriptSegment(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('audioAssetId: $audioAssetId, ')
          ..write('startMs: $startMs, ')
          ..write('endMs: $endMs, ')
          ..write('originalText: $originalText, ')
          ..write('currentText: $currentText, ')
          ..write('confidence: $confidence, ')
          ..write('detectedLanguage: $detectedLanguage, ')
          ..write('speakerLabel: $speakerLabel, ')
          ..write('engineName: $engineName, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('processingSettings: $processingSettings, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    noteId,
    audioAssetId,
    startMs,
    endMs,
    originalText,
    currentText,
    confidence,
    detectedLanguage,
    speakerLabel,
    engineName,
    modelVersion,
    processingSettings,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranscriptSegment &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.audioAssetId == this.audioAssetId &&
          other.startMs == this.startMs &&
          other.endMs == this.endMs &&
          other.originalText == this.originalText &&
          other.currentText == this.currentText &&
          other.confidence == this.confidence &&
          other.detectedLanguage == this.detectedLanguage &&
          other.speakerLabel == this.speakerLabel &&
          other.engineName == this.engineName &&
          other.modelVersion == this.modelVersion &&
          other.processingSettings == this.processingSettings &&
          other.createdAt == this.createdAt);
}

class TranscriptSegmentsCompanion extends UpdateCompanion<TranscriptSegment> {
  final Value<String> id;
  final Value<String> noteId;
  final Value<String> audioAssetId;
  final Value<int> startMs;
  final Value<int> endMs;
  final Value<String> originalText;
  final Value<String> currentText;
  final Value<double?> confidence;
  final Value<String?> detectedLanguage;
  final Value<String?> speakerLabel;
  final Value<String> engineName;
  final Value<String> modelVersion;
  final Value<String?> processingSettings;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TranscriptSegmentsCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.audioAssetId = const Value.absent(),
    this.startMs = const Value.absent(),
    this.endMs = const Value.absent(),
    this.originalText = const Value.absent(),
    this.currentText = const Value.absent(),
    this.confidence = const Value.absent(),
    this.detectedLanguage = const Value.absent(),
    this.speakerLabel = const Value.absent(),
    this.engineName = const Value.absent(),
    this.modelVersion = const Value.absent(),
    this.processingSettings = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TranscriptSegmentsCompanion.insert({
    required String id,
    required String noteId,
    required String audioAssetId,
    required int startMs,
    required int endMs,
    required String originalText,
    required String currentText,
    this.confidence = const Value.absent(),
    this.detectedLanguage = const Value.absent(),
    this.speakerLabel = const Value.absent(),
    required String engineName,
    required String modelVersion,
    this.processingSettings = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       noteId = Value(noteId),
       audioAssetId = Value(audioAssetId),
       startMs = Value(startMs),
       endMs = Value(endMs),
       originalText = Value(originalText),
       currentText = Value(currentText),
       engineName = Value(engineName),
       modelVersion = Value(modelVersion),
       createdAt = Value(createdAt);
  static Insertable<TranscriptSegment> custom({
    Expression<String>? id,
    Expression<String>? noteId,
    Expression<String>? audioAssetId,
    Expression<int>? startMs,
    Expression<int>? endMs,
    Expression<String>? originalText,
    Expression<String>? currentText,
    Expression<double>? confidence,
    Expression<String>? detectedLanguage,
    Expression<String>? speakerLabel,
    Expression<String>? engineName,
    Expression<String>? modelVersion,
    Expression<String>? processingSettings,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteId != null) 'note_id': noteId,
      if (audioAssetId != null) 'audio_asset_id': audioAssetId,
      if (startMs != null) 'start_ms': startMs,
      if (endMs != null) 'end_ms': endMs,
      if (originalText != null) 'original_text': originalText,
      if (currentText != null) 'current_text': currentText,
      if (confidence != null) 'confidence': confidence,
      if (detectedLanguage != null) 'detected_language': detectedLanguage,
      if (speakerLabel != null) 'speaker_label': speakerLabel,
      if (engineName != null) 'engine_name': engineName,
      if (modelVersion != null) 'model_version': modelVersion,
      if (processingSettings != null) 'processing_settings': processingSettings,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TranscriptSegmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? noteId,
    Value<String>? audioAssetId,
    Value<int>? startMs,
    Value<int>? endMs,
    Value<String>? originalText,
    Value<String>? currentText,
    Value<double?>? confidence,
    Value<String?>? detectedLanguage,
    Value<String?>? speakerLabel,
    Value<String>? engineName,
    Value<String>? modelVersion,
    Value<String?>? processingSettings,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TranscriptSegmentsCompanion(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      audioAssetId: audioAssetId ?? this.audioAssetId,
      startMs: startMs ?? this.startMs,
      endMs: endMs ?? this.endMs,
      originalText: originalText ?? this.originalText,
      currentText: currentText ?? this.currentText,
      confidence: confidence ?? this.confidence,
      detectedLanguage: detectedLanguage ?? this.detectedLanguage,
      speakerLabel: speakerLabel ?? this.speakerLabel,
      engineName: engineName ?? this.engineName,
      modelVersion: modelVersion ?? this.modelVersion,
      processingSettings: processingSettings ?? this.processingSettings,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<String>(noteId.value);
    }
    if (audioAssetId.present) {
      map['audio_asset_id'] = Variable<String>(audioAssetId.value);
    }
    if (startMs.present) {
      map['start_ms'] = Variable<int>(startMs.value);
    }
    if (endMs.present) {
      map['end_ms'] = Variable<int>(endMs.value);
    }
    if (originalText.present) {
      map['original_text'] = Variable<String>(originalText.value);
    }
    if (currentText.present) {
      map['current_text'] = Variable<String>(currentText.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (detectedLanguage.present) {
      map['detected_language'] = Variable<String>(detectedLanguage.value);
    }
    if (speakerLabel.present) {
      map['speaker_label'] = Variable<String>(speakerLabel.value);
    }
    if (engineName.present) {
      map['engine_name'] = Variable<String>(engineName.value);
    }
    if (modelVersion.present) {
      map['model_version'] = Variable<String>(modelVersion.value);
    }
    if (processingSettings.present) {
      map['processing_settings'] = Variable<String>(processingSettings.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranscriptSegmentsCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('audioAssetId: $audioAssetId, ')
          ..write('startMs: $startMs, ')
          ..write('endMs: $endMs, ')
          ..write('originalText: $originalText, ')
          ..write('currentText: $currentText, ')
          ..write('confidence: $confidence, ')
          ..write('detectedLanguage: $detectedLanguage, ')
          ..write('speakerLabel: $speakerLabel, ')
          ..write('engineName: $engineName, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('processingSettings: $processingSettings, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TranscriptRevisionsTable extends TranscriptRevisions
    with TableInfo<$TranscriptRevisionsTable, TranscriptRevision> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TranscriptRevisionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _segmentIdMeta = const VerificationMeta(
    'segmentId',
  );
  @override
  late final GeneratedColumn<String> segmentId = GeneratedColumn<String>(
    'segment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transcript_segments (id)',
    ),
  );
  static const VerificationMeta _previousTextMeta = const VerificationMeta(
    'previousText',
  );
  @override
  late final GeneratedColumn<String> previousText = GeneratedColumn<String>(
    'previous_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correctedTextMeta = const VerificationMeta(
    'correctedText',
  );
  @override
  late final GeneratedColumn<String> correctedText = GeneratedColumn<String>(
    'corrected_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _revisedByMeta = const VerificationMeta(
    'revisedBy',
  );
  @override
  late final GeneratedColumn<String> revisedBy = GeneratedColumn<String>(
    'revised_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('user'),
  );
  static const VerificationMeta _revisedAtMeta = const VerificationMeta(
    'revisedAt',
  );
  @override
  late final GeneratedColumn<DateTime> revisedAt = GeneratedColumn<DateTime>(
    'revised_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    segmentId,
    previousText,
    correctedText,
    revisedBy,
    revisedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transcript_revisions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TranscriptRevision> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('segment_id')) {
      context.handle(
        _segmentIdMeta,
        segmentId.isAcceptableOrUnknown(data['segment_id']!, _segmentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_segmentIdMeta);
    }
    if (data.containsKey('previous_text')) {
      context.handle(
        _previousTextMeta,
        previousText.isAcceptableOrUnknown(
          data['previous_text']!,
          _previousTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_previousTextMeta);
    }
    if (data.containsKey('corrected_text')) {
      context.handle(
        _correctedTextMeta,
        correctedText.isAcceptableOrUnknown(
          data['corrected_text']!,
          _correctedTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_correctedTextMeta);
    }
    if (data.containsKey('revised_by')) {
      context.handle(
        _revisedByMeta,
        revisedBy.isAcceptableOrUnknown(data['revised_by']!, _revisedByMeta),
      );
    }
    if (data.containsKey('revised_at')) {
      context.handle(
        _revisedAtMeta,
        revisedAt.isAcceptableOrUnknown(data['revised_at']!, _revisedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_revisedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TranscriptRevision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranscriptRevision(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      segmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}segment_id'],
      )!,
      previousText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}previous_text'],
      )!,
      correctedText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corrected_text'],
      )!,
      revisedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}revised_by'],
      )!,
      revisedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}revised_at'],
      )!,
    );
  }

  @override
  $TranscriptRevisionsTable createAlias(String alias) {
    return $TranscriptRevisionsTable(attachedDatabase, alias);
  }
}

class TranscriptRevision extends DataClass
    implements Insertable<TranscriptRevision> {
  final String id;
  final String segmentId;
  final String previousText;
  final String correctedText;
  final String revisedBy;
  final DateTime revisedAt;
  const TranscriptRevision({
    required this.id,
    required this.segmentId,
    required this.previousText,
    required this.correctedText,
    required this.revisedBy,
    required this.revisedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['segment_id'] = Variable<String>(segmentId);
    map['previous_text'] = Variable<String>(previousText);
    map['corrected_text'] = Variable<String>(correctedText);
    map['revised_by'] = Variable<String>(revisedBy);
    map['revised_at'] = Variable<DateTime>(revisedAt);
    return map;
  }

  TranscriptRevisionsCompanion toCompanion(bool nullToAbsent) {
    return TranscriptRevisionsCompanion(
      id: Value(id),
      segmentId: Value(segmentId),
      previousText: Value(previousText),
      correctedText: Value(correctedText),
      revisedBy: Value(revisedBy),
      revisedAt: Value(revisedAt),
    );
  }

  factory TranscriptRevision.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranscriptRevision(
      id: serializer.fromJson<String>(json['id']),
      segmentId: serializer.fromJson<String>(json['segmentId']),
      previousText: serializer.fromJson<String>(json['previousText']),
      correctedText: serializer.fromJson<String>(json['correctedText']),
      revisedBy: serializer.fromJson<String>(json['revisedBy']),
      revisedAt: serializer.fromJson<DateTime>(json['revisedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'segmentId': serializer.toJson<String>(segmentId),
      'previousText': serializer.toJson<String>(previousText),
      'correctedText': serializer.toJson<String>(correctedText),
      'revisedBy': serializer.toJson<String>(revisedBy),
      'revisedAt': serializer.toJson<DateTime>(revisedAt),
    };
  }

  TranscriptRevision copyWith({
    String? id,
    String? segmentId,
    String? previousText,
    String? correctedText,
    String? revisedBy,
    DateTime? revisedAt,
  }) => TranscriptRevision(
    id: id ?? this.id,
    segmentId: segmentId ?? this.segmentId,
    previousText: previousText ?? this.previousText,
    correctedText: correctedText ?? this.correctedText,
    revisedBy: revisedBy ?? this.revisedBy,
    revisedAt: revisedAt ?? this.revisedAt,
  );
  TranscriptRevision copyWithCompanion(TranscriptRevisionsCompanion data) {
    return TranscriptRevision(
      id: data.id.present ? data.id.value : this.id,
      segmentId: data.segmentId.present ? data.segmentId.value : this.segmentId,
      previousText: data.previousText.present
          ? data.previousText.value
          : this.previousText,
      correctedText: data.correctedText.present
          ? data.correctedText.value
          : this.correctedText,
      revisedBy: data.revisedBy.present ? data.revisedBy.value : this.revisedBy,
      revisedAt: data.revisedAt.present ? data.revisedAt.value : this.revisedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TranscriptRevision(')
          ..write('id: $id, ')
          ..write('segmentId: $segmentId, ')
          ..write('previousText: $previousText, ')
          ..write('correctedText: $correctedText, ')
          ..write('revisedBy: $revisedBy, ')
          ..write('revisedAt: $revisedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    segmentId,
    previousText,
    correctedText,
    revisedBy,
    revisedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranscriptRevision &&
          other.id == this.id &&
          other.segmentId == this.segmentId &&
          other.previousText == this.previousText &&
          other.correctedText == this.correctedText &&
          other.revisedBy == this.revisedBy &&
          other.revisedAt == this.revisedAt);
}

class TranscriptRevisionsCompanion extends UpdateCompanion<TranscriptRevision> {
  final Value<String> id;
  final Value<String> segmentId;
  final Value<String> previousText;
  final Value<String> correctedText;
  final Value<String> revisedBy;
  final Value<DateTime> revisedAt;
  final Value<int> rowid;
  const TranscriptRevisionsCompanion({
    this.id = const Value.absent(),
    this.segmentId = const Value.absent(),
    this.previousText = const Value.absent(),
    this.correctedText = const Value.absent(),
    this.revisedBy = const Value.absent(),
    this.revisedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TranscriptRevisionsCompanion.insert({
    required String id,
    required String segmentId,
    required String previousText,
    required String correctedText,
    this.revisedBy = const Value.absent(),
    required DateTime revisedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       segmentId = Value(segmentId),
       previousText = Value(previousText),
       correctedText = Value(correctedText),
       revisedAt = Value(revisedAt);
  static Insertable<TranscriptRevision> custom({
    Expression<String>? id,
    Expression<String>? segmentId,
    Expression<String>? previousText,
    Expression<String>? correctedText,
    Expression<String>? revisedBy,
    Expression<DateTime>? revisedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (segmentId != null) 'segment_id': segmentId,
      if (previousText != null) 'previous_text': previousText,
      if (correctedText != null) 'corrected_text': correctedText,
      if (revisedBy != null) 'revised_by': revisedBy,
      if (revisedAt != null) 'revised_at': revisedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TranscriptRevisionsCompanion copyWith({
    Value<String>? id,
    Value<String>? segmentId,
    Value<String>? previousText,
    Value<String>? correctedText,
    Value<String>? revisedBy,
    Value<DateTime>? revisedAt,
    Value<int>? rowid,
  }) {
    return TranscriptRevisionsCompanion(
      id: id ?? this.id,
      segmentId: segmentId ?? this.segmentId,
      previousText: previousText ?? this.previousText,
      correctedText: correctedText ?? this.correctedText,
      revisedBy: revisedBy ?? this.revisedBy,
      revisedAt: revisedAt ?? this.revisedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (segmentId.present) {
      map['segment_id'] = Variable<String>(segmentId.value);
    }
    if (previousText.present) {
      map['previous_text'] = Variable<String>(previousText.value);
    }
    if (correctedText.present) {
      map['corrected_text'] = Variable<String>(correctedText.value);
    }
    if (revisedBy.present) {
      map['revised_by'] = Variable<String>(revisedBy.value);
    }
    if (revisedAt.present) {
      map['revised_at'] = Variable<DateTime>(revisedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranscriptRevisionsCompanion(')
          ..write('id: $id, ')
          ..write('segmentId: $segmentId, ')
          ..write('previousText: $previousText, ')
          ..write('correctedText: $correctedText, ')
          ..write('revisedBy: $revisedBy, ')
          ..write('revisedAt: $revisedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InsightClaimsTable extends InsightClaims
    with TableInfo<$InsightClaimsTable, InsightClaim> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InsightClaimsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<String> noteId = GeneratedColumn<String>(
    'note_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES notes (id)',
    ),
  );
  static const VerificationMeta _claimTextMeta = const VerificationMeta(
    'claimText',
  );
  @override
  late final GeneratedColumn<String> claimText = GeneratedColumn<String>(
    'claim_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _claimTypeMeta = const VerificationMeta(
    'claimType',
  );
  @override
  late final GeneratedColumn<String> claimType = GeneratedColumn<String>(
    'claim_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelUsedMeta = const VerificationMeta(
    'modelUsed',
  );
  @override
  late final GeneratedColumn<String> modelUsed = GeneratedColumn<String>(
    'model_used',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelVersionMeta = const VerificationMeta(
    'modelVersion',
  );
  @override
  late final GeneratedColumn<String> modelVersion = GeneratedColumn<String>(
    'model_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _promptVersionMeta = const VerificationMeta(
    'promptVersion',
  );
  @override
  late final GeneratedColumn<String> promptVersion = GeneratedColumn<String>(
    'prompt_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supportScoreMeta = const VerificationMeta(
    'supportScore',
  );
  @override
  late final GeneratedColumn<double> supportScore = GeneratedColumn<double>(
    'support_score',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _verificationStateMeta = const VerificationMeta(
    'verificationState',
  );
  @override
  late final GeneratedColumn<String> verificationState =
      GeneratedColumn<String>(
        'verification_state',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('needs_review'),
      );
  static const VerificationMeta _inputTranscriptHashMeta =
      const VerificationMeta('inputTranscriptHash');
  @override
  late final GeneratedColumn<String> inputTranscriptHash =
      GeneratedColumn<String>(
        'input_transcript_hash',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _processingDurationMsMeta =
      const VerificationMeta('processingDurationMs');
  @override
  late final GeneratedColumn<int> processingDurationMs = GeneratedColumn<int>(
    'processing_duration_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    noteId,
    claimText,
    claimType,
    modelUsed,
    modelVersion,
    promptVersion,
    supportScore,
    verificationState,
    inputTranscriptHash,
    processingDurationMs,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'insight_claims';
  @override
  VerificationContext validateIntegrity(
    Insertable<InsightClaim> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('claim_text')) {
      context.handle(
        _claimTextMeta,
        claimText.isAcceptableOrUnknown(data['claim_text']!, _claimTextMeta),
      );
    } else if (isInserting) {
      context.missing(_claimTextMeta);
    }
    if (data.containsKey('claim_type')) {
      context.handle(
        _claimTypeMeta,
        claimType.isAcceptableOrUnknown(data['claim_type']!, _claimTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_claimTypeMeta);
    }
    if (data.containsKey('model_used')) {
      context.handle(
        _modelUsedMeta,
        modelUsed.isAcceptableOrUnknown(data['model_used']!, _modelUsedMeta),
      );
    } else if (isInserting) {
      context.missing(_modelUsedMeta);
    }
    if (data.containsKey('model_version')) {
      context.handle(
        _modelVersionMeta,
        modelVersion.isAcceptableOrUnknown(
          data['model_version']!,
          _modelVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_modelVersionMeta);
    }
    if (data.containsKey('prompt_version')) {
      context.handle(
        _promptVersionMeta,
        promptVersion.isAcceptableOrUnknown(
          data['prompt_version']!,
          _promptVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_promptVersionMeta);
    }
    if (data.containsKey('support_score')) {
      context.handle(
        _supportScoreMeta,
        supportScore.isAcceptableOrUnknown(
          data['support_score']!,
          _supportScoreMeta,
        ),
      );
    }
    if (data.containsKey('verification_state')) {
      context.handle(
        _verificationStateMeta,
        verificationState.isAcceptableOrUnknown(
          data['verification_state']!,
          _verificationStateMeta,
        ),
      );
    }
    if (data.containsKey('input_transcript_hash')) {
      context.handle(
        _inputTranscriptHashMeta,
        inputTranscriptHash.isAcceptableOrUnknown(
          data['input_transcript_hash']!,
          _inputTranscriptHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inputTranscriptHashMeta);
    }
    if (data.containsKey('processing_duration_ms')) {
      context.handle(
        _processingDurationMsMeta,
        processingDurationMs.isAcceptableOrUnknown(
          data['processing_duration_ms']!,
          _processingDurationMsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InsightClaim map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InsightClaim(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_id'],
      )!,
      claimText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}claim_text'],
      )!,
      claimType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}claim_type'],
      )!,
      modelUsed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_used'],
      )!,
      modelVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_version'],
      )!,
      promptVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prompt_version'],
      )!,
      supportScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}support_score'],
      ),
      verificationState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verification_state'],
      )!,
      inputTranscriptHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}input_transcript_hash'],
      )!,
      processingDurationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}processing_duration_ms'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $InsightClaimsTable createAlias(String alias) {
    return $InsightClaimsTable(attachedDatabase, alias);
  }
}

class InsightClaim extends DataClass implements Insertable<InsightClaim> {
  final String id;
  final String noteId;
  final String claimText;
  final String claimType;
  final String modelUsed;
  final String modelVersion;
  final String promptVersion;
  final double? supportScore;
  final String verificationState;
  final String inputTranscriptHash;
  final int? processingDurationMs;
  final DateTime createdAt;
  final DateTime updatedAt;
  const InsightClaim({
    required this.id,
    required this.noteId,
    required this.claimText,
    required this.claimType,
    required this.modelUsed,
    required this.modelVersion,
    required this.promptVersion,
    this.supportScore,
    required this.verificationState,
    required this.inputTranscriptHash,
    this.processingDurationMs,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['note_id'] = Variable<String>(noteId);
    map['claim_text'] = Variable<String>(claimText);
    map['claim_type'] = Variable<String>(claimType);
    map['model_used'] = Variable<String>(modelUsed);
    map['model_version'] = Variable<String>(modelVersion);
    map['prompt_version'] = Variable<String>(promptVersion);
    if (!nullToAbsent || supportScore != null) {
      map['support_score'] = Variable<double>(supportScore);
    }
    map['verification_state'] = Variable<String>(verificationState);
    map['input_transcript_hash'] = Variable<String>(inputTranscriptHash);
    if (!nullToAbsent || processingDurationMs != null) {
      map['processing_duration_ms'] = Variable<int>(processingDurationMs);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  InsightClaimsCompanion toCompanion(bool nullToAbsent) {
    return InsightClaimsCompanion(
      id: Value(id),
      noteId: Value(noteId),
      claimText: Value(claimText),
      claimType: Value(claimType),
      modelUsed: Value(modelUsed),
      modelVersion: Value(modelVersion),
      promptVersion: Value(promptVersion),
      supportScore: supportScore == null && nullToAbsent
          ? const Value.absent()
          : Value(supportScore),
      verificationState: Value(verificationState),
      inputTranscriptHash: Value(inputTranscriptHash),
      processingDurationMs: processingDurationMs == null && nullToAbsent
          ? const Value.absent()
          : Value(processingDurationMs),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory InsightClaim.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InsightClaim(
      id: serializer.fromJson<String>(json['id']),
      noteId: serializer.fromJson<String>(json['noteId']),
      claimText: serializer.fromJson<String>(json['claimText']),
      claimType: serializer.fromJson<String>(json['claimType']),
      modelUsed: serializer.fromJson<String>(json['modelUsed']),
      modelVersion: serializer.fromJson<String>(json['modelVersion']),
      promptVersion: serializer.fromJson<String>(json['promptVersion']),
      supportScore: serializer.fromJson<double?>(json['supportScore']),
      verificationState: serializer.fromJson<String>(json['verificationState']),
      inputTranscriptHash: serializer.fromJson<String>(
        json['inputTranscriptHash'],
      ),
      processingDurationMs: serializer.fromJson<int?>(
        json['processingDurationMs'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'noteId': serializer.toJson<String>(noteId),
      'claimText': serializer.toJson<String>(claimText),
      'claimType': serializer.toJson<String>(claimType),
      'modelUsed': serializer.toJson<String>(modelUsed),
      'modelVersion': serializer.toJson<String>(modelVersion),
      'promptVersion': serializer.toJson<String>(promptVersion),
      'supportScore': serializer.toJson<double?>(supportScore),
      'verificationState': serializer.toJson<String>(verificationState),
      'inputTranscriptHash': serializer.toJson<String>(inputTranscriptHash),
      'processingDurationMs': serializer.toJson<int?>(processingDurationMs),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  InsightClaim copyWith({
    String? id,
    String? noteId,
    String? claimText,
    String? claimType,
    String? modelUsed,
    String? modelVersion,
    String? promptVersion,
    Value<double?> supportScore = const Value.absent(),
    String? verificationState,
    String? inputTranscriptHash,
    Value<int?> processingDurationMs = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => InsightClaim(
    id: id ?? this.id,
    noteId: noteId ?? this.noteId,
    claimText: claimText ?? this.claimText,
    claimType: claimType ?? this.claimType,
    modelUsed: modelUsed ?? this.modelUsed,
    modelVersion: modelVersion ?? this.modelVersion,
    promptVersion: promptVersion ?? this.promptVersion,
    supportScore: supportScore.present ? supportScore.value : this.supportScore,
    verificationState: verificationState ?? this.verificationState,
    inputTranscriptHash: inputTranscriptHash ?? this.inputTranscriptHash,
    processingDurationMs: processingDurationMs.present
        ? processingDurationMs.value
        : this.processingDurationMs,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  InsightClaim copyWithCompanion(InsightClaimsCompanion data) {
    return InsightClaim(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      claimText: data.claimText.present ? data.claimText.value : this.claimText,
      claimType: data.claimType.present ? data.claimType.value : this.claimType,
      modelUsed: data.modelUsed.present ? data.modelUsed.value : this.modelUsed,
      modelVersion: data.modelVersion.present
          ? data.modelVersion.value
          : this.modelVersion,
      promptVersion: data.promptVersion.present
          ? data.promptVersion.value
          : this.promptVersion,
      supportScore: data.supportScore.present
          ? data.supportScore.value
          : this.supportScore,
      verificationState: data.verificationState.present
          ? data.verificationState.value
          : this.verificationState,
      inputTranscriptHash: data.inputTranscriptHash.present
          ? data.inputTranscriptHash.value
          : this.inputTranscriptHash,
      processingDurationMs: data.processingDurationMs.present
          ? data.processingDurationMs.value
          : this.processingDurationMs,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InsightClaim(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('claimText: $claimText, ')
          ..write('claimType: $claimType, ')
          ..write('modelUsed: $modelUsed, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('promptVersion: $promptVersion, ')
          ..write('supportScore: $supportScore, ')
          ..write('verificationState: $verificationState, ')
          ..write('inputTranscriptHash: $inputTranscriptHash, ')
          ..write('processingDurationMs: $processingDurationMs, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    noteId,
    claimText,
    claimType,
    modelUsed,
    modelVersion,
    promptVersion,
    supportScore,
    verificationState,
    inputTranscriptHash,
    processingDurationMs,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InsightClaim &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.claimText == this.claimText &&
          other.claimType == this.claimType &&
          other.modelUsed == this.modelUsed &&
          other.modelVersion == this.modelVersion &&
          other.promptVersion == this.promptVersion &&
          other.supportScore == this.supportScore &&
          other.verificationState == this.verificationState &&
          other.inputTranscriptHash == this.inputTranscriptHash &&
          other.processingDurationMs == this.processingDurationMs &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class InsightClaimsCompanion extends UpdateCompanion<InsightClaim> {
  final Value<String> id;
  final Value<String> noteId;
  final Value<String> claimText;
  final Value<String> claimType;
  final Value<String> modelUsed;
  final Value<String> modelVersion;
  final Value<String> promptVersion;
  final Value<double?> supportScore;
  final Value<String> verificationState;
  final Value<String> inputTranscriptHash;
  final Value<int?> processingDurationMs;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const InsightClaimsCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.claimText = const Value.absent(),
    this.claimType = const Value.absent(),
    this.modelUsed = const Value.absent(),
    this.modelVersion = const Value.absent(),
    this.promptVersion = const Value.absent(),
    this.supportScore = const Value.absent(),
    this.verificationState = const Value.absent(),
    this.inputTranscriptHash = const Value.absent(),
    this.processingDurationMs = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InsightClaimsCompanion.insert({
    required String id,
    required String noteId,
    required String claimText,
    required String claimType,
    required String modelUsed,
    required String modelVersion,
    required String promptVersion,
    this.supportScore = const Value.absent(),
    this.verificationState = const Value.absent(),
    required String inputTranscriptHash,
    this.processingDurationMs = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       noteId = Value(noteId),
       claimText = Value(claimText),
       claimType = Value(claimType),
       modelUsed = Value(modelUsed),
       modelVersion = Value(modelVersion),
       promptVersion = Value(promptVersion),
       inputTranscriptHash = Value(inputTranscriptHash),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<InsightClaim> custom({
    Expression<String>? id,
    Expression<String>? noteId,
    Expression<String>? claimText,
    Expression<String>? claimType,
    Expression<String>? modelUsed,
    Expression<String>? modelVersion,
    Expression<String>? promptVersion,
    Expression<double>? supportScore,
    Expression<String>? verificationState,
    Expression<String>? inputTranscriptHash,
    Expression<int>? processingDurationMs,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteId != null) 'note_id': noteId,
      if (claimText != null) 'claim_text': claimText,
      if (claimType != null) 'claim_type': claimType,
      if (modelUsed != null) 'model_used': modelUsed,
      if (modelVersion != null) 'model_version': modelVersion,
      if (promptVersion != null) 'prompt_version': promptVersion,
      if (supportScore != null) 'support_score': supportScore,
      if (verificationState != null) 'verification_state': verificationState,
      if (inputTranscriptHash != null)
        'input_transcript_hash': inputTranscriptHash,
      if (processingDurationMs != null)
        'processing_duration_ms': processingDurationMs,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InsightClaimsCompanion copyWith({
    Value<String>? id,
    Value<String>? noteId,
    Value<String>? claimText,
    Value<String>? claimType,
    Value<String>? modelUsed,
    Value<String>? modelVersion,
    Value<String>? promptVersion,
    Value<double?>? supportScore,
    Value<String>? verificationState,
    Value<String>? inputTranscriptHash,
    Value<int?>? processingDurationMs,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return InsightClaimsCompanion(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      claimText: claimText ?? this.claimText,
      claimType: claimType ?? this.claimType,
      modelUsed: modelUsed ?? this.modelUsed,
      modelVersion: modelVersion ?? this.modelVersion,
      promptVersion: promptVersion ?? this.promptVersion,
      supportScore: supportScore ?? this.supportScore,
      verificationState: verificationState ?? this.verificationState,
      inputTranscriptHash: inputTranscriptHash ?? this.inputTranscriptHash,
      processingDurationMs: processingDurationMs ?? this.processingDurationMs,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<String>(noteId.value);
    }
    if (claimText.present) {
      map['claim_text'] = Variable<String>(claimText.value);
    }
    if (claimType.present) {
      map['claim_type'] = Variable<String>(claimType.value);
    }
    if (modelUsed.present) {
      map['model_used'] = Variable<String>(modelUsed.value);
    }
    if (modelVersion.present) {
      map['model_version'] = Variable<String>(modelVersion.value);
    }
    if (promptVersion.present) {
      map['prompt_version'] = Variable<String>(promptVersion.value);
    }
    if (supportScore.present) {
      map['support_score'] = Variable<double>(supportScore.value);
    }
    if (verificationState.present) {
      map['verification_state'] = Variable<String>(verificationState.value);
    }
    if (inputTranscriptHash.present) {
      map['input_transcript_hash'] = Variable<String>(
        inputTranscriptHash.value,
      );
    }
    if (processingDurationMs.present) {
      map['processing_duration_ms'] = Variable<int>(processingDurationMs.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InsightClaimsCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('claimText: $claimText, ')
          ..write('claimType: $claimType, ')
          ..write('modelUsed: $modelUsed, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('promptVersion: $promptVersion, ')
          ..write('supportScore: $supportScore, ')
          ..write('verificationState: $verificationState, ')
          ..write('inputTranscriptHash: $inputTranscriptHash, ')
          ..write('processingDurationMs: $processingDurationMs, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClaimSourcesTable extends ClaimSources
    with TableInfo<$ClaimSourcesTable, ClaimSource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClaimSourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _claimIdMeta = const VerificationMeta(
    'claimId',
  );
  @override
  late final GeneratedColumn<String> claimId = GeneratedColumn<String>(
    'claim_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES insight_claims (id)',
    ),
  );
  static const VerificationMeta _transcriptSegmentIdMeta =
      const VerificationMeta('transcriptSegmentId');
  @override
  late final GeneratedColumn<String> transcriptSegmentId =
      GeneratedColumn<String>(
        'transcript_segment_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transcript_segments (id)',
        ),
      );
  static const VerificationMeta _audioStartMsMeta = const VerificationMeta(
    'audioStartMs',
  );
  @override
  late final GeneratedColumn<int> audioStartMs = GeneratedColumn<int>(
    'audio_start_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _audioEndMsMeta = const VerificationMeta(
    'audioEndMs',
  );
  @override
  late final GeneratedColumn<int> audioEndMs = GeneratedColumn<int>(
    'audio_end_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    claimId,
    transcriptSegmentId,
    audioStartMs,
    audioEndMs,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'claim_sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClaimSource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('claim_id')) {
      context.handle(
        _claimIdMeta,
        claimId.isAcceptableOrUnknown(data['claim_id']!, _claimIdMeta),
      );
    } else if (isInserting) {
      context.missing(_claimIdMeta);
    }
    if (data.containsKey('transcript_segment_id')) {
      context.handle(
        _transcriptSegmentIdMeta,
        transcriptSegmentId.isAcceptableOrUnknown(
          data['transcript_segment_id']!,
          _transcriptSegmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transcriptSegmentIdMeta);
    }
    if (data.containsKey('audio_start_ms')) {
      context.handle(
        _audioStartMsMeta,
        audioStartMs.isAcceptableOrUnknown(
          data['audio_start_ms']!,
          _audioStartMsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_audioStartMsMeta);
    }
    if (data.containsKey('audio_end_ms')) {
      context.handle(
        _audioEndMsMeta,
        audioEndMs.isAcceptableOrUnknown(
          data['audio_end_ms']!,
          _audioEndMsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_audioEndMsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClaimSource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClaimSource(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      claimId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}claim_id'],
      )!,
      transcriptSegmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transcript_segment_id'],
      )!,
      audioStartMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}audio_start_ms'],
      )!,
      audioEndMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}audio_end_ms'],
      )!,
    );
  }

  @override
  $ClaimSourcesTable createAlias(String alias) {
    return $ClaimSourcesTable(attachedDatabase, alias);
  }
}

class ClaimSource extends DataClass implements Insertable<ClaimSource> {
  final String id;
  final String claimId;
  final String transcriptSegmentId;
  final int audioStartMs;
  final int audioEndMs;
  const ClaimSource({
    required this.id,
    required this.claimId,
    required this.transcriptSegmentId,
    required this.audioStartMs,
    required this.audioEndMs,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['claim_id'] = Variable<String>(claimId);
    map['transcript_segment_id'] = Variable<String>(transcriptSegmentId);
    map['audio_start_ms'] = Variable<int>(audioStartMs);
    map['audio_end_ms'] = Variable<int>(audioEndMs);
    return map;
  }

  ClaimSourcesCompanion toCompanion(bool nullToAbsent) {
    return ClaimSourcesCompanion(
      id: Value(id),
      claimId: Value(claimId),
      transcriptSegmentId: Value(transcriptSegmentId),
      audioStartMs: Value(audioStartMs),
      audioEndMs: Value(audioEndMs),
    );
  }

  factory ClaimSource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClaimSource(
      id: serializer.fromJson<String>(json['id']),
      claimId: serializer.fromJson<String>(json['claimId']),
      transcriptSegmentId: serializer.fromJson<String>(
        json['transcriptSegmentId'],
      ),
      audioStartMs: serializer.fromJson<int>(json['audioStartMs']),
      audioEndMs: serializer.fromJson<int>(json['audioEndMs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'claimId': serializer.toJson<String>(claimId),
      'transcriptSegmentId': serializer.toJson<String>(transcriptSegmentId),
      'audioStartMs': serializer.toJson<int>(audioStartMs),
      'audioEndMs': serializer.toJson<int>(audioEndMs),
    };
  }

  ClaimSource copyWith({
    String? id,
    String? claimId,
    String? transcriptSegmentId,
    int? audioStartMs,
    int? audioEndMs,
  }) => ClaimSource(
    id: id ?? this.id,
    claimId: claimId ?? this.claimId,
    transcriptSegmentId: transcriptSegmentId ?? this.transcriptSegmentId,
    audioStartMs: audioStartMs ?? this.audioStartMs,
    audioEndMs: audioEndMs ?? this.audioEndMs,
  );
  ClaimSource copyWithCompanion(ClaimSourcesCompanion data) {
    return ClaimSource(
      id: data.id.present ? data.id.value : this.id,
      claimId: data.claimId.present ? data.claimId.value : this.claimId,
      transcriptSegmentId: data.transcriptSegmentId.present
          ? data.transcriptSegmentId.value
          : this.transcriptSegmentId,
      audioStartMs: data.audioStartMs.present
          ? data.audioStartMs.value
          : this.audioStartMs,
      audioEndMs: data.audioEndMs.present
          ? data.audioEndMs.value
          : this.audioEndMs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClaimSource(')
          ..write('id: $id, ')
          ..write('claimId: $claimId, ')
          ..write('transcriptSegmentId: $transcriptSegmentId, ')
          ..write('audioStartMs: $audioStartMs, ')
          ..write('audioEndMs: $audioEndMs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, claimId, transcriptSegmentId, audioStartMs, audioEndMs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClaimSource &&
          other.id == this.id &&
          other.claimId == this.claimId &&
          other.transcriptSegmentId == this.transcriptSegmentId &&
          other.audioStartMs == this.audioStartMs &&
          other.audioEndMs == this.audioEndMs);
}

class ClaimSourcesCompanion extends UpdateCompanion<ClaimSource> {
  final Value<String> id;
  final Value<String> claimId;
  final Value<String> transcriptSegmentId;
  final Value<int> audioStartMs;
  final Value<int> audioEndMs;
  final Value<int> rowid;
  const ClaimSourcesCompanion({
    this.id = const Value.absent(),
    this.claimId = const Value.absent(),
    this.transcriptSegmentId = const Value.absent(),
    this.audioStartMs = const Value.absent(),
    this.audioEndMs = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClaimSourcesCompanion.insert({
    required String id,
    required String claimId,
    required String transcriptSegmentId,
    required int audioStartMs,
    required int audioEndMs,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       claimId = Value(claimId),
       transcriptSegmentId = Value(transcriptSegmentId),
       audioStartMs = Value(audioStartMs),
       audioEndMs = Value(audioEndMs);
  static Insertable<ClaimSource> custom({
    Expression<String>? id,
    Expression<String>? claimId,
    Expression<String>? transcriptSegmentId,
    Expression<int>? audioStartMs,
    Expression<int>? audioEndMs,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (claimId != null) 'claim_id': claimId,
      if (transcriptSegmentId != null)
        'transcript_segment_id': transcriptSegmentId,
      if (audioStartMs != null) 'audio_start_ms': audioStartMs,
      if (audioEndMs != null) 'audio_end_ms': audioEndMs,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClaimSourcesCompanion copyWith({
    Value<String>? id,
    Value<String>? claimId,
    Value<String>? transcriptSegmentId,
    Value<int>? audioStartMs,
    Value<int>? audioEndMs,
    Value<int>? rowid,
  }) {
    return ClaimSourcesCompanion(
      id: id ?? this.id,
      claimId: claimId ?? this.claimId,
      transcriptSegmentId: transcriptSegmentId ?? this.transcriptSegmentId,
      audioStartMs: audioStartMs ?? this.audioStartMs,
      audioEndMs: audioEndMs ?? this.audioEndMs,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (claimId.present) {
      map['claim_id'] = Variable<String>(claimId.value);
    }
    if (transcriptSegmentId.present) {
      map['transcript_segment_id'] = Variable<String>(
        transcriptSegmentId.value,
      );
    }
    if (audioStartMs.present) {
      map['audio_start_ms'] = Variable<int>(audioStartMs.value);
    }
    if (audioEndMs.present) {
      map['audio_end_ms'] = Variable<int>(audioEndMs.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClaimSourcesCompanion(')
          ..write('id: $id, ')
          ..write('claimId: $claimId, ')
          ..write('transcriptSegmentId: $transcriptSegmentId, ')
          ..write('audioStartMs: $audioStartMs, ')
          ..write('audioEndMs: $audioEndMs, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CollectionsTable extends Collections
    with TableInfo<$CollectionsTable, Collection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Collection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Collection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Collection(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CollectionsTable createAlias(String alias) {
    return $CollectionsTable(attachedDatabase, alias);
  }
}

class Collection extends DataClass implements Insertable<Collection> {
  final String id;
  final String name;
  final String description;
  final DateTime createdAt;
  const Collection({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CollectionsCompanion toCompanion(bool nullToAbsent) {
    return CollectionsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory Collection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Collection(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Collection copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? createdAt,
  }) => Collection(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  Collection copyWithCompanion(CollectionsCompanion data) {
    return Collection(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Collection(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Collection &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class CollectionsCompanion extends UpdateCompanion<Collection> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CollectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Collection> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? description,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CollectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NoteCollectionsTable extends NoteCollections
    with TableInfo<$NoteCollectionsTable, NoteCollection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteCollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<String> noteId = GeneratedColumn<String>(
    'note_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES notes (id)',
    ),
  );
  static const VerificationMeta _collectionIdMeta = const VerificationMeta(
    'collectionId',
  );
  @override
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
    'collection_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES collections (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [noteId, collectionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_collections';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteCollection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('collection_id')) {
      context.handle(
        _collectionIdMeta,
        collectionId.isAcceptableOrUnknown(
          data['collection_id']!,
          _collectionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {noteId, collectionId};
  @override
  NoteCollection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteCollection(
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_id'],
      )!,
      collectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}collection_id'],
      )!,
    );
  }

  @override
  $NoteCollectionsTable createAlias(String alias) {
    return $NoteCollectionsTable(attachedDatabase, alias);
  }
}

class NoteCollection extends DataClass implements Insertable<NoteCollection> {
  final String noteId;
  final String collectionId;
  const NoteCollection({required this.noteId, required this.collectionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['note_id'] = Variable<String>(noteId);
    map['collection_id'] = Variable<String>(collectionId);
    return map;
  }

  NoteCollectionsCompanion toCompanion(bool nullToAbsent) {
    return NoteCollectionsCompanion(
      noteId: Value(noteId),
      collectionId: Value(collectionId),
    );
  }

  factory NoteCollection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteCollection(
      noteId: serializer.fromJson<String>(json['noteId']),
      collectionId: serializer.fromJson<String>(json['collectionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'noteId': serializer.toJson<String>(noteId),
      'collectionId': serializer.toJson<String>(collectionId),
    };
  }

  NoteCollection copyWith({String? noteId, String? collectionId}) =>
      NoteCollection(
        noteId: noteId ?? this.noteId,
        collectionId: collectionId ?? this.collectionId,
      );
  NoteCollection copyWithCompanion(NoteCollectionsCompanion data) {
    return NoteCollection(
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteCollection(')
          ..write('noteId: $noteId, ')
          ..write('collectionId: $collectionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(noteId, collectionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteCollection &&
          other.noteId == this.noteId &&
          other.collectionId == this.collectionId);
}

class NoteCollectionsCompanion extends UpdateCompanion<NoteCollection> {
  final Value<String> noteId;
  final Value<String> collectionId;
  final Value<int> rowid;
  const NoteCollectionsCompanion({
    this.noteId = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NoteCollectionsCompanion.insert({
    required String noteId,
    required String collectionId,
    this.rowid = const Value.absent(),
  }) : noteId = Value(noteId),
       collectionId = Value(collectionId);
  static Insertable<NoteCollection> custom({
    Expression<String>? noteId,
    Expression<String>? collectionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noteId != null) 'note_id': noteId,
      if (collectionId != null) 'collection_id': collectionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NoteCollectionsCompanion copyWith({
    Value<String>? noteId,
    Value<String>? collectionId,
    Value<int>? rowid,
  }) {
    return NoteCollectionsCompanion(
      noteId: noteId ?? this.noteId,
      collectionId: collectionId ?? this.collectionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noteId.present) {
      map['note_id'] = Variable<String>(noteId.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteCollectionsCompanion(')
          ..write('noteId: $noteId, ')
          ..write('collectionId: $collectionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final String id;
  final String name;
  final DateTime createdAt;
  const Tag({required this.id, required this.name, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory Tag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Tag copyWith({String? id, String? name, DateTime? createdAt}) => Tag(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
  );
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsCompanion.insert({
    required String id,
    required String name,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Tag> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NoteTagsTable extends NoteTags with TableInfo<$NoteTagsTable, NoteTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<String> noteId = GeneratedColumn<String>(
    'note_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES notes (id)',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [noteId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {noteId, tagId};
  @override
  NoteTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteTag(
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $NoteTagsTable createAlias(String alias) {
    return $NoteTagsTable(attachedDatabase, alias);
  }
}

class NoteTag extends DataClass implements Insertable<NoteTag> {
  final String noteId;
  final String tagId;
  const NoteTag({required this.noteId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['note_id'] = Variable<String>(noteId);
    map['tag_id'] = Variable<String>(tagId);
    return map;
  }

  NoteTagsCompanion toCompanion(bool nullToAbsent) {
    return NoteTagsCompanion(noteId: Value(noteId), tagId: Value(tagId));
  }

  factory NoteTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteTag(
      noteId: serializer.fromJson<String>(json['noteId']),
      tagId: serializer.fromJson<String>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'noteId': serializer.toJson<String>(noteId),
      'tagId': serializer.toJson<String>(tagId),
    };
  }

  NoteTag copyWith({String? noteId, String? tagId}) =>
      NoteTag(noteId: noteId ?? this.noteId, tagId: tagId ?? this.tagId);
  NoteTag copyWithCompanion(NoteTagsCompanion data) {
    return NoteTag(
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteTag(')
          ..write('noteId: $noteId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(noteId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteTag &&
          other.noteId == this.noteId &&
          other.tagId == this.tagId);
}

class NoteTagsCompanion extends UpdateCompanion<NoteTag> {
  final Value<String> noteId;
  final Value<String> tagId;
  final Value<int> rowid;
  const NoteTagsCompanion({
    this.noteId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NoteTagsCompanion.insert({
    required String noteId,
    required String tagId,
    this.rowid = const Value.absent(),
  }) : noteId = Value(noteId),
       tagId = Value(tagId);
  static Insertable<NoteTag> custom({
    Expression<String>? noteId,
    Expression<String>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noteId != null) 'note_id': noteId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NoteTagsCompanion copyWith({
    Value<String>? noteId,
    Value<String>? tagId,
    Value<int>? rowid,
  }) {
    return NoteTagsCompanion(
      noteId: noteId ?? this.noteId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noteId.present) {
      map['note_id'] = Variable<String>(noteId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteTagsCompanion(')
          ..write('noteId: $noteId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProcessingJobsTable extends ProcessingJobs
    with TableInfo<$ProcessingJobsTable, ProcessingJob> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProcessingJobsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<String> noteId = GeneratedColumn<String>(
    'note_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES notes (id)',
    ),
  );
  static const VerificationMeta _jobTypeMeta = const VerificationMeta(
    'jobType',
  );
  @override
  late final GeneratedColumn<String> jobType = GeneratedColumn<String>(
    'job_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    noteId,
    jobType,
    status,
    progress,
    errorMessage,
    createdAt,
    startedAt,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'processing_jobs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProcessingJob> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('job_type')) {
      context.handle(
        _jobTypeMeta,
        jobType.isAcceptableOrUnknown(data['job_type']!, _jobTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_jobTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProcessingJob map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProcessingJob(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_id'],
      )!,
      jobType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}job_type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $ProcessingJobsTable createAlias(String alias) {
    return $ProcessingJobsTable(attachedDatabase, alias);
  }
}

class ProcessingJob extends DataClass implements Insertable<ProcessingJob> {
  final String id;
  final String noteId;
  final String jobType;
  final String status;
  final double progress;
  final String? errorMessage;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  const ProcessingJob({
    required this.id,
    required this.noteId,
    required this.jobType,
    required this.status,
    required this.progress,
    this.errorMessage,
    required this.createdAt,
    this.startedAt,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['note_id'] = Variable<String>(noteId);
    map['job_type'] = Variable<String>(jobType);
    map['status'] = Variable<String>(status);
    map['progress'] = Variable<double>(progress);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  ProcessingJobsCompanion toCompanion(bool nullToAbsent) {
    return ProcessingJobsCompanion(
      id: Value(id),
      noteId: Value(noteId),
      jobType: Value(jobType),
      status: Value(status),
      progress: Value(progress),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      createdAt: Value(createdAt),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory ProcessingJob.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProcessingJob(
      id: serializer.fromJson<String>(json['id']),
      noteId: serializer.fromJson<String>(json['noteId']),
      jobType: serializer.fromJson<String>(json['jobType']),
      status: serializer.fromJson<String>(json['status']),
      progress: serializer.fromJson<double>(json['progress']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'noteId': serializer.toJson<String>(noteId),
      'jobType': serializer.toJson<String>(jobType),
      'status': serializer.toJson<String>(status),
      'progress': serializer.toJson<double>(progress),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  ProcessingJob copyWith({
    String? id,
    String? noteId,
    String? jobType,
    String? status,
    double? progress,
    Value<String?> errorMessage = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> startedAt = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
  }) => ProcessingJob(
    id: id ?? this.id,
    noteId: noteId ?? this.noteId,
    jobType: jobType ?? this.jobType,
    status: status ?? this.status,
    progress: progress ?? this.progress,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
    createdAt: createdAt ?? this.createdAt,
    startedAt: startedAt.present ? startedAt.value : this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  ProcessingJob copyWithCompanion(ProcessingJobsCompanion data) {
    return ProcessingJob(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      jobType: data.jobType.present ? data.jobType.value : this.jobType,
      status: data.status.present ? data.status.value : this.status,
      progress: data.progress.present ? data.progress.value : this.progress,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProcessingJob(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('jobType: $jobType, ')
          ..write('status: $status, ')
          ..write('progress: $progress, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('createdAt: $createdAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    noteId,
    jobType,
    status,
    progress,
    errorMessage,
    createdAt,
    startedAt,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProcessingJob &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.jobType == this.jobType &&
          other.status == this.status &&
          other.progress == this.progress &&
          other.errorMessage == this.errorMessage &&
          other.createdAt == this.createdAt &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt);
}

class ProcessingJobsCompanion extends UpdateCompanion<ProcessingJob> {
  final Value<String> id;
  final Value<String> noteId;
  final Value<String> jobType;
  final Value<String> status;
  final Value<double> progress;
  final Value<String?> errorMessage;
  final Value<DateTime> createdAt;
  final Value<DateTime?> startedAt;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const ProcessingJobsCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.jobType = const Value.absent(),
    this.status = const Value.absent(),
    this.progress = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProcessingJobsCompanion.insert({
    required String id,
    required String noteId,
    required String jobType,
    required String status,
    this.progress = const Value.absent(),
    this.errorMessage = const Value.absent(),
    required DateTime createdAt,
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       noteId = Value(noteId),
       jobType = Value(jobType),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<ProcessingJob> custom({
    Expression<String>? id,
    Expression<String>? noteId,
    Expression<String>? jobType,
    Expression<String>? status,
    Expression<double>? progress,
    Expression<String>? errorMessage,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteId != null) 'note_id': noteId,
      if (jobType != null) 'job_type': jobType,
      if (status != null) 'status': status,
      if (progress != null) 'progress': progress,
      if (errorMessage != null) 'error_message': errorMessage,
      if (createdAt != null) 'created_at': createdAt,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProcessingJobsCompanion copyWith({
    Value<String>? id,
    Value<String>? noteId,
    Value<String>? jobType,
    Value<String>? status,
    Value<double>? progress,
    Value<String?>? errorMessage,
    Value<DateTime>? createdAt,
    Value<DateTime?>? startedAt,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return ProcessingJobsCompanion(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      jobType: jobType ?? this.jobType,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      errorMessage: errorMessage ?? this.errorMessage,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<String>(noteId.value);
    }
    if (jobType.present) {
      map['job_type'] = Variable<String>(jobType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProcessingJobsCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('jobType: $jobType, ')
          ..write('status: $status, ')
          ..write('progress: $progress, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('createdAt: $createdAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ModelRunsTable extends ModelRuns
    with TableInfo<$ModelRunsTable, ModelRun> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModelRunsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<String> noteId = GeneratedColumn<String>(
    'note_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES notes (id)',
    ),
  );
  static const VerificationMeta _modelUsedMeta = const VerificationMeta(
    'modelUsed',
  );
  @override
  late final GeneratedColumn<String> modelUsed = GeneratedColumn<String>(
    'model_used',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelVersionMeta = const VerificationMeta(
    'modelVersion',
  );
  @override
  late final GeneratedColumn<String> modelVersion = GeneratedColumn<String>(
    'model_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _promptVersionMeta = const VerificationMeta(
    'promptVersion',
  );
  @override
  late final GeneratedColumn<String> promptVersion = GeneratedColumn<String>(
    'prompt_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _inputTranscriptHashMeta =
      const VerificationMeta('inputTranscriptHash');
  @override
  late final GeneratedColumn<String> inputTranscriptHash =
      GeneratedColumn<String>(
        'input_transcript_hash',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _processingDurationMsMeta =
      const VerificationMeta('processingDurationMs');
  @override
  late final GeneratedColumn<int> processingDurationMs = GeneratedColumn<int>(
    'processing_duration_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    noteId,
    modelUsed,
    modelVersion,
    promptVersion,
    inputTranscriptHash,
    processingDurationMs,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'model_runs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ModelRun> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('model_used')) {
      context.handle(
        _modelUsedMeta,
        modelUsed.isAcceptableOrUnknown(data['model_used']!, _modelUsedMeta),
      );
    } else if (isInserting) {
      context.missing(_modelUsedMeta);
    }
    if (data.containsKey('model_version')) {
      context.handle(
        _modelVersionMeta,
        modelVersion.isAcceptableOrUnknown(
          data['model_version']!,
          _modelVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_modelVersionMeta);
    }
    if (data.containsKey('prompt_version')) {
      context.handle(
        _promptVersionMeta,
        promptVersion.isAcceptableOrUnknown(
          data['prompt_version']!,
          _promptVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_promptVersionMeta);
    }
    if (data.containsKey('input_transcript_hash')) {
      context.handle(
        _inputTranscriptHashMeta,
        inputTranscriptHash.isAcceptableOrUnknown(
          data['input_transcript_hash']!,
          _inputTranscriptHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inputTranscriptHashMeta);
    }
    if (data.containsKey('processing_duration_ms')) {
      context.handle(
        _processingDurationMsMeta,
        processingDurationMs.isAcceptableOrUnknown(
          data['processing_duration_ms']!,
          _processingDurationMsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ModelRun map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModelRun(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_id'],
      )!,
      modelUsed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_used'],
      )!,
      modelVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_version'],
      )!,
      promptVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prompt_version'],
      )!,
      inputTranscriptHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}input_transcript_hash'],
      )!,
      processingDurationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}processing_duration_ms'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ModelRunsTable createAlias(String alias) {
    return $ModelRunsTable(attachedDatabase, alias);
  }
}

class ModelRun extends DataClass implements Insertable<ModelRun> {
  final String id;
  final String noteId;
  final String modelUsed;
  final String modelVersion;
  final String promptVersion;
  final String inputTranscriptHash;
  final int? processingDurationMs;
  final DateTime createdAt;
  const ModelRun({
    required this.id,
    required this.noteId,
    required this.modelUsed,
    required this.modelVersion,
    required this.promptVersion,
    required this.inputTranscriptHash,
    this.processingDurationMs,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['note_id'] = Variable<String>(noteId);
    map['model_used'] = Variable<String>(modelUsed);
    map['model_version'] = Variable<String>(modelVersion);
    map['prompt_version'] = Variable<String>(promptVersion);
    map['input_transcript_hash'] = Variable<String>(inputTranscriptHash);
    if (!nullToAbsent || processingDurationMs != null) {
      map['processing_duration_ms'] = Variable<int>(processingDurationMs);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ModelRunsCompanion toCompanion(bool nullToAbsent) {
    return ModelRunsCompanion(
      id: Value(id),
      noteId: Value(noteId),
      modelUsed: Value(modelUsed),
      modelVersion: Value(modelVersion),
      promptVersion: Value(promptVersion),
      inputTranscriptHash: Value(inputTranscriptHash),
      processingDurationMs: processingDurationMs == null && nullToAbsent
          ? const Value.absent()
          : Value(processingDurationMs),
      createdAt: Value(createdAt),
    );
  }

  factory ModelRun.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModelRun(
      id: serializer.fromJson<String>(json['id']),
      noteId: serializer.fromJson<String>(json['noteId']),
      modelUsed: serializer.fromJson<String>(json['modelUsed']),
      modelVersion: serializer.fromJson<String>(json['modelVersion']),
      promptVersion: serializer.fromJson<String>(json['promptVersion']),
      inputTranscriptHash: serializer.fromJson<String>(
        json['inputTranscriptHash'],
      ),
      processingDurationMs: serializer.fromJson<int?>(
        json['processingDurationMs'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'noteId': serializer.toJson<String>(noteId),
      'modelUsed': serializer.toJson<String>(modelUsed),
      'modelVersion': serializer.toJson<String>(modelVersion),
      'promptVersion': serializer.toJson<String>(promptVersion),
      'inputTranscriptHash': serializer.toJson<String>(inputTranscriptHash),
      'processingDurationMs': serializer.toJson<int?>(processingDurationMs),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ModelRun copyWith({
    String? id,
    String? noteId,
    String? modelUsed,
    String? modelVersion,
    String? promptVersion,
    String? inputTranscriptHash,
    Value<int?> processingDurationMs = const Value.absent(),
    DateTime? createdAt,
  }) => ModelRun(
    id: id ?? this.id,
    noteId: noteId ?? this.noteId,
    modelUsed: modelUsed ?? this.modelUsed,
    modelVersion: modelVersion ?? this.modelVersion,
    promptVersion: promptVersion ?? this.promptVersion,
    inputTranscriptHash: inputTranscriptHash ?? this.inputTranscriptHash,
    processingDurationMs: processingDurationMs.present
        ? processingDurationMs.value
        : this.processingDurationMs,
    createdAt: createdAt ?? this.createdAt,
  );
  ModelRun copyWithCompanion(ModelRunsCompanion data) {
    return ModelRun(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      modelUsed: data.modelUsed.present ? data.modelUsed.value : this.modelUsed,
      modelVersion: data.modelVersion.present
          ? data.modelVersion.value
          : this.modelVersion,
      promptVersion: data.promptVersion.present
          ? data.promptVersion.value
          : this.promptVersion,
      inputTranscriptHash: data.inputTranscriptHash.present
          ? data.inputTranscriptHash.value
          : this.inputTranscriptHash,
      processingDurationMs: data.processingDurationMs.present
          ? data.processingDurationMs.value
          : this.processingDurationMs,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModelRun(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('modelUsed: $modelUsed, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('promptVersion: $promptVersion, ')
          ..write('inputTranscriptHash: $inputTranscriptHash, ')
          ..write('processingDurationMs: $processingDurationMs, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    noteId,
    modelUsed,
    modelVersion,
    promptVersion,
    inputTranscriptHash,
    processingDurationMs,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModelRun &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.modelUsed == this.modelUsed &&
          other.modelVersion == this.modelVersion &&
          other.promptVersion == this.promptVersion &&
          other.inputTranscriptHash == this.inputTranscriptHash &&
          other.processingDurationMs == this.processingDurationMs &&
          other.createdAt == this.createdAt);
}

class ModelRunsCompanion extends UpdateCompanion<ModelRun> {
  final Value<String> id;
  final Value<String> noteId;
  final Value<String> modelUsed;
  final Value<String> modelVersion;
  final Value<String> promptVersion;
  final Value<String> inputTranscriptHash;
  final Value<int?> processingDurationMs;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ModelRunsCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.modelUsed = const Value.absent(),
    this.modelVersion = const Value.absent(),
    this.promptVersion = const Value.absent(),
    this.inputTranscriptHash = const Value.absent(),
    this.processingDurationMs = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ModelRunsCompanion.insert({
    required String id,
    required String noteId,
    required String modelUsed,
    required String modelVersion,
    required String promptVersion,
    required String inputTranscriptHash,
    this.processingDurationMs = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       noteId = Value(noteId),
       modelUsed = Value(modelUsed),
       modelVersion = Value(modelVersion),
       promptVersion = Value(promptVersion),
       inputTranscriptHash = Value(inputTranscriptHash),
       createdAt = Value(createdAt);
  static Insertable<ModelRun> custom({
    Expression<String>? id,
    Expression<String>? noteId,
    Expression<String>? modelUsed,
    Expression<String>? modelVersion,
    Expression<String>? promptVersion,
    Expression<String>? inputTranscriptHash,
    Expression<int>? processingDurationMs,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteId != null) 'note_id': noteId,
      if (modelUsed != null) 'model_used': modelUsed,
      if (modelVersion != null) 'model_version': modelVersion,
      if (promptVersion != null) 'prompt_version': promptVersion,
      if (inputTranscriptHash != null)
        'input_transcript_hash': inputTranscriptHash,
      if (processingDurationMs != null)
        'processing_duration_ms': processingDurationMs,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ModelRunsCompanion copyWith({
    Value<String>? id,
    Value<String>? noteId,
    Value<String>? modelUsed,
    Value<String>? modelVersion,
    Value<String>? promptVersion,
    Value<String>? inputTranscriptHash,
    Value<int?>? processingDurationMs,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ModelRunsCompanion(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      modelUsed: modelUsed ?? this.modelUsed,
      modelVersion: modelVersion ?? this.modelVersion,
      promptVersion: promptVersion ?? this.promptVersion,
      inputTranscriptHash: inputTranscriptHash ?? this.inputTranscriptHash,
      processingDurationMs: processingDurationMs ?? this.processingDurationMs,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<String>(noteId.value);
    }
    if (modelUsed.present) {
      map['model_used'] = Variable<String>(modelUsed.value);
    }
    if (modelVersion.present) {
      map['model_version'] = Variable<String>(modelVersion.value);
    }
    if (promptVersion.present) {
      map['prompt_version'] = Variable<String>(promptVersion.value);
    }
    if (inputTranscriptHash.present) {
      map['input_transcript_hash'] = Variable<String>(
        inputTranscriptHash.value,
      );
    }
    if (processingDurationMs.present) {
      map['processing_duration_ms'] = Variable<int>(processingDurationMs.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModelRunsCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('modelUsed: $modelUsed, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('promptVersion: $promptVersion, ')
          ..write('inputTranscriptHash: $inputTranscriptHash, ')
          ..write('processingDurationMs: $processingDurationMs, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserFeedbackTable extends UserFeedback
    with TableInfo<$UserFeedbackTable, UserFeedbackData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserFeedbackTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _claimIdMeta = const VerificationMeta(
    'claimId',
  );
  @override
  late final GeneratedColumn<String> claimId = GeneratedColumn<String>(
    'claim_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES insight_claims (id)',
    ),
  );
  static const VerificationMeta _feedbackTypeMeta = const VerificationMeta(
    'feedbackType',
  );
  @override
  late final GeneratedColumn<String> feedbackType = GeneratedColumn<String>(
    'feedback_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _feedbackDetailMeta = const VerificationMeta(
    'feedbackDetail',
  );
  @override
  late final GeneratedColumn<String> feedbackDetail = GeneratedColumn<String>(
    'feedback_detail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    claimId,
    feedbackType,
    feedbackDetail,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_feedback';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserFeedbackData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('claim_id')) {
      context.handle(
        _claimIdMeta,
        claimId.isAcceptableOrUnknown(data['claim_id']!, _claimIdMeta),
      );
    }
    if (data.containsKey('feedback_type')) {
      context.handle(
        _feedbackTypeMeta,
        feedbackType.isAcceptableOrUnknown(
          data['feedback_type']!,
          _feedbackTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_feedbackTypeMeta);
    }
    if (data.containsKey('feedback_detail')) {
      context.handle(
        _feedbackDetailMeta,
        feedbackDetail.isAcceptableOrUnknown(
          data['feedback_detail']!,
          _feedbackDetailMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserFeedbackData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserFeedbackData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      claimId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}claim_id'],
      ),
      feedbackType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}feedback_type'],
      )!,
      feedbackDetail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}feedback_detail'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UserFeedbackTable createAlias(String alias) {
    return $UserFeedbackTable(attachedDatabase, alias);
  }
}

class UserFeedbackData extends DataClass
    implements Insertable<UserFeedbackData> {
  final String id;
  final String? claimId;
  final String feedbackType;
  final String? feedbackDetail;
  final DateTime createdAt;
  const UserFeedbackData({
    required this.id,
    this.claimId,
    required this.feedbackType,
    this.feedbackDetail,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || claimId != null) {
      map['claim_id'] = Variable<String>(claimId);
    }
    map['feedback_type'] = Variable<String>(feedbackType);
    if (!nullToAbsent || feedbackDetail != null) {
      map['feedback_detail'] = Variable<String>(feedbackDetail);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UserFeedbackCompanion toCompanion(bool nullToAbsent) {
    return UserFeedbackCompanion(
      id: Value(id),
      claimId: claimId == null && nullToAbsent
          ? const Value.absent()
          : Value(claimId),
      feedbackType: Value(feedbackType),
      feedbackDetail: feedbackDetail == null && nullToAbsent
          ? const Value.absent()
          : Value(feedbackDetail),
      createdAt: Value(createdAt),
    );
  }

  factory UserFeedbackData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserFeedbackData(
      id: serializer.fromJson<String>(json['id']),
      claimId: serializer.fromJson<String?>(json['claimId']),
      feedbackType: serializer.fromJson<String>(json['feedbackType']),
      feedbackDetail: serializer.fromJson<String?>(json['feedbackDetail']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'claimId': serializer.toJson<String?>(claimId),
      'feedbackType': serializer.toJson<String>(feedbackType),
      'feedbackDetail': serializer.toJson<String?>(feedbackDetail),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserFeedbackData copyWith({
    String? id,
    Value<String?> claimId = const Value.absent(),
    String? feedbackType,
    Value<String?> feedbackDetail = const Value.absent(),
    DateTime? createdAt,
  }) => UserFeedbackData(
    id: id ?? this.id,
    claimId: claimId.present ? claimId.value : this.claimId,
    feedbackType: feedbackType ?? this.feedbackType,
    feedbackDetail: feedbackDetail.present
        ? feedbackDetail.value
        : this.feedbackDetail,
    createdAt: createdAt ?? this.createdAt,
  );
  UserFeedbackData copyWithCompanion(UserFeedbackCompanion data) {
    return UserFeedbackData(
      id: data.id.present ? data.id.value : this.id,
      claimId: data.claimId.present ? data.claimId.value : this.claimId,
      feedbackType: data.feedbackType.present
          ? data.feedbackType.value
          : this.feedbackType,
      feedbackDetail: data.feedbackDetail.present
          ? data.feedbackDetail.value
          : this.feedbackDetail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserFeedbackData(')
          ..write('id: $id, ')
          ..write('claimId: $claimId, ')
          ..write('feedbackType: $feedbackType, ')
          ..write('feedbackDetail: $feedbackDetail, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, claimId, feedbackType, feedbackDetail, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFeedbackData &&
          other.id == this.id &&
          other.claimId == this.claimId &&
          other.feedbackType == this.feedbackType &&
          other.feedbackDetail == this.feedbackDetail &&
          other.createdAt == this.createdAt);
}

class UserFeedbackCompanion extends UpdateCompanion<UserFeedbackData> {
  final Value<String> id;
  final Value<String?> claimId;
  final Value<String> feedbackType;
  final Value<String?> feedbackDetail;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UserFeedbackCompanion({
    this.id = const Value.absent(),
    this.claimId = const Value.absent(),
    this.feedbackType = const Value.absent(),
    this.feedbackDetail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserFeedbackCompanion.insert({
    required String id,
    this.claimId = const Value.absent(),
    required String feedbackType,
    this.feedbackDetail = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       feedbackType = Value(feedbackType),
       createdAt = Value(createdAt);
  static Insertable<UserFeedbackData> custom({
    Expression<String>? id,
    Expression<String>? claimId,
    Expression<String>? feedbackType,
    Expression<String>? feedbackDetail,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (claimId != null) 'claim_id': claimId,
      if (feedbackType != null) 'feedback_type': feedbackType,
      if (feedbackDetail != null) 'feedback_detail': feedbackDetail,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserFeedbackCompanion copyWith({
    Value<String>? id,
    Value<String?>? claimId,
    Value<String>? feedbackType,
    Value<String?>? feedbackDetail,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return UserFeedbackCompanion(
      id: id ?? this.id,
      claimId: claimId ?? this.claimId,
      feedbackType: feedbackType ?? this.feedbackType,
      feedbackDetail: feedbackDetail ?? this.feedbackDetail,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (claimId.present) {
      map['claim_id'] = Variable<String>(claimId.value);
    }
    if (feedbackType.present) {
      map['feedback_type'] = Variable<String>(feedbackType.value);
    }
    if (feedbackDetail.present) {
      map['feedback_detail'] = Variable<String>(feedbackDetail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFeedbackCompanion(')
          ..write('id: $id, ')
          ..write('claimId: $claimId, ')
          ..write('feedbackType: $feedbackType, ')
          ..write('feedbackDetail: $feedbackDetail, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AskHistoryTable extends AskHistory
    with TableInfo<$AskHistoryTable, AskHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AskHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
    'query',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resultTypeMeta = const VerificationMeta(
    'resultType',
  );
  @override
  late final GeneratedColumn<String> resultType = GeneratedColumn<String>(
    'result_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answerTextMeta = const VerificationMeta(
    'answerText',
  );
  @override
  late final GeneratedColumn<String> answerText = GeneratedColumn<String>(
    'answer_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _abstentionReasonMeta = const VerificationMeta(
    'abstentionReason',
  );
  @override
  late final GeneratedColumn<String> abstentionReason = GeneratedColumn<String>(
    'abstention_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceNoteIdsMeta = const VerificationMeta(
    'sourceNoteIds',
  );
  @override
  late final GeneratedColumn<String> sourceNoteIds = GeneratedColumn<String>(
    'source_note_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    query,
    resultType,
    answerText,
    confidence,
    abstentionReason,
    sourceNoteIds,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ask_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<AskHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('query')) {
      context.handle(
        _queryMeta,
        query.isAcceptableOrUnknown(data['query']!, _queryMeta),
      );
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('result_type')) {
      context.handle(
        _resultTypeMeta,
        resultType.isAcceptableOrUnknown(data['result_type']!, _resultTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_resultTypeMeta);
    }
    if (data.containsKey('answer_text')) {
      context.handle(
        _answerTextMeta,
        answerText.isAcceptableOrUnknown(data['answer_text']!, _answerTextMeta),
      );
    } else if (isInserting) {
      context.missing(_answerTextMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    if (data.containsKey('abstention_reason')) {
      context.handle(
        _abstentionReasonMeta,
        abstentionReason.isAcceptableOrUnknown(
          data['abstention_reason']!,
          _abstentionReasonMeta,
        ),
      );
    }
    if (data.containsKey('source_note_ids')) {
      context.handle(
        _sourceNoteIdsMeta,
        sourceNoteIds.isAcceptableOrUnknown(
          data['source_note_ids']!,
          _sourceNoteIdsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sourceNoteIdsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AskHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AskHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      query: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}query'],
      )!,
      resultType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_type'],
      )!,
      answerText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answer_text'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
      abstentionReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}abstention_reason'],
      ),
      sourceNoteIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_note_ids'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AskHistoryTable createAlias(String alias) {
    return $AskHistoryTable(attachedDatabase, alias);
  }
}

class AskHistoryData extends DataClass implements Insertable<AskHistoryData> {
  final String id;
  final String query;
  final String resultType;
  final String answerText;
  final double confidence;
  final String? abstentionReason;
  final String sourceNoteIds;
  final DateTime createdAt;
  const AskHistoryData({
    required this.id,
    required this.query,
    required this.resultType,
    required this.answerText,
    required this.confidence,
    this.abstentionReason,
    required this.sourceNoteIds,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['query'] = Variable<String>(query);
    map['result_type'] = Variable<String>(resultType);
    map['answer_text'] = Variable<String>(answerText);
    map['confidence'] = Variable<double>(confidence);
    if (!nullToAbsent || abstentionReason != null) {
      map['abstention_reason'] = Variable<String>(abstentionReason);
    }
    map['source_note_ids'] = Variable<String>(sourceNoteIds);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AskHistoryCompanion toCompanion(bool nullToAbsent) {
    return AskHistoryCompanion(
      id: Value(id),
      query: Value(query),
      resultType: Value(resultType),
      answerText: Value(answerText),
      confidence: Value(confidence),
      abstentionReason: abstentionReason == null && nullToAbsent
          ? const Value.absent()
          : Value(abstentionReason),
      sourceNoteIds: Value(sourceNoteIds),
      createdAt: Value(createdAt),
    );
  }

  factory AskHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AskHistoryData(
      id: serializer.fromJson<String>(json['id']),
      query: serializer.fromJson<String>(json['query']),
      resultType: serializer.fromJson<String>(json['resultType']),
      answerText: serializer.fromJson<String>(json['answerText']),
      confidence: serializer.fromJson<double>(json['confidence']),
      abstentionReason: serializer.fromJson<String?>(json['abstentionReason']),
      sourceNoteIds: serializer.fromJson<String>(json['sourceNoteIds']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'query': serializer.toJson<String>(query),
      'resultType': serializer.toJson<String>(resultType),
      'answerText': serializer.toJson<String>(answerText),
      'confidence': serializer.toJson<double>(confidence),
      'abstentionReason': serializer.toJson<String?>(abstentionReason),
      'sourceNoteIds': serializer.toJson<String>(sourceNoteIds),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AskHistoryData copyWith({
    String? id,
    String? query,
    String? resultType,
    String? answerText,
    double? confidence,
    Value<String?> abstentionReason = const Value.absent(),
    String? sourceNoteIds,
    DateTime? createdAt,
  }) => AskHistoryData(
    id: id ?? this.id,
    query: query ?? this.query,
    resultType: resultType ?? this.resultType,
    answerText: answerText ?? this.answerText,
    confidence: confidence ?? this.confidence,
    abstentionReason: abstentionReason.present
        ? abstentionReason.value
        : this.abstentionReason,
    sourceNoteIds: sourceNoteIds ?? this.sourceNoteIds,
    createdAt: createdAt ?? this.createdAt,
  );
  AskHistoryData copyWithCompanion(AskHistoryCompanion data) {
    return AskHistoryData(
      id: data.id.present ? data.id.value : this.id,
      query: data.query.present ? data.query.value : this.query,
      resultType: data.resultType.present
          ? data.resultType.value
          : this.resultType,
      answerText: data.answerText.present
          ? data.answerText.value
          : this.answerText,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      abstentionReason: data.abstentionReason.present
          ? data.abstentionReason.value
          : this.abstentionReason,
      sourceNoteIds: data.sourceNoteIds.present
          ? data.sourceNoteIds.value
          : this.sourceNoteIds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AskHistoryData(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('resultType: $resultType, ')
          ..write('answerText: $answerText, ')
          ..write('confidence: $confidence, ')
          ..write('abstentionReason: $abstentionReason, ')
          ..write('sourceNoteIds: $sourceNoteIds, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    query,
    resultType,
    answerText,
    confidence,
    abstentionReason,
    sourceNoteIds,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AskHistoryData &&
          other.id == this.id &&
          other.query == this.query &&
          other.resultType == this.resultType &&
          other.answerText == this.answerText &&
          other.confidence == this.confidence &&
          other.abstentionReason == this.abstentionReason &&
          other.sourceNoteIds == this.sourceNoteIds &&
          other.createdAt == this.createdAt);
}

class AskHistoryCompanion extends UpdateCompanion<AskHistoryData> {
  final Value<String> id;
  final Value<String> query;
  final Value<String> resultType;
  final Value<String> answerText;
  final Value<double> confidence;
  final Value<String?> abstentionReason;
  final Value<String> sourceNoteIds;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AskHistoryCompanion({
    this.id = const Value.absent(),
    this.query = const Value.absent(),
    this.resultType = const Value.absent(),
    this.answerText = const Value.absent(),
    this.confidence = const Value.absent(),
    this.abstentionReason = const Value.absent(),
    this.sourceNoteIds = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AskHistoryCompanion.insert({
    required String id,
    required String query,
    required String resultType,
    required String answerText,
    this.confidence = const Value.absent(),
    this.abstentionReason = const Value.absent(),
    required String sourceNoteIds,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       query = Value(query),
       resultType = Value(resultType),
       answerText = Value(answerText),
       sourceNoteIds = Value(sourceNoteIds),
       createdAt = Value(createdAt);
  static Insertable<AskHistoryData> custom({
    Expression<String>? id,
    Expression<String>? query,
    Expression<String>? resultType,
    Expression<String>? answerText,
    Expression<double>? confidence,
    Expression<String>? abstentionReason,
    Expression<String>? sourceNoteIds,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (query != null) 'query': query,
      if (resultType != null) 'result_type': resultType,
      if (answerText != null) 'answer_text': answerText,
      if (confidence != null) 'confidence': confidence,
      if (abstentionReason != null) 'abstention_reason': abstentionReason,
      if (sourceNoteIds != null) 'source_note_ids': sourceNoteIds,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AskHistoryCompanion copyWith({
    Value<String>? id,
    Value<String>? query,
    Value<String>? resultType,
    Value<String>? answerText,
    Value<double>? confidence,
    Value<String?>? abstentionReason,
    Value<String>? sourceNoteIds,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AskHistoryCompanion(
      id: id ?? this.id,
      query: query ?? this.query,
      resultType: resultType ?? this.resultType,
      answerText: answerText ?? this.answerText,
      confidence: confidence ?? this.confidence,
      abstentionReason: abstentionReason ?? this.abstentionReason,
      sourceNoteIds: sourceNoteIds ?? this.sourceNoteIds,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (resultType.present) {
      map['result_type'] = Variable<String>(resultType.value);
    }
    if (answerText.present) {
      map['answer_text'] = Variable<String>(answerText.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (abstentionReason.present) {
      map['abstention_reason'] = Variable<String>(abstentionReason.value);
    }
    if (sourceNoteIds.present) {
      map['source_note_ids'] = Variable<String>(sourceNoteIds.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AskHistoryCompanion(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('resultType: $resultType, ')
          ..write('answerText: $answerText, ')
          ..write('confidence: $confidence, ')
          ..write('abstentionReason: $abstentionReason, ')
          ..write('sourceNoteIds: $sourceNoteIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SchemaMigrationsTable extends SchemaMigrations
    with TableInfo<$SchemaMigrationsTable, SchemaMigration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchemaMigrationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _appliedAtMeta = const VerificationMeta(
    'appliedAt',
  );
  @override
  late final GeneratedColumn<DateTime> appliedAt = GeneratedColumn<DateTime>(
    'applied_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [version, description, appliedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schema_migrations';
  @override
  VerificationContext validateIntegrity(
    Insertable<SchemaMigration> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('applied_at')) {
      context.handle(
        _appliedAtMeta,
        appliedAt.isAcceptableOrUnknown(data['applied_at']!, _appliedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_appliedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {version};
  @override
  SchemaMigration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchemaMigration(
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      appliedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}applied_at'],
      )!,
    );
  }

  @override
  $SchemaMigrationsTable createAlias(String alias) {
    return $SchemaMigrationsTable(attachedDatabase, alias);
  }
}

class SchemaMigration extends DataClass implements Insertable<SchemaMigration> {
  final int version;
  final String description;
  final DateTime appliedAt;
  const SchemaMigration({
    required this.version,
    required this.description,
    required this.appliedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['version'] = Variable<int>(version);
    map['description'] = Variable<String>(description);
    map['applied_at'] = Variable<DateTime>(appliedAt);
    return map;
  }

  SchemaMigrationsCompanion toCompanion(bool nullToAbsent) {
    return SchemaMigrationsCompanion(
      version: Value(version),
      description: Value(description),
      appliedAt: Value(appliedAt),
    );
  }

  factory SchemaMigration.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchemaMigration(
      version: serializer.fromJson<int>(json['version']),
      description: serializer.fromJson<String>(json['description']),
      appliedAt: serializer.fromJson<DateTime>(json['appliedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'version': serializer.toJson<int>(version),
      'description': serializer.toJson<String>(description),
      'appliedAt': serializer.toJson<DateTime>(appliedAt),
    };
  }

  SchemaMigration copyWith({
    int? version,
    String? description,
    DateTime? appliedAt,
  }) => SchemaMigration(
    version: version ?? this.version,
    description: description ?? this.description,
    appliedAt: appliedAt ?? this.appliedAt,
  );
  SchemaMigration copyWithCompanion(SchemaMigrationsCompanion data) {
    return SchemaMigration(
      version: data.version.present ? data.version.value : this.version,
      description: data.description.present
          ? data.description.value
          : this.description,
      appliedAt: data.appliedAt.present ? data.appliedAt.value : this.appliedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchemaMigration(')
          ..write('version: $version, ')
          ..write('description: $description, ')
          ..write('appliedAt: $appliedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(version, description, appliedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchemaMigration &&
          other.version == this.version &&
          other.description == this.description &&
          other.appliedAt == this.appliedAt);
}

class SchemaMigrationsCompanion extends UpdateCompanion<SchemaMigration> {
  final Value<int> version;
  final Value<String> description;
  final Value<DateTime> appliedAt;
  const SchemaMigrationsCompanion({
    this.version = const Value.absent(),
    this.description = const Value.absent(),
    this.appliedAt = const Value.absent(),
  });
  SchemaMigrationsCompanion.insert({
    this.version = const Value.absent(),
    required String description,
    required DateTime appliedAt,
  }) : description = Value(description),
       appliedAt = Value(appliedAt);
  static Insertable<SchemaMigration> custom({
    Expression<int>? version,
    Expression<String>? description,
    Expression<DateTime>? appliedAt,
  }) {
    return RawValuesInsertable({
      if (version != null) 'version': version,
      if (description != null) 'description': description,
      if (appliedAt != null) 'applied_at': appliedAt,
    });
  }

  SchemaMigrationsCompanion copyWith({
    Value<int>? version,
    Value<String>? description,
    Value<DateTime>? appliedAt,
  }) {
    return SchemaMigrationsCompanion(
      version: version ?? this.version,
      description: description ?? this.description,
      appliedAt: appliedAt ?? this.appliedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (appliedAt.present) {
      map['applied_at'] = Variable<DateTime>(appliedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchemaMigrationsCompanion(')
          ..write('version: $version, ')
          ..write('description: $description, ')
          ..write('appliedAt: $appliedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$VoxCitaDatabase extends GeneratedDatabase {
  _$VoxCitaDatabase(QueryExecutor e) : super(e);
  $VoxCitaDatabaseManager get managers => $VoxCitaDatabaseManager(this);
  late final $AudioAssetsTable audioAssets = $AudioAssetsTable(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $RecordingSessionsTable recordingSessions =
      $RecordingSessionsTable(this);
  late final $TranscriptSegmentsTable transcriptSegments =
      $TranscriptSegmentsTable(this);
  late final $TranscriptRevisionsTable transcriptRevisions =
      $TranscriptRevisionsTable(this);
  late final $InsightClaimsTable insightClaims = $InsightClaimsTable(this);
  late final $ClaimSourcesTable claimSources = $ClaimSourcesTable(this);
  late final $CollectionsTable collections = $CollectionsTable(this);
  late final $NoteCollectionsTable noteCollections = $NoteCollectionsTable(
    this,
  );
  late final $TagsTable tags = $TagsTable(this);
  late final $NoteTagsTable noteTags = $NoteTagsTable(this);
  late final $ProcessingJobsTable processingJobs = $ProcessingJobsTable(this);
  late final $ModelRunsTable modelRuns = $ModelRunsTable(this);
  late final $UserFeedbackTable userFeedback = $UserFeedbackTable(this);
  late final $AskHistoryTable askHistory = $AskHistoryTable(this);
  late final $SchemaMigrationsTable schemaMigrations = $SchemaMigrationsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    audioAssets,
    notes,
    recordingSessions,
    transcriptSegments,
    transcriptRevisions,
    insightClaims,
    claimSources,
    collections,
    noteCollections,
    tags,
    noteTags,
    processingJobs,
    modelRuns,
    userFeedback,
    askHistory,
    schemaMigrations,
  ];
}

typedef $$AudioAssetsTableCreateCompanionBuilder =
    AudioAssetsCompanion Function({
      required String id,
      required String relativePath,
      Value<String> mimeType,
      required int durationMs,
      required int fileSizeBytes,
      required String sha256Hash,
      Value<String?> waveformJson,
      Value<bool> isOriginal,
      Value<String?> derivedFromId,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$AudioAssetsTableUpdateCompanionBuilder =
    AudioAssetsCompanion Function({
      Value<String> id,
      Value<String> relativePath,
      Value<String> mimeType,
      Value<int> durationMs,
      Value<int> fileSizeBytes,
      Value<String> sha256Hash,
      Value<String?> waveformJson,
      Value<bool> isOriginal,
      Value<String?> derivedFromId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$AudioAssetsTableReferences
    extends BaseReferences<_$VoxCitaDatabase, $AudioAssetsTable, AudioAsset> {
  $$AudioAssetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AudioAssetsTable _derivedFromIdTable(_$VoxCitaDatabase db) =>
      db.audioAssets.createAlias(
        $_aliasNameGenerator(db.audioAssets.derivedFromId, db.audioAssets.id),
      );

  $$AudioAssetsTableProcessedTableManager? get derivedFromId {
    final $_column = $_itemColumn<String>('derived_from_id');
    if ($_column == null) return null;
    final manager = $$AudioAssetsTableTableManager(
      $_db,
      $_db.audioAssets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_derivedFromIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$NotesTable, List<Note>> _notesRefsTable(
    _$VoxCitaDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.notes,
    aliasName: $_aliasNameGenerator(db.audioAssets.id, db.notes.audioAssetId),
  );

  $$NotesTableProcessedTableManager get notesRefs {
    final manager = $$NotesTableTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.audioAssetId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_notesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RecordingSessionsTable, List<RecordingSession>>
  _recordingSessionsRefsTable(_$VoxCitaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recordingSessions,
        aliasName: $_aliasNameGenerator(
          db.audioAssets.id,
          db.recordingSessions.audioAssetId,
        ),
      );

  $$RecordingSessionsTableProcessedTableManager get recordingSessionsRefs {
    final manager = $$RecordingSessionsTableTableManager(
      $_db,
      $_db.recordingSessions,
    ).filter((f) => f.audioAssetId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recordingSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TranscriptSegmentsTable, List<TranscriptSegment>>
  _transcriptSegmentsRefsTable(_$VoxCitaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transcriptSegments,
        aliasName: $_aliasNameGenerator(
          db.audioAssets.id,
          db.transcriptSegments.audioAssetId,
        ),
      );

  $$TranscriptSegmentsTableProcessedTableManager get transcriptSegmentsRefs {
    final manager = $$TranscriptSegmentsTableTableManager(
      $_db,
      $_db.transcriptSegments,
    ).filter((f) => f.audioAssetId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transcriptSegmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AudioAssetsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $AudioAssetsTable> {
  $$AudioAssetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sha256Hash => $composableBuilder(
    column: $table.sha256Hash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get waveformJson => $composableBuilder(
    column: $table.waveformJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOriginal => $composableBuilder(
    column: $table.isOriginal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AudioAssetsTableFilterComposer get derivedFromId {
    final $$AudioAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.derivedFromId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableFilterComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> notesRefs(
    Expression<bool> Function($$NotesTableFilterComposer f) f,
  ) {
    final $$NotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.audioAssetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recordingSessionsRefs(
    Expression<bool> Function($$RecordingSessionsTableFilterComposer f) f,
  ) {
    final $$RecordingSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recordingSessions,
      getReferencedColumn: (t) => t.audioAssetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecordingSessionsTableFilterComposer(
            $db: $db,
            $table: $db.recordingSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> transcriptSegmentsRefs(
    Expression<bool> Function($$TranscriptSegmentsTableFilterComposer f) f,
  ) {
    final $$TranscriptSegmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transcriptSegments,
      getReferencedColumn: (t) => t.audioAssetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranscriptSegmentsTableFilterComposer(
            $db: $db,
            $table: $db.transcriptSegments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AudioAssetsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $AudioAssetsTable> {
  $$AudioAssetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sha256Hash => $composableBuilder(
    column: $table.sha256Hash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get waveformJson => $composableBuilder(
    column: $table.waveformJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOriginal => $composableBuilder(
    column: $table.isOriginal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AudioAssetsTableOrderingComposer get derivedFromId {
    final $$AudioAssetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.derivedFromId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableOrderingComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AudioAssetsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $AudioAssetsTable> {
  $$AudioAssetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sha256Hash => $composableBuilder(
    column: $table.sha256Hash,
    builder: (column) => column,
  );

  GeneratedColumn<String> get waveformJson => $composableBuilder(
    column: $table.waveformJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isOriginal => $composableBuilder(
    column: $table.isOriginal,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AudioAssetsTableAnnotationComposer get derivedFromId {
    final $$AudioAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.derivedFromId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> notesRefs<T extends Object>(
    Expression<T> Function($$NotesTableAnnotationComposer a) f,
  ) {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.audioAssetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recordingSessionsRefs<T extends Object>(
    Expression<T> Function($$RecordingSessionsTableAnnotationComposer a) f,
  ) {
    final $$RecordingSessionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recordingSessions,
          getReferencedColumn: (t) => t.audioAssetId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecordingSessionsTableAnnotationComposer(
                $db: $db,
                $table: $db.recordingSessions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transcriptSegmentsRefs<T extends Object>(
    Expression<T> Function($$TranscriptSegmentsTableAnnotationComposer a) f,
  ) {
    final $$TranscriptSegmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transcriptSegments,
          getReferencedColumn: (t) => t.audioAssetId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TranscriptSegmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.transcriptSegments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AudioAssetsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $AudioAssetsTable,
          AudioAsset,
          $$AudioAssetsTableFilterComposer,
          $$AudioAssetsTableOrderingComposer,
          $$AudioAssetsTableAnnotationComposer,
          $$AudioAssetsTableCreateCompanionBuilder,
          $$AudioAssetsTableUpdateCompanionBuilder,
          (AudioAsset, $$AudioAssetsTableReferences),
          AudioAsset,
          PrefetchHooks Function({
            bool derivedFromId,
            bool notesRefs,
            bool recordingSessionsRefs,
            bool transcriptSegmentsRefs,
          })
        > {
  $$AudioAssetsTableTableManager(_$VoxCitaDatabase db, $AudioAssetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AudioAssetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AudioAssetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AudioAssetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> relativePath = const Value.absent(),
                Value<String> mimeType = const Value.absent(),
                Value<int> durationMs = const Value.absent(),
                Value<int> fileSizeBytes = const Value.absent(),
                Value<String> sha256Hash = const Value.absent(),
                Value<String?> waveformJson = const Value.absent(),
                Value<bool> isOriginal = const Value.absent(),
                Value<String?> derivedFromId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AudioAssetsCompanion(
                id: id,
                relativePath: relativePath,
                mimeType: mimeType,
                durationMs: durationMs,
                fileSizeBytes: fileSizeBytes,
                sha256Hash: sha256Hash,
                waveformJson: waveformJson,
                isOriginal: isOriginal,
                derivedFromId: derivedFromId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String relativePath,
                Value<String> mimeType = const Value.absent(),
                required int durationMs,
                required int fileSizeBytes,
                required String sha256Hash,
                Value<String?> waveformJson = const Value.absent(),
                Value<bool> isOriginal = const Value.absent(),
                Value<String?> derivedFromId = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AudioAssetsCompanion.insert(
                id: id,
                relativePath: relativePath,
                mimeType: mimeType,
                durationMs: durationMs,
                fileSizeBytes: fileSizeBytes,
                sha256Hash: sha256Hash,
                waveformJson: waveformJson,
                isOriginal: isOriginal,
                derivedFromId: derivedFromId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AudioAssetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                derivedFromId = false,
                notesRefs = false,
                recordingSessionsRefs = false,
                transcriptSegmentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (notesRefs) db.notes,
                    if (recordingSessionsRefs) db.recordingSessions,
                    if (transcriptSegmentsRefs) db.transcriptSegments,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (derivedFromId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.derivedFromId,
                                    referencedTable:
                                        $$AudioAssetsTableReferences
                                            ._derivedFromIdTable(db),
                                    referencedColumn:
                                        $$AudioAssetsTableReferences
                                            ._derivedFromIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (notesRefs)
                        await $_getPrefetchedData<
                          AudioAsset,
                          $AudioAssetsTable,
                          Note
                        >(
                          currentTable: table,
                          referencedTable: $$AudioAssetsTableReferences
                              ._notesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AudioAssetsTableReferences(
                                db,
                                table,
                                p0,
                              ).notesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.audioAssetId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recordingSessionsRefs)
                        await $_getPrefetchedData<
                          AudioAsset,
                          $AudioAssetsTable,
                          RecordingSession
                        >(
                          currentTable: table,
                          referencedTable: $$AudioAssetsTableReferences
                              ._recordingSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AudioAssetsTableReferences(
                                db,
                                table,
                                p0,
                              ).recordingSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.audioAssetId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (transcriptSegmentsRefs)
                        await $_getPrefetchedData<
                          AudioAsset,
                          $AudioAssetsTable,
                          TranscriptSegment
                        >(
                          currentTable: table,
                          referencedTable: $$AudioAssetsTableReferences
                              ._transcriptSegmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AudioAssetsTableReferences(
                                db,
                                table,
                                p0,
                              ).transcriptSegmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.audioAssetId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AudioAssetsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $AudioAssetsTable,
      AudioAsset,
      $$AudioAssetsTableFilterComposer,
      $$AudioAssetsTableOrderingComposer,
      $$AudioAssetsTableAnnotationComposer,
      $$AudioAssetsTableCreateCompanionBuilder,
      $$AudioAssetsTableUpdateCompanionBuilder,
      (AudioAsset, $$AudioAssetsTableReferences),
      AudioAsset,
      PrefetchHooks Function({
        bool derivedFromId,
        bool notesRefs,
        bool recordingSessionsRefs,
        bool transcriptSegmentsRefs,
      })
    >;
typedef $$NotesTableCreateCompanionBuilder =
    NotesCompanion Function({
      required String id,
      Value<String> title,
      Value<String> body,
      required String noteType,
      Value<String?> audioAssetId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isFavourite,
      Value<bool> isPinned,
      Value<int> rowid,
    });
typedef $$NotesTableUpdateCompanionBuilder =
    NotesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> body,
      Value<String> noteType,
      Value<String?> audioAssetId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isFavourite,
      Value<bool> isPinned,
      Value<int> rowid,
    });

final class $$NotesTableReferences
    extends BaseReferences<_$VoxCitaDatabase, $NotesTable, Note> {
  $$NotesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AudioAssetsTable _audioAssetIdTable(_$VoxCitaDatabase db) =>
      db.audioAssets.createAlias(
        $_aliasNameGenerator(db.notes.audioAssetId, db.audioAssets.id),
      );

  $$AudioAssetsTableProcessedTableManager? get audioAssetId {
    final $_column = $_itemColumn<String>('audio_asset_id');
    if ($_column == null) return null;
    final manager = $$AudioAssetsTableTableManager(
      $_db,
      $_db.audioAssets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_audioAssetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RecordingSessionsTable, List<RecordingSession>>
  _recordingSessionsRefsTable(_$VoxCitaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recordingSessions,
        aliasName: $_aliasNameGenerator(
          db.notes.id,
          db.recordingSessions.noteId,
        ),
      );

  $$RecordingSessionsTableProcessedTableManager get recordingSessionsRefs {
    final manager = $$RecordingSessionsTableTableManager(
      $_db,
      $_db.recordingSessions,
    ).filter((f) => f.noteId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recordingSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TranscriptSegmentsTable, List<TranscriptSegment>>
  _transcriptSegmentsRefsTable(_$VoxCitaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transcriptSegments,
        aliasName: $_aliasNameGenerator(
          db.notes.id,
          db.transcriptSegments.noteId,
        ),
      );

  $$TranscriptSegmentsTableProcessedTableManager get transcriptSegmentsRefs {
    final manager = $$TranscriptSegmentsTableTableManager(
      $_db,
      $_db.transcriptSegments,
    ).filter((f) => f.noteId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transcriptSegmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InsightClaimsTable, List<InsightClaim>>
  _insightClaimsRefsTable(_$VoxCitaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.insightClaims,
        aliasName: $_aliasNameGenerator(db.notes.id, db.insightClaims.noteId),
      );

  $$InsightClaimsTableProcessedTableManager get insightClaimsRefs {
    final manager = $$InsightClaimsTableTableManager(
      $_db,
      $_db.insightClaims,
    ).filter((f) => f.noteId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_insightClaimsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NoteCollectionsTable, List<NoteCollection>>
  _noteCollectionsRefsTable(_$VoxCitaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.noteCollections,
        aliasName: $_aliasNameGenerator(db.notes.id, db.noteCollections.noteId),
      );

  $$NoteCollectionsTableProcessedTableManager get noteCollectionsRefs {
    final manager = $$NoteCollectionsTableTableManager(
      $_db,
      $_db.noteCollections,
    ).filter((f) => f.noteId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _noteCollectionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NoteTagsTable, List<NoteTag>> _noteTagsRefsTable(
    _$VoxCitaDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.noteTags,
    aliasName: $_aliasNameGenerator(db.notes.id, db.noteTags.noteId),
  );

  $$NoteTagsTableProcessedTableManager get noteTagsRefs {
    final manager = $$NoteTagsTableTableManager(
      $_db,
      $_db.noteTags,
    ).filter((f) => f.noteId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_noteTagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProcessingJobsTable, List<ProcessingJob>>
  _processingJobsRefsTable(_$VoxCitaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.processingJobs,
        aliasName: $_aliasNameGenerator(db.notes.id, db.processingJobs.noteId),
      );

  $$ProcessingJobsTableProcessedTableManager get processingJobsRefs {
    final manager = $$ProcessingJobsTableTableManager(
      $_db,
      $_db.processingJobs,
    ).filter((f) => f.noteId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_processingJobsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ModelRunsTable, List<ModelRun>>
  _modelRunsRefsTable(_$VoxCitaDatabase db) => MultiTypedResultKey.fromTable(
    db.modelRuns,
    aliasName: $_aliasNameGenerator(db.notes.id, db.modelRuns.noteId),
  );

  $$ModelRunsTableProcessedTableManager get modelRunsRefs {
    final manager = $$ModelRunsTableTableManager(
      $_db,
      $_db.modelRuns,
    ).filter((f) => f.noteId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_modelRunsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$NotesTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noteType => $composableBuilder(
    column: $table.noteType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnFilters(column),
  );

  $$AudioAssetsTableFilterComposer get audioAssetId {
    final $$AudioAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audioAssetId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableFilterComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> recordingSessionsRefs(
    Expression<bool> Function($$RecordingSessionsTableFilterComposer f) f,
  ) {
    final $$RecordingSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recordingSessions,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecordingSessionsTableFilterComposer(
            $db: $db,
            $table: $db.recordingSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> transcriptSegmentsRefs(
    Expression<bool> Function($$TranscriptSegmentsTableFilterComposer f) f,
  ) {
    final $$TranscriptSegmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transcriptSegments,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranscriptSegmentsTableFilterComposer(
            $db: $db,
            $table: $db.transcriptSegments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> insightClaimsRefs(
    Expression<bool> Function($$InsightClaimsTableFilterComposer f) f,
  ) {
    final $$InsightClaimsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.insightClaims,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsightClaimsTableFilterComposer(
            $db: $db,
            $table: $db.insightClaims,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> noteCollectionsRefs(
    Expression<bool> Function($$NoteCollectionsTableFilterComposer f) f,
  ) {
    final $$NoteCollectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteCollections,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteCollectionsTableFilterComposer(
            $db: $db,
            $table: $db.noteCollections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> noteTagsRefs(
    Expression<bool> Function($$NoteTagsTableFilterComposer f) f,
  ) {
    final $$NoteTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteTags,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTagsTableFilterComposer(
            $db: $db,
            $table: $db.noteTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> processingJobsRefs(
    Expression<bool> Function($$ProcessingJobsTableFilterComposer f) f,
  ) {
    final $$ProcessingJobsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.processingJobs,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcessingJobsTableFilterComposer(
            $db: $db,
            $table: $db.processingJobs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> modelRunsRefs(
    Expression<bool> Function($$ModelRunsTableFilterComposer f) f,
  ) {
    final $$ModelRunsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.modelRuns,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModelRunsTableFilterComposer(
            $db: $db,
            $table: $db.modelRuns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NotesTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteType => $composableBuilder(
    column: $table.noteType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnOrderings(column),
  );

  $$AudioAssetsTableOrderingComposer get audioAssetId {
    final $$AudioAssetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audioAssetId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableOrderingComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotesTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get noteType =>
      $composableBuilder(column: $table.noteType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPinned =>
      $composableBuilder(column: $table.isPinned, builder: (column) => column);

  $$AudioAssetsTableAnnotationComposer get audioAssetId {
    final $$AudioAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audioAssetId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> recordingSessionsRefs<T extends Object>(
    Expression<T> Function($$RecordingSessionsTableAnnotationComposer a) f,
  ) {
    final $$RecordingSessionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recordingSessions,
          getReferencedColumn: (t) => t.noteId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecordingSessionsTableAnnotationComposer(
                $db: $db,
                $table: $db.recordingSessions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transcriptSegmentsRefs<T extends Object>(
    Expression<T> Function($$TranscriptSegmentsTableAnnotationComposer a) f,
  ) {
    final $$TranscriptSegmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transcriptSegments,
          getReferencedColumn: (t) => t.noteId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TranscriptSegmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.transcriptSegments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> insightClaimsRefs<T extends Object>(
    Expression<T> Function($$InsightClaimsTableAnnotationComposer a) f,
  ) {
    final $$InsightClaimsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.insightClaims,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsightClaimsTableAnnotationComposer(
            $db: $db,
            $table: $db.insightClaims,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> noteCollectionsRefs<T extends Object>(
    Expression<T> Function($$NoteCollectionsTableAnnotationComposer a) f,
  ) {
    final $$NoteCollectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteCollections,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteCollectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.noteCollections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> noteTagsRefs<T extends Object>(
    Expression<T> Function($$NoteTagsTableAnnotationComposer a) f,
  ) {
    final $$NoteTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteTags,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.noteTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> processingJobsRefs<T extends Object>(
    Expression<T> Function($$ProcessingJobsTableAnnotationComposer a) f,
  ) {
    final $$ProcessingJobsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.processingJobs,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcessingJobsTableAnnotationComposer(
            $db: $db,
            $table: $db.processingJobs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> modelRunsRefs<T extends Object>(
    Expression<T> Function($$ModelRunsTableAnnotationComposer a) f,
  ) {
    final $$ModelRunsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.modelRuns,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModelRunsTableAnnotationComposer(
            $db: $db,
            $table: $db.modelRuns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NotesTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $NotesTable,
          Note,
          $$NotesTableFilterComposer,
          $$NotesTableOrderingComposer,
          $$NotesTableAnnotationComposer,
          $$NotesTableCreateCompanionBuilder,
          $$NotesTableUpdateCompanionBuilder,
          (Note, $$NotesTableReferences),
          Note,
          PrefetchHooks Function({
            bool audioAssetId,
            bool recordingSessionsRefs,
            bool transcriptSegmentsRefs,
            bool insightClaimsRefs,
            bool noteCollectionsRefs,
            bool noteTagsRefs,
            bool processingJobsRefs,
            bool modelRunsRefs,
          })
        > {
  $$NotesTableTableManager(_$VoxCitaDatabase db, $NotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> noteType = const Value.absent(),
                Value<String?> audioAssetId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isFavourite = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion(
                id: id,
                title: title,
                body: body,
                noteType: noteType,
                audioAssetId: audioAssetId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isFavourite: isFavourite,
                isPinned: isPinned,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                required String noteType,
                Value<String?> audioAssetId = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isFavourite = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion.insert(
                id: id,
                title: title,
                body: body,
                noteType: noteType,
                audioAssetId: audioAssetId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isFavourite: isFavourite,
                isPinned: isPinned,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$NotesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                audioAssetId = false,
                recordingSessionsRefs = false,
                transcriptSegmentsRefs = false,
                insightClaimsRefs = false,
                noteCollectionsRefs = false,
                noteTagsRefs = false,
                processingJobsRefs = false,
                modelRunsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recordingSessionsRefs) db.recordingSessions,
                    if (transcriptSegmentsRefs) db.transcriptSegments,
                    if (insightClaimsRefs) db.insightClaims,
                    if (noteCollectionsRefs) db.noteCollections,
                    if (noteTagsRefs) db.noteTags,
                    if (processingJobsRefs) db.processingJobs,
                    if (modelRunsRefs) db.modelRuns,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (audioAssetId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.audioAssetId,
                                    referencedTable: $$NotesTableReferences
                                        ._audioAssetIdTable(db),
                                    referencedColumn: $$NotesTableReferences
                                        ._audioAssetIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recordingSessionsRefs)
                        await $_getPrefetchedData<
                          Note,
                          $NotesTable,
                          RecordingSession
                        >(
                          currentTable: table,
                          referencedTable: $$NotesTableReferences
                              ._recordingSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$NotesTableReferences(
                                db,
                                table,
                                p0,
                              ).recordingSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.noteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (transcriptSegmentsRefs)
                        await $_getPrefetchedData<
                          Note,
                          $NotesTable,
                          TranscriptSegment
                        >(
                          currentTable: table,
                          referencedTable: $$NotesTableReferences
                              ._transcriptSegmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$NotesTableReferences(
                                db,
                                table,
                                p0,
                              ).transcriptSegmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.noteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (insightClaimsRefs)
                        await $_getPrefetchedData<
                          Note,
                          $NotesTable,
                          InsightClaim
                        >(
                          currentTable: table,
                          referencedTable: $$NotesTableReferences
                              ._insightClaimsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$NotesTableReferences(
                                db,
                                table,
                                p0,
                              ).insightClaimsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.noteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (noteCollectionsRefs)
                        await $_getPrefetchedData<
                          Note,
                          $NotesTable,
                          NoteCollection
                        >(
                          currentTable: table,
                          referencedTable: $$NotesTableReferences
                              ._noteCollectionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$NotesTableReferences(
                                db,
                                table,
                                p0,
                              ).noteCollectionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.noteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (noteTagsRefs)
                        await $_getPrefetchedData<Note, $NotesTable, NoteTag>(
                          currentTable: table,
                          referencedTable: $$NotesTableReferences
                              ._noteTagsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$NotesTableReferences(
                                db,
                                table,
                                p0,
                              ).noteTagsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.noteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (processingJobsRefs)
                        await $_getPrefetchedData<
                          Note,
                          $NotesTable,
                          ProcessingJob
                        >(
                          currentTable: table,
                          referencedTable: $$NotesTableReferences
                              ._processingJobsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$NotesTableReferences(
                                db,
                                table,
                                p0,
                              ).processingJobsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.noteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (modelRunsRefs)
                        await $_getPrefetchedData<Note, $NotesTable, ModelRun>(
                          currentTable: table,
                          referencedTable: $$NotesTableReferences
                              ._modelRunsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$NotesTableReferences(
                                db,
                                table,
                                p0,
                              ).modelRunsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.noteId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$NotesTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $NotesTable,
      Note,
      $$NotesTableFilterComposer,
      $$NotesTableOrderingComposer,
      $$NotesTableAnnotationComposer,
      $$NotesTableCreateCompanionBuilder,
      $$NotesTableUpdateCompanionBuilder,
      (Note, $$NotesTableReferences),
      Note,
      PrefetchHooks Function({
        bool audioAssetId,
        bool recordingSessionsRefs,
        bool transcriptSegmentsRefs,
        bool insightClaimsRefs,
        bool noteCollectionsRefs,
        bool noteTagsRefs,
        bool processingJobsRefs,
        bool modelRunsRefs,
      })
    >;
typedef $$RecordingSessionsTableCreateCompanionBuilder =
    RecordingSessionsCompanion Function({
      required String id,
      Value<String?> noteId,
      Value<String?> audioAssetId,
      required String status,
      required DateTime startedAt,
      Value<DateTime?> endedAt,
      Value<int> checkpointMs,
      Value<String?> errorMessage,
      Value<int> rowid,
    });
typedef $$RecordingSessionsTableUpdateCompanionBuilder =
    RecordingSessionsCompanion Function({
      Value<String> id,
      Value<String?> noteId,
      Value<String?> audioAssetId,
      Value<String> status,
      Value<DateTime> startedAt,
      Value<DateTime?> endedAt,
      Value<int> checkpointMs,
      Value<String?> errorMessage,
      Value<int> rowid,
    });

final class $$RecordingSessionsTableReferences
    extends
        BaseReferences<
          _$VoxCitaDatabase,
          $RecordingSessionsTable,
          RecordingSession
        > {
  $$RecordingSessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $NotesTable _noteIdTable(_$VoxCitaDatabase db) => db.notes.createAlias(
    $_aliasNameGenerator(db.recordingSessions.noteId, db.notes.id),
  );

  $$NotesTableProcessedTableManager? get noteId {
    final $_column = $_itemColumn<String>('note_id');
    if ($_column == null) return null;
    final manager = $$NotesTableTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_noteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AudioAssetsTable _audioAssetIdTable(_$VoxCitaDatabase db) =>
      db.audioAssets.createAlias(
        $_aliasNameGenerator(
          db.recordingSessions.audioAssetId,
          db.audioAssets.id,
        ),
      );

  $$AudioAssetsTableProcessedTableManager? get audioAssetId {
    final $_column = $_itemColumn<String>('audio_asset_id');
    if ($_column == null) return null;
    final manager = $$AudioAssetsTableTableManager(
      $_db,
      $_db.audioAssets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_audioAssetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecordingSessionsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $RecordingSessionsTable> {
  $$RecordingSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get checkpointMs => $composableBuilder(
    column: $table.checkpointMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  $$NotesTableFilterComposer get noteId {
    final $$NotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AudioAssetsTableFilterComposer get audioAssetId {
    final $$AudioAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audioAssetId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableFilterComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecordingSessionsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $RecordingSessionsTable> {
  $$RecordingSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get checkpointMs => $composableBuilder(
    column: $table.checkpointMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  $$NotesTableOrderingComposer get noteId {
    final $$NotesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableOrderingComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AudioAssetsTableOrderingComposer get audioAssetId {
    final $$AudioAssetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audioAssetId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableOrderingComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecordingSessionsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $RecordingSessionsTable> {
  $$RecordingSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<int> get checkpointMs => $composableBuilder(
    column: $table.checkpointMs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  $$NotesTableAnnotationComposer get noteId {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AudioAssetsTableAnnotationComposer get audioAssetId {
    final $$AudioAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audioAssetId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecordingSessionsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $RecordingSessionsTable,
          RecordingSession,
          $$RecordingSessionsTableFilterComposer,
          $$RecordingSessionsTableOrderingComposer,
          $$RecordingSessionsTableAnnotationComposer,
          $$RecordingSessionsTableCreateCompanionBuilder,
          $$RecordingSessionsTableUpdateCompanionBuilder,
          (RecordingSession, $$RecordingSessionsTableReferences),
          RecordingSession,
          PrefetchHooks Function({bool noteId, bool audioAssetId})
        > {
  $$RecordingSessionsTableTableManager(
    _$VoxCitaDatabase db,
    $RecordingSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecordingSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecordingSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecordingSessionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> noteId = const Value.absent(),
                Value<String?> audioAssetId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> checkpointMs = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecordingSessionsCompanion(
                id: id,
                noteId: noteId,
                audioAssetId: audioAssetId,
                status: status,
                startedAt: startedAt,
                endedAt: endedAt,
                checkpointMs: checkpointMs,
                errorMessage: errorMessage,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> noteId = const Value.absent(),
                Value<String?> audioAssetId = const Value.absent(),
                required String status,
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> checkpointMs = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecordingSessionsCompanion.insert(
                id: id,
                noteId: noteId,
                audioAssetId: audioAssetId,
                status: status,
                startedAt: startedAt,
                endedAt: endedAt,
                checkpointMs: checkpointMs,
                errorMessage: errorMessage,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecordingSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({noteId = false, audioAssetId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (noteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.noteId,
                                referencedTable:
                                    $$RecordingSessionsTableReferences
                                        ._noteIdTable(db),
                                referencedColumn:
                                    $$RecordingSessionsTableReferences
                                        ._noteIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (audioAssetId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.audioAssetId,
                                referencedTable:
                                    $$RecordingSessionsTableReferences
                                        ._audioAssetIdTable(db),
                                referencedColumn:
                                    $$RecordingSessionsTableReferences
                                        ._audioAssetIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RecordingSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $RecordingSessionsTable,
      RecordingSession,
      $$RecordingSessionsTableFilterComposer,
      $$RecordingSessionsTableOrderingComposer,
      $$RecordingSessionsTableAnnotationComposer,
      $$RecordingSessionsTableCreateCompanionBuilder,
      $$RecordingSessionsTableUpdateCompanionBuilder,
      (RecordingSession, $$RecordingSessionsTableReferences),
      RecordingSession,
      PrefetchHooks Function({bool noteId, bool audioAssetId})
    >;
typedef $$TranscriptSegmentsTableCreateCompanionBuilder =
    TranscriptSegmentsCompanion Function({
      required String id,
      required String noteId,
      required String audioAssetId,
      required int startMs,
      required int endMs,
      required String originalText,
      required String currentText,
      Value<double?> confidence,
      Value<String?> detectedLanguage,
      Value<String?> speakerLabel,
      required String engineName,
      required String modelVersion,
      Value<String?> processingSettings,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$TranscriptSegmentsTableUpdateCompanionBuilder =
    TranscriptSegmentsCompanion Function({
      Value<String> id,
      Value<String> noteId,
      Value<String> audioAssetId,
      Value<int> startMs,
      Value<int> endMs,
      Value<String> originalText,
      Value<String> currentText,
      Value<double?> confidence,
      Value<String?> detectedLanguage,
      Value<String?> speakerLabel,
      Value<String> engineName,
      Value<String> modelVersion,
      Value<String?> processingSettings,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$TranscriptSegmentsTableReferences
    extends
        BaseReferences<
          _$VoxCitaDatabase,
          $TranscriptSegmentsTable,
          TranscriptSegment
        > {
  $$TranscriptSegmentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $NotesTable _noteIdTable(_$VoxCitaDatabase db) => db.notes.createAlias(
    $_aliasNameGenerator(db.transcriptSegments.noteId, db.notes.id),
  );

  $$NotesTableProcessedTableManager get noteId {
    final $_column = $_itemColumn<String>('note_id')!;

    final manager = $$NotesTableTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_noteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AudioAssetsTable _audioAssetIdTable(_$VoxCitaDatabase db) =>
      db.audioAssets.createAlias(
        $_aliasNameGenerator(
          db.transcriptSegments.audioAssetId,
          db.audioAssets.id,
        ),
      );

  $$AudioAssetsTableProcessedTableManager get audioAssetId {
    final $_column = $_itemColumn<String>('audio_asset_id')!;

    final manager = $$AudioAssetsTableTableManager(
      $_db,
      $_db.audioAssets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_audioAssetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $TranscriptRevisionsTable,
    List<TranscriptRevision>
  >
  _transcriptRevisionsRefsTable(_$VoxCitaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transcriptRevisions,
        aliasName: $_aliasNameGenerator(
          db.transcriptSegments.id,
          db.transcriptRevisions.segmentId,
        ),
      );

  $$TranscriptRevisionsTableProcessedTableManager get transcriptRevisionsRefs {
    final manager = $$TranscriptRevisionsTableTableManager(
      $_db,
      $_db.transcriptRevisions,
    ).filter((f) => f.segmentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transcriptRevisionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ClaimSourcesTable, List<ClaimSource>>
  _claimSourcesRefsTable(_$VoxCitaDatabase db) => MultiTypedResultKey.fromTable(
    db.claimSources,
    aliasName: $_aliasNameGenerator(
      db.transcriptSegments.id,
      db.claimSources.transcriptSegmentId,
    ),
  );

  $$ClaimSourcesTableProcessedTableManager get claimSourcesRefs {
    final manager = $$ClaimSourcesTableTableManager($_db, $_db.claimSources)
        .filter(
          (f) =>
              f.transcriptSegmentId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_claimSourcesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TranscriptSegmentsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $TranscriptSegmentsTable> {
  $$TranscriptSegmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMs => $composableBuilder(
    column: $table.startMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMs => $composableBuilder(
    column: $table.endMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalText => $composableBuilder(
    column: $table.originalText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentText => $composableBuilder(
    column: $table.currentText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detectedLanguage => $composableBuilder(
    column: $table.detectedLanguage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get speakerLabel => $composableBuilder(
    column: $table.speakerLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get engineName => $composableBuilder(
    column: $table.engineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get processingSettings => $composableBuilder(
    column: $table.processingSettings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$NotesTableFilterComposer get noteId {
    final $$NotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AudioAssetsTableFilterComposer get audioAssetId {
    final $$AudioAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audioAssetId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableFilterComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transcriptRevisionsRefs(
    Expression<bool> Function($$TranscriptRevisionsTableFilterComposer f) f,
  ) {
    final $$TranscriptRevisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transcriptRevisions,
      getReferencedColumn: (t) => t.segmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranscriptRevisionsTableFilterComposer(
            $db: $db,
            $table: $db.transcriptRevisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> claimSourcesRefs(
    Expression<bool> Function($$ClaimSourcesTableFilterComposer f) f,
  ) {
    final $$ClaimSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.claimSources,
      getReferencedColumn: (t) => t.transcriptSegmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClaimSourcesTableFilterComposer(
            $db: $db,
            $table: $db.claimSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TranscriptSegmentsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $TranscriptSegmentsTable> {
  $$TranscriptSegmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMs => $composableBuilder(
    column: $table.startMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMs => $composableBuilder(
    column: $table.endMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalText => $composableBuilder(
    column: $table.originalText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentText => $composableBuilder(
    column: $table.currentText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detectedLanguage => $composableBuilder(
    column: $table.detectedLanguage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get speakerLabel => $composableBuilder(
    column: $table.speakerLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get engineName => $composableBuilder(
    column: $table.engineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get processingSettings => $composableBuilder(
    column: $table.processingSettings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$NotesTableOrderingComposer get noteId {
    final $$NotesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableOrderingComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AudioAssetsTableOrderingComposer get audioAssetId {
    final $$AudioAssetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audioAssetId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableOrderingComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TranscriptSegmentsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $TranscriptSegmentsTable> {
  $$TranscriptSegmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get startMs =>
      $composableBuilder(column: $table.startMs, builder: (column) => column);

  GeneratedColumn<int> get endMs =>
      $composableBuilder(column: $table.endMs, builder: (column) => column);

  GeneratedColumn<String> get originalText => $composableBuilder(
    column: $table.originalText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currentText => $composableBuilder(
    column: $table.currentText,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get detectedLanguage => $composableBuilder(
    column: $table.detectedLanguage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get speakerLabel => $composableBuilder(
    column: $table.speakerLabel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get engineName => $composableBuilder(
    column: $table.engineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get processingSettings => $composableBuilder(
    column: $table.processingSettings,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$NotesTableAnnotationComposer get noteId {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AudioAssetsTableAnnotationComposer get audioAssetId {
    final $$AudioAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audioAssetId,
      referencedTable: $db.audioAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudioAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.audioAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transcriptRevisionsRefs<T extends Object>(
    Expression<T> Function($$TranscriptRevisionsTableAnnotationComposer a) f,
  ) {
    final $$TranscriptRevisionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transcriptRevisions,
          getReferencedColumn: (t) => t.segmentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TranscriptRevisionsTableAnnotationComposer(
                $db: $db,
                $table: $db.transcriptRevisions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> claimSourcesRefs<T extends Object>(
    Expression<T> Function($$ClaimSourcesTableAnnotationComposer a) f,
  ) {
    final $$ClaimSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.claimSources,
      getReferencedColumn: (t) => t.transcriptSegmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClaimSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.claimSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TranscriptSegmentsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $TranscriptSegmentsTable,
          TranscriptSegment,
          $$TranscriptSegmentsTableFilterComposer,
          $$TranscriptSegmentsTableOrderingComposer,
          $$TranscriptSegmentsTableAnnotationComposer,
          $$TranscriptSegmentsTableCreateCompanionBuilder,
          $$TranscriptSegmentsTableUpdateCompanionBuilder,
          (TranscriptSegment, $$TranscriptSegmentsTableReferences),
          TranscriptSegment,
          PrefetchHooks Function({
            bool noteId,
            bool audioAssetId,
            bool transcriptRevisionsRefs,
            bool claimSourcesRefs,
          })
        > {
  $$TranscriptSegmentsTableTableManager(
    _$VoxCitaDatabase db,
    $TranscriptSegmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TranscriptSegmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TranscriptSegmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TranscriptSegmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> noteId = const Value.absent(),
                Value<String> audioAssetId = const Value.absent(),
                Value<int> startMs = const Value.absent(),
                Value<int> endMs = const Value.absent(),
                Value<String> originalText = const Value.absent(),
                Value<String> currentText = const Value.absent(),
                Value<double?> confidence = const Value.absent(),
                Value<String?> detectedLanguage = const Value.absent(),
                Value<String?> speakerLabel = const Value.absent(),
                Value<String> engineName = const Value.absent(),
                Value<String> modelVersion = const Value.absent(),
                Value<String?> processingSettings = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TranscriptSegmentsCompanion(
                id: id,
                noteId: noteId,
                audioAssetId: audioAssetId,
                startMs: startMs,
                endMs: endMs,
                originalText: originalText,
                currentText: currentText,
                confidence: confidence,
                detectedLanguage: detectedLanguage,
                speakerLabel: speakerLabel,
                engineName: engineName,
                modelVersion: modelVersion,
                processingSettings: processingSettings,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String noteId,
                required String audioAssetId,
                required int startMs,
                required int endMs,
                required String originalText,
                required String currentText,
                Value<double?> confidence = const Value.absent(),
                Value<String?> detectedLanguage = const Value.absent(),
                Value<String?> speakerLabel = const Value.absent(),
                required String engineName,
                required String modelVersion,
                Value<String?> processingSettings = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => TranscriptSegmentsCompanion.insert(
                id: id,
                noteId: noteId,
                audioAssetId: audioAssetId,
                startMs: startMs,
                endMs: endMs,
                originalText: originalText,
                currentText: currentText,
                confidence: confidence,
                detectedLanguage: detectedLanguage,
                speakerLabel: speakerLabel,
                engineName: engineName,
                modelVersion: modelVersion,
                processingSettings: processingSettings,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TranscriptSegmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                noteId = false,
                audioAssetId = false,
                transcriptRevisionsRefs = false,
                claimSourcesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transcriptRevisionsRefs) db.transcriptRevisions,
                    if (claimSourcesRefs) db.claimSources,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (noteId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.noteId,
                                    referencedTable:
                                        $$TranscriptSegmentsTableReferences
                                            ._noteIdTable(db),
                                    referencedColumn:
                                        $$TranscriptSegmentsTableReferences
                                            ._noteIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (audioAssetId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.audioAssetId,
                                    referencedTable:
                                        $$TranscriptSegmentsTableReferences
                                            ._audioAssetIdTable(db),
                                    referencedColumn:
                                        $$TranscriptSegmentsTableReferences
                                            ._audioAssetIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transcriptRevisionsRefs)
                        await $_getPrefetchedData<
                          TranscriptSegment,
                          $TranscriptSegmentsTable,
                          TranscriptRevision
                        >(
                          currentTable: table,
                          referencedTable: $$TranscriptSegmentsTableReferences
                              ._transcriptRevisionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TranscriptSegmentsTableReferences(
                                db,
                                table,
                                p0,
                              ).transcriptRevisionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.segmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (claimSourcesRefs)
                        await $_getPrefetchedData<
                          TranscriptSegment,
                          $TranscriptSegmentsTable,
                          ClaimSource
                        >(
                          currentTable: table,
                          referencedTable: $$TranscriptSegmentsTableReferences
                              ._claimSourcesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TranscriptSegmentsTableReferences(
                                db,
                                table,
                                p0,
                              ).claimSourcesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transcriptSegmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TranscriptSegmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $TranscriptSegmentsTable,
      TranscriptSegment,
      $$TranscriptSegmentsTableFilterComposer,
      $$TranscriptSegmentsTableOrderingComposer,
      $$TranscriptSegmentsTableAnnotationComposer,
      $$TranscriptSegmentsTableCreateCompanionBuilder,
      $$TranscriptSegmentsTableUpdateCompanionBuilder,
      (TranscriptSegment, $$TranscriptSegmentsTableReferences),
      TranscriptSegment,
      PrefetchHooks Function({
        bool noteId,
        bool audioAssetId,
        bool transcriptRevisionsRefs,
        bool claimSourcesRefs,
      })
    >;
typedef $$TranscriptRevisionsTableCreateCompanionBuilder =
    TranscriptRevisionsCompanion Function({
      required String id,
      required String segmentId,
      required String previousText,
      required String correctedText,
      Value<String> revisedBy,
      required DateTime revisedAt,
      Value<int> rowid,
    });
typedef $$TranscriptRevisionsTableUpdateCompanionBuilder =
    TranscriptRevisionsCompanion Function({
      Value<String> id,
      Value<String> segmentId,
      Value<String> previousText,
      Value<String> correctedText,
      Value<String> revisedBy,
      Value<DateTime> revisedAt,
      Value<int> rowid,
    });

final class $$TranscriptRevisionsTableReferences
    extends
        BaseReferences<
          _$VoxCitaDatabase,
          $TranscriptRevisionsTable,
          TranscriptRevision
        > {
  $$TranscriptRevisionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TranscriptSegmentsTable _segmentIdTable(_$VoxCitaDatabase db) =>
      db.transcriptSegments.createAlias(
        $_aliasNameGenerator(
          db.transcriptRevisions.segmentId,
          db.transcriptSegments.id,
        ),
      );

  $$TranscriptSegmentsTableProcessedTableManager get segmentId {
    final $_column = $_itemColumn<String>('segment_id')!;

    final manager = $$TranscriptSegmentsTableTableManager(
      $_db,
      $_db.transcriptSegments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_segmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TranscriptRevisionsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $TranscriptRevisionsTable> {
  $$TranscriptRevisionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get previousText => $composableBuilder(
    column: $table.previousText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get correctedText => $composableBuilder(
    column: $table.correctedText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get revisedBy => $composableBuilder(
    column: $table.revisedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get revisedAt => $composableBuilder(
    column: $table.revisedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TranscriptSegmentsTableFilterComposer get segmentId {
    final $$TranscriptSegmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.segmentId,
      referencedTable: $db.transcriptSegments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranscriptSegmentsTableFilterComposer(
            $db: $db,
            $table: $db.transcriptSegments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TranscriptRevisionsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $TranscriptRevisionsTable> {
  $$TranscriptRevisionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get previousText => $composableBuilder(
    column: $table.previousText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get correctedText => $composableBuilder(
    column: $table.correctedText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get revisedBy => $composableBuilder(
    column: $table.revisedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get revisedAt => $composableBuilder(
    column: $table.revisedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TranscriptSegmentsTableOrderingComposer get segmentId {
    final $$TranscriptSegmentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.segmentId,
      referencedTable: $db.transcriptSegments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranscriptSegmentsTableOrderingComposer(
            $db: $db,
            $table: $db.transcriptSegments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TranscriptRevisionsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $TranscriptRevisionsTable> {
  $$TranscriptRevisionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get previousText => $composableBuilder(
    column: $table.previousText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get correctedText => $composableBuilder(
    column: $table.correctedText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get revisedBy =>
      $composableBuilder(column: $table.revisedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get revisedAt =>
      $composableBuilder(column: $table.revisedAt, builder: (column) => column);

  $$TranscriptSegmentsTableAnnotationComposer get segmentId {
    final $$TranscriptSegmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.segmentId,
          referencedTable: $db.transcriptSegments,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TranscriptSegmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.transcriptSegments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TranscriptRevisionsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $TranscriptRevisionsTable,
          TranscriptRevision,
          $$TranscriptRevisionsTableFilterComposer,
          $$TranscriptRevisionsTableOrderingComposer,
          $$TranscriptRevisionsTableAnnotationComposer,
          $$TranscriptRevisionsTableCreateCompanionBuilder,
          $$TranscriptRevisionsTableUpdateCompanionBuilder,
          (TranscriptRevision, $$TranscriptRevisionsTableReferences),
          TranscriptRevision,
          PrefetchHooks Function({bool segmentId})
        > {
  $$TranscriptRevisionsTableTableManager(
    _$VoxCitaDatabase db,
    $TranscriptRevisionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TranscriptRevisionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TranscriptRevisionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TranscriptRevisionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> segmentId = const Value.absent(),
                Value<String> previousText = const Value.absent(),
                Value<String> correctedText = const Value.absent(),
                Value<String> revisedBy = const Value.absent(),
                Value<DateTime> revisedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TranscriptRevisionsCompanion(
                id: id,
                segmentId: segmentId,
                previousText: previousText,
                correctedText: correctedText,
                revisedBy: revisedBy,
                revisedAt: revisedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String segmentId,
                required String previousText,
                required String correctedText,
                Value<String> revisedBy = const Value.absent(),
                required DateTime revisedAt,
                Value<int> rowid = const Value.absent(),
              }) => TranscriptRevisionsCompanion.insert(
                id: id,
                segmentId: segmentId,
                previousText: previousText,
                correctedText: correctedText,
                revisedBy: revisedBy,
                revisedAt: revisedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TranscriptRevisionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({segmentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (segmentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.segmentId,
                                referencedTable:
                                    $$TranscriptRevisionsTableReferences
                                        ._segmentIdTable(db),
                                referencedColumn:
                                    $$TranscriptRevisionsTableReferences
                                        ._segmentIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TranscriptRevisionsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $TranscriptRevisionsTable,
      TranscriptRevision,
      $$TranscriptRevisionsTableFilterComposer,
      $$TranscriptRevisionsTableOrderingComposer,
      $$TranscriptRevisionsTableAnnotationComposer,
      $$TranscriptRevisionsTableCreateCompanionBuilder,
      $$TranscriptRevisionsTableUpdateCompanionBuilder,
      (TranscriptRevision, $$TranscriptRevisionsTableReferences),
      TranscriptRevision,
      PrefetchHooks Function({bool segmentId})
    >;
typedef $$InsightClaimsTableCreateCompanionBuilder =
    InsightClaimsCompanion Function({
      required String id,
      required String noteId,
      required String claimText,
      required String claimType,
      required String modelUsed,
      required String modelVersion,
      required String promptVersion,
      Value<double?> supportScore,
      Value<String> verificationState,
      required String inputTranscriptHash,
      Value<int?> processingDurationMs,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$InsightClaimsTableUpdateCompanionBuilder =
    InsightClaimsCompanion Function({
      Value<String> id,
      Value<String> noteId,
      Value<String> claimText,
      Value<String> claimType,
      Value<String> modelUsed,
      Value<String> modelVersion,
      Value<String> promptVersion,
      Value<double?> supportScore,
      Value<String> verificationState,
      Value<String> inputTranscriptHash,
      Value<int?> processingDurationMs,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$InsightClaimsTableReferences
    extends
        BaseReferences<_$VoxCitaDatabase, $InsightClaimsTable, InsightClaim> {
  $$InsightClaimsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $NotesTable _noteIdTable(_$VoxCitaDatabase db) => db.notes.createAlias(
    $_aliasNameGenerator(db.insightClaims.noteId, db.notes.id),
  );

  $$NotesTableProcessedTableManager get noteId {
    final $_column = $_itemColumn<String>('note_id')!;

    final manager = $$NotesTableTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_noteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ClaimSourcesTable, List<ClaimSource>>
  _claimSourcesRefsTable(_$VoxCitaDatabase db) => MultiTypedResultKey.fromTable(
    db.claimSources,
    aliasName: $_aliasNameGenerator(
      db.insightClaims.id,
      db.claimSources.claimId,
    ),
  );

  $$ClaimSourcesTableProcessedTableManager get claimSourcesRefs {
    final manager = $$ClaimSourcesTableTableManager(
      $_db,
      $_db.claimSources,
    ).filter((f) => f.claimId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_claimSourcesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserFeedbackTable, List<UserFeedbackData>>
  _userFeedbackRefsTable(_$VoxCitaDatabase db) => MultiTypedResultKey.fromTable(
    db.userFeedback,
    aliasName: $_aliasNameGenerator(
      db.insightClaims.id,
      db.userFeedback.claimId,
    ),
  );

  $$UserFeedbackTableProcessedTableManager get userFeedbackRefs {
    final manager = $$UserFeedbackTableTableManager(
      $_db,
      $_db.userFeedback,
    ).filter((f) => f.claimId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_userFeedbackRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InsightClaimsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $InsightClaimsTable> {
  $$InsightClaimsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get claimText => $composableBuilder(
    column: $table.claimText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get claimType => $composableBuilder(
    column: $table.claimType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelUsed => $composableBuilder(
    column: $table.modelUsed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get promptVersion => $composableBuilder(
    column: $table.promptVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get supportScore => $composableBuilder(
    column: $table.supportScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verificationState => $composableBuilder(
    column: $table.verificationState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inputTranscriptHash => $composableBuilder(
    column: $table.inputTranscriptHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get processingDurationMs => $composableBuilder(
    column: $table.processingDurationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$NotesTableFilterComposer get noteId {
    final $$NotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> claimSourcesRefs(
    Expression<bool> Function($$ClaimSourcesTableFilterComposer f) f,
  ) {
    final $$ClaimSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.claimSources,
      getReferencedColumn: (t) => t.claimId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClaimSourcesTableFilterComposer(
            $db: $db,
            $table: $db.claimSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userFeedbackRefs(
    Expression<bool> Function($$UserFeedbackTableFilterComposer f) f,
  ) {
    final $$UserFeedbackTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userFeedback,
      getReferencedColumn: (t) => t.claimId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserFeedbackTableFilterComposer(
            $db: $db,
            $table: $db.userFeedback,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InsightClaimsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $InsightClaimsTable> {
  $$InsightClaimsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get claimText => $composableBuilder(
    column: $table.claimText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get claimType => $composableBuilder(
    column: $table.claimType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelUsed => $composableBuilder(
    column: $table.modelUsed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get promptVersion => $composableBuilder(
    column: $table.promptVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get supportScore => $composableBuilder(
    column: $table.supportScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verificationState => $composableBuilder(
    column: $table.verificationState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inputTranscriptHash => $composableBuilder(
    column: $table.inputTranscriptHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get processingDurationMs => $composableBuilder(
    column: $table.processingDurationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$NotesTableOrderingComposer get noteId {
    final $$NotesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableOrderingComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InsightClaimsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $InsightClaimsTable> {
  $$InsightClaimsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get claimText =>
      $composableBuilder(column: $table.claimText, builder: (column) => column);

  GeneratedColumn<String> get claimType =>
      $composableBuilder(column: $table.claimType, builder: (column) => column);

  GeneratedColumn<String> get modelUsed =>
      $composableBuilder(column: $table.modelUsed, builder: (column) => column);

  GeneratedColumn<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get promptVersion => $composableBuilder(
    column: $table.promptVersion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get supportScore => $composableBuilder(
    column: $table.supportScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get verificationState => $composableBuilder(
    column: $table.verificationState,
    builder: (column) => column,
  );

  GeneratedColumn<String> get inputTranscriptHash => $composableBuilder(
    column: $table.inputTranscriptHash,
    builder: (column) => column,
  );

  GeneratedColumn<int> get processingDurationMs => $composableBuilder(
    column: $table.processingDurationMs,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$NotesTableAnnotationComposer get noteId {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> claimSourcesRefs<T extends Object>(
    Expression<T> Function($$ClaimSourcesTableAnnotationComposer a) f,
  ) {
    final $$ClaimSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.claimSources,
      getReferencedColumn: (t) => t.claimId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClaimSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.claimSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userFeedbackRefs<T extends Object>(
    Expression<T> Function($$UserFeedbackTableAnnotationComposer a) f,
  ) {
    final $$UserFeedbackTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userFeedback,
      getReferencedColumn: (t) => t.claimId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserFeedbackTableAnnotationComposer(
            $db: $db,
            $table: $db.userFeedback,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InsightClaimsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $InsightClaimsTable,
          InsightClaim,
          $$InsightClaimsTableFilterComposer,
          $$InsightClaimsTableOrderingComposer,
          $$InsightClaimsTableAnnotationComposer,
          $$InsightClaimsTableCreateCompanionBuilder,
          $$InsightClaimsTableUpdateCompanionBuilder,
          (InsightClaim, $$InsightClaimsTableReferences),
          InsightClaim,
          PrefetchHooks Function({
            bool noteId,
            bool claimSourcesRefs,
            bool userFeedbackRefs,
          })
        > {
  $$InsightClaimsTableTableManager(
    _$VoxCitaDatabase db,
    $InsightClaimsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InsightClaimsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InsightClaimsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InsightClaimsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> noteId = const Value.absent(),
                Value<String> claimText = const Value.absent(),
                Value<String> claimType = const Value.absent(),
                Value<String> modelUsed = const Value.absent(),
                Value<String> modelVersion = const Value.absent(),
                Value<String> promptVersion = const Value.absent(),
                Value<double?> supportScore = const Value.absent(),
                Value<String> verificationState = const Value.absent(),
                Value<String> inputTranscriptHash = const Value.absent(),
                Value<int?> processingDurationMs = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InsightClaimsCompanion(
                id: id,
                noteId: noteId,
                claimText: claimText,
                claimType: claimType,
                modelUsed: modelUsed,
                modelVersion: modelVersion,
                promptVersion: promptVersion,
                supportScore: supportScore,
                verificationState: verificationState,
                inputTranscriptHash: inputTranscriptHash,
                processingDurationMs: processingDurationMs,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String noteId,
                required String claimText,
                required String claimType,
                required String modelUsed,
                required String modelVersion,
                required String promptVersion,
                Value<double?> supportScore = const Value.absent(),
                Value<String> verificationState = const Value.absent(),
                required String inputTranscriptHash,
                Value<int?> processingDurationMs = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => InsightClaimsCompanion.insert(
                id: id,
                noteId: noteId,
                claimText: claimText,
                claimType: claimType,
                modelUsed: modelUsed,
                modelVersion: modelVersion,
                promptVersion: promptVersion,
                supportScore: supportScore,
                verificationState: verificationState,
                inputTranscriptHash: inputTranscriptHash,
                processingDurationMs: processingDurationMs,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InsightClaimsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                noteId = false,
                claimSourcesRefs = false,
                userFeedbackRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (claimSourcesRefs) db.claimSources,
                    if (userFeedbackRefs) db.userFeedback,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (noteId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.noteId,
                                    referencedTable:
                                        $$InsightClaimsTableReferences
                                            ._noteIdTable(db),
                                    referencedColumn:
                                        $$InsightClaimsTableReferences
                                            ._noteIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (claimSourcesRefs)
                        await $_getPrefetchedData<
                          InsightClaim,
                          $InsightClaimsTable,
                          ClaimSource
                        >(
                          currentTable: table,
                          referencedTable: $$InsightClaimsTableReferences
                              ._claimSourcesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InsightClaimsTableReferences(
                                db,
                                table,
                                p0,
                              ).claimSourcesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.claimId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userFeedbackRefs)
                        await $_getPrefetchedData<
                          InsightClaim,
                          $InsightClaimsTable,
                          UserFeedbackData
                        >(
                          currentTable: table,
                          referencedTable: $$InsightClaimsTableReferences
                              ._userFeedbackRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InsightClaimsTableReferences(
                                db,
                                table,
                                p0,
                              ).userFeedbackRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.claimId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$InsightClaimsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $InsightClaimsTable,
      InsightClaim,
      $$InsightClaimsTableFilterComposer,
      $$InsightClaimsTableOrderingComposer,
      $$InsightClaimsTableAnnotationComposer,
      $$InsightClaimsTableCreateCompanionBuilder,
      $$InsightClaimsTableUpdateCompanionBuilder,
      (InsightClaim, $$InsightClaimsTableReferences),
      InsightClaim,
      PrefetchHooks Function({
        bool noteId,
        bool claimSourcesRefs,
        bool userFeedbackRefs,
      })
    >;
typedef $$ClaimSourcesTableCreateCompanionBuilder =
    ClaimSourcesCompanion Function({
      required String id,
      required String claimId,
      required String transcriptSegmentId,
      required int audioStartMs,
      required int audioEndMs,
      Value<int> rowid,
    });
typedef $$ClaimSourcesTableUpdateCompanionBuilder =
    ClaimSourcesCompanion Function({
      Value<String> id,
      Value<String> claimId,
      Value<String> transcriptSegmentId,
      Value<int> audioStartMs,
      Value<int> audioEndMs,
      Value<int> rowid,
    });

final class $$ClaimSourcesTableReferences
    extends BaseReferences<_$VoxCitaDatabase, $ClaimSourcesTable, ClaimSource> {
  $$ClaimSourcesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InsightClaimsTable _claimIdTable(_$VoxCitaDatabase db) =>
      db.insightClaims.createAlias(
        $_aliasNameGenerator(db.claimSources.claimId, db.insightClaims.id),
      );

  $$InsightClaimsTableProcessedTableManager get claimId {
    final $_column = $_itemColumn<String>('claim_id')!;

    final manager = $$InsightClaimsTableTableManager(
      $_db,
      $_db.insightClaims,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_claimIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TranscriptSegmentsTable _transcriptSegmentIdTable(
    _$VoxCitaDatabase db,
  ) => db.transcriptSegments.createAlias(
    $_aliasNameGenerator(
      db.claimSources.transcriptSegmentId,
      db.transcriptSegments.id,
    ),
  );

  $$TranscriptSegmentsTableProcessedTableManager get transcriptSegmentId {
    final $_column = $_itemColumn<String>('transcript_segment_id')!;

    final manager = $$TranscriptSegmentsTableTableManager(
      $_db,
      $_db.transcriptSegments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transcriptSegmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ClaimSourcesTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $ClaimSourcesTable> {
  $$ClaimSourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get audioStartMs => $composableBuilder(
    column: $table.audioStartMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get audioEndMs => $composableBuilder(
    column: $table.audioEndMs,
    builder: (column) => ColumnFilters(column),
  );

  $$InsightClaimsTableFilterComposer get claimId {
    final $$InsightClaimsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.claimId,
      referencedTable: $db.insightClaims,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsightClaimsTableFilterComposer(
            $db: $db,
            $table: $db.insightClaims,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TranscriptSegmentsTableFilterComposer get transcriptSegmentId {
    final $$TranscriptSegmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transcriptSegmentId,
      referencedTable: $db.transcriptSegments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranscriptSegmentsTableFilterComposer(
            $db: $db,
            $table: $db.transcriptSegments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClaimSourcesTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $ClaimSourcesTable> {
  $$ClaimSourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get audioStartMs => $composableBuilder(
    column: $table.audioStartMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get audioEndMs => $composableBuilder(
    column: $table.audioEndMs,
    builder: (column) => ColumnOrderings(column),
  );

  $$InsightClaimsTableOrderingComposer get claimId {
    final $$InsightClaimsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.claimId,
      referencedTable: $db.insightClaims,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsightClaimsTableOrderingComposer(
            $db: $db,
            $table: $db.insightClaims,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TranscriptSegmentsTableOrderingComposer get transcriptSegmentId {
    final $$TranscriptSegmentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transcriptSegmentId,
      referencedTable: $db.transcriptSegments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranscriptSegmentsTableOrderingComposer(
            $db: $db,
            $table: $db.transcriptSegments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClaimSourcesTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $ClaimSourcesTable> {
  $$ClaimSourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get audioStartMs => $composableBuilder(
    column: $table.audioStartMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get audioEndMs => $composableBuilder(
    column: $table.audioEndMs,
    builder: (column) => column,
  );

  $$InsightClaimsTableAnnotationComposer get claimId {
    final $$InsightClaimsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.claimId,
      referencedTable: $db.insightClaims,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsightClaimsTableAnnotationComposer(
            $db: $db,
            $table: $db.insightClaims,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TranscriptSegmentsTableAnnotationComposer get transcriptSegmentId {
    final $$TranscriptSegmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transcriptSegmentId,
          referencedTable: $db.transcriptSegments,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TranscriptSegmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.transcriptSegments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ClaimSourcesTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $ClaimSourcesTable,
          ClaimSource,
          $$ClaimSourcesTableFilterComposer,
          $$ClaimSourcesTableOrderingComposer,
          $$ClaimSourcesTableAnnotationComposer,
          $$ClaimSourcesTableCreateCompanionBuilder,
          $$ClaimSourcesTableUpdateCompanionBuilder,
          (ClaimSource, $$ClaimSourcesTableReferences),
          ClaimSource,
          PrefetchHooks Function({bool claimId, bool transcriptSegmentId})
        > {
  $$ClaimSourcesTableTableManager(
    _$VoxCitaDatabase db,
    $ClaimSourcesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClaimSourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClaimSourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClaimSourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> claimId = const Value.absent(),
                Value<String> transcriptSegmentId = const Value.absent(),
                Value<int> audioStartMs = const Value.absent(),
                Value<int> audioEndMs = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClaimSourcesCompanion(
                id: id,
                claimId: claimId,
                transcriptSegmentId: transcriptSegmentId,
                audioStartMs: audioStartMs,
                audioEndMs: audioEndMs,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String claimId,
                required String transcriptSegmentId,
                required int audioStartMs,
                required int audioEndMs,
                Value<int> rowid = const Value.absent(),
              }) => ClaimSourcesCompanion.insert(
                id: id,
                claimId: claimId,
                transcriptSegmentId: transcriptSegmentId,
                audioStartMs: audioStartMs,
                audioEndMs: audioEndMs,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ClaimSourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({claimId = false, transcriptSegmentId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (claimId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.claimId,
                                    referencedTable:
                                        $$ClaimSourcesTableReferences
                                            ._claimIdTable(db),
                                    referencedColumn:
                                        $$ClaimSourcesTableReferences
                                            ._claimIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (transcriptSegmentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.transcriptSegmentId,
                                    referencedTable:
                                        $$ClaimSourcesTableReferences
                                            ._transcriptSegmentIdTable(db),
                                    referencedColumn:
                                        $$ClaimSourcesTableReferences
                                            ._transcriptSegmentIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ClaimSourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $ClaimSourcesTable,
      ClaimSource,
      $$ClaimSourcesTableFilterComposer,
      $$ClaimSourcesTableOrderingComposer,
      $$ClaimSourcesTableAnnotationComposer,
      $$ClaimSourcesTableCreateCompanionBuilder,
      $$ClaimSourcesTableUpdateCompanionBuilder,
      (ClaimSource, $$ClaimSourcesTableReferences),
      ClaimSource,
      PrefetchHooks Function({bool claimId, bool transcriptSegmentId})
    >;
typedef $$CollectionsTableCreateCompanionBuilder =
    CollectionsCompanion Function({
      required String id,
      required String name,
      Value<String> description,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$CollectionsTableUpdateCompanionBuilder =
    CollectionsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$CollectionsTableReferences
    extends BaseReferences<_$VoxCitaDatabase, $CollectionsTable, Collection> {
  $$CollectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NoteCollectionsTable, List<NoteCollection>>
  _noteCollectionsRefsTable(_$VoxCitaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.noteCollections,
        aliasName: $_aliasNameGenerator(
          db.collections.id,
          db.noteCollections.collectionId,
        ),
      );

  $$NoteCollectionsTableProcessedTableManager get noteCollectionsRefs {
    final manager = $$NoteCollectionsTableTableManager(
      $_db,
      $_db.noteCollections,
    ).filter((f) => f.collectionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _noteCollectionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CollectionsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $CollectionsTable> {
  $$CollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> noteCollectionsRefs(
    Expression<bool> Function($$NoteCollectionsTableFilterComposer f) f,
  ) {
    final $$NoteCollectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteCollections,
      getReferencedColumn: (t) => t.collectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteCollectionsTableFilterComposer(
            $db: $db,
            $table: $db.noteCollections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CollectionsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $CollectionsTable> {
  $$CollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CollectionsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $CollectionsTable> {
  $$CollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> noteCollectionsRefs<T extends Object>(
    Expression<T> Function($$NoteCollectionsTableAnnotationComposer a) f,
  ) {
    final $$NoteCollectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteCollections,
      getReferencedColumn: (t) => t.collectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteCollectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.noteCollections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CollectionsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $CollectionsTable,
          Collection,
          $$CollectionsTableFilterComposer,
          $$CollectionsTableOrderingComposer,
          $$CollectionsTableAnnotationComposer,
          $$CollectionsTableCreateCompanionBuilder,
          $$CollectionsTableUpdateCompanionBuilder,
          (Collection, $$CollectionsTableReferences),
          Collection,
          PrefetchHooks Function({bool noteCollectionsRefs})
        > {
  $$CollectionsTableTableManager(_$VoxCitaDatabase db, $CollectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CollectionsCompanion(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> description = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CollectionsCompanion.insert(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CollectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({noteCollectionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (noteCollectionsRefs) db.noteCollections,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (noteCollectionsRefs)
                    await $_getPrefetchedData<
                      Collection,
                      $CollectionsTable,
                      NoteCollection
                    >(
                      currentTable: table,
                      referencedTable: $$CollectionsTableReferences
                          ._noteCollectionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CollectionsTableReferences(
                            db,
                            table,
                            p0,
                          ).noteCollectionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.collectionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CollectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $CollectionsTable,
      Collection,
      $$CollectionsTableFilterComposer,
      $$CollectionsTableOrderingComposer,
      $$CollectionsTableAnnotationComposer,
      $$CollectionsTableCreateCompanionBuilder,
      $$CollectionsTableUpdateCompanionBuilder,
      (Collection, $$CollectionsTableReferences),
      Collection,
      PrefetchHooks Function({bool noteCollectionsRefs})
    >;
typedef $$NoteCollectionsTableCreateCompanionBuilder =
    NoteCollectionsCompanion Function({
      required String noteId,
      required String collectionId,
      Value<int> rowid,
    });
typedef $$NoteCollectionsTableUpdateCompanionBuilder =
    NoteCollectionsCompanion Function({
      Value<String> noteId,
      Value<String> collectionId,
      Value<int> rowid,
    });

final class $$NoteCollectionsTableReferences
    extends
        BaseReferences<
          _$VoxCitaDatabase,
          $NoteCollectionsTable,
          NoteCollection
        > {
  $$NoteCollectionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $NotesTable _noteIdTable(_$VoxCitaDatabase db) => db.notes.createAlias(
    $_aliasNameGenerator(db.noteCollections.noteId, db.notes.id),
  );

  $$NotesTableProcessedTableManager get noteId {
    final $_column = $_itemColumn<String>('note_id')!;

    final manager = $$NotesTableTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_noteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CollectionsTable _collectionIdTable(_$VoxCitaDatabase db) =>
      db.collections.createAlias(
        $_aliasNameGenerator(
          db.noteCollections.collectionId,
          db.collections.id,
        ),
      );

  $$CollectionsTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<String>('collection_id')!;

    final manager = $$CollectionsTableTableManager(
      $_db,
      $_db.collections,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NoteCollectionsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $NoteCollectionsTable> {
  $$NoteCollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NotesTableFilterComposer get noteId {
    final $$NotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CollectionsTableFilterComposer get collectionId {
    final $$CollectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.collections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionsTableFilterComposer(
            $db: $db,
            $table: $db.collections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NoteCollectionsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $NoteCollectionsTable> {
  $$NoteCollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NotesTableOrderingComposer get noteId {
    final $$NotesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableOrderingComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CollectionsTableOrderingComposer get collectionId {
    final $$CollectionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.collections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionsTableOrderingComposer(
            $db: $db,
            $table: $db.collections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NoteCollectionsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $NoteCollectionsTable> {
  $$NoteCollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NotesTableAnnotationComposer get noteId {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CollectionsTableAnnotationComposer get collectionId {
    final $$CollectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.collections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.collections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NoteCollectionsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $NoteCollectionsTable,
          NoteCollection,
          $$NoteCollectionsTableFilterComposer,
          $$NoteCollectionsTableOrderingComposer,
          $$NoteCollectionsTableAnnotationComposer,
          $$NoteCollectionsTableCreateCompanionBuilder,
          $$NoteCollectionsTableUpdateCompanionBuilder,
          (NoteCollection, $$NoteCollectionsTableReferences),
          NoteCollection,
          PrefetchHooks Function({bool noteId, bool collectionId})
        > {
  $$NoteCollectionsTableTableManager(
    _$VoxCitaDatabase db,
    $NoteCollectionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteCollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteCollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteCollectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> noteId = const Value.absent(),
                Value<String> collectionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NoteCollectionsCompanion(
                noteId: noteId,
                collectionId: collectionId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String noteId,
                required String collectionId,
                Value<int> rowid = const Value.absent(),
              }) => NoteCollectionsCompanion.insert(
                noteId: noteId,
                collectionId: collectionId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NoteCollectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({noteId = false, collectionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (noteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.noteId,
                                referencedTable:
                                    $$NoteCollectionsTableReferences
                                        ._noteIdTable(db),
                                referencedColumn:
                                    $$NoteCollectionsTableReferences
                                        ._noteIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (collectionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.collectionId,
                                referencedTable:
                                    $$NoteCollectionsTableReferences
                                        ._collectionIdTable(db),
                                referencedColumn:
                                    $$NoteCollectionsTableReferences
                                        ._collectionIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NoteCollectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $NoteCollectionsTable,
      NoteCollection,
      $$NoteCollectionsTableFilterComposer,
      $$NoteCollectionsTableOrderingComposer,
      $$NoteCollectionsTableAnnotationComposer,
      $$NoteCollectionsTableCreateCompanionBuilder,
      $$NoteCollectionsTableUpdateCompanionBuilder,
      (NoteCollection, $$NoteCollectionsTableReferences),
      NoteCollection,
      PrefetchHooks Function({bool noteId, bool collectionId})
    >;
typedef $$TagsTableCreateCompanionBuilder =
    TagsCompanion Function({
      required String id,
      required String name,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$TagsTableUpdateCompanionBuilder =
    TagsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$TagsTableReferences
    extends BaseReferences<_$VoxCitaDatabase, $TagsTable, Tag> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NoteTagsTable, List<NoteTag>> _noteTagsRefsTable(
    _$VoxCitaDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.noteTags,
    aliasName: $_aliasNameGenerator(db.tags.id, db.noteTags.tagId),
  );

  $$NoteTagsTableProcessedTableManager get noteTagsRefs {
    final manager = $$NoteTagsTableTableManager(
      $_db,
      $_db.noteTags,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_noteTagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TagsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> noteTagsRefs(
    Expression<bool> Function($$NoteTagsTableFilterComposer f) f,
  ) {
    final $$NoteTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteTags,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTagsTableFilterComposer(
            $db: $db,
            $table: $db.noteTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> noteTagsRefs<T extends Object>(
    Expression<T> Function($$NoteTagsTableAnnotationComposer a) f,
  ) {
    final $$NoteTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteTags,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.noteTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $TagsTable,
          Tag,
          $$TagsTableFilterComposer,
          $$TagsTableOrderingComposer,
          $$TagsTableAnnotationComposer,
          $$TagsTableCreateCompanionBuilder,
          $$TagsTableUpdateCompanionBuilder,
          (Tag, $$TagsTableReferences),
          Tag,
          PrefetchHooks Function({bool noteTagsRefs})
        > {
  $$TagsTableTableManager(_$VoxCitaDatabase db, $TagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TagsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({noteTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (noteTagsRefs) db.noteTags],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (noteTagsRefs)
                    await $_getPrefetchedData<Tag, $TagsTable, NoteTag>(
                      currentTable: table,
                      referencedTable: $$TagsTableReferences._noteTagsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$TagsTableReferences(db, table, p0).noteTagsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TagsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $TagsTable,
      Tag,
      $$TagsTableFilterComposer,
      $$TagsTableOrderingComposer,
      $$TagsTableAnnotationComposer,
      $$TagsTableCreateCompanionBuilder,
      $$TagsTableUpdateCompanionBuilder,
      (Tag, $$TagsTableReferences),
      Tag,
      PrefetchHooks Function({bool noteTagsRefs})
    >;
typedef $$NoteTagsTableCreateCompanionBuilder =
    NoteTagsCompanion Function({
      required String noteId,
      required String tagId,
      Value<int> rowid,
    });
typedef $$NoteTagsTableUpdateCompanionBuilder =
    NoteTagsCompanion Function({
      Value<String> noteId,
      Value<String> tagId,
      Value<int> rowid,
    });

final class $$NoteTagsTableReferences
    extends BaseReferences<_$VoxCitaDatabase, $NoteTagsTable, NoteTag> {
  $$NoteTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NotesTable _noteIdTable(_$VoxCitaDatabase db) => db.notes.createAlias(
    $_aliasNameGenerator(db.noteTags.noteId, db.notes.id),
  );

  $$NotesTableProcessedTableManager get noteId {
    final $_column = $_itemColumn<String>('note_id')!;

    final manager = $$NotesTableTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_noteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagsTable _tagIdTable(_$VoxCitaDatabase db) =>
      db.tags.createAlias($_aliasNameGenerator(db.noteTags.tagId, db.tags.id));

  $$TagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<String>('tag_id')!;

    final manager = $$TagsTableTableManager(
      $_db,
      $_db.tags,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NoteTagsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $NoteTagsTable> {
  $$NoteTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NotesTableFilterComposer get noteId {
    final $$NotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableFilterComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NoteTagsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $NoteTagsTable> {
  $$NoteTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NotesTableOrderingComposer get noteId {
    final $$NotesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableOrderingComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableOrderingComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NoteTagsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $NoteTagsTable> {
  $$NoteTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NotesTableAnnotationComposer get noteId {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableAnnotationComposer get tagId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableAnnotationComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NoteTagsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $NoteTagsTable,
          NoteTag,
          $$NoteTagsTableFilterComposer,
          $$NoteTagsTableOrderingComposer,
          $$NoteTagsTableAnnotationComposer,
          $$NoteTagsTableCreateCompanionBuilder,
          $$NoteTagsTableUpdateCompanionBuilder,
          (NoteTag, $$NoteTagsTableReferences),
          NoteTag,
          PrefetchHooks Function({bool noteId, bool tagId})
        > {
  $$NoteTagsTableTableManager(_$VoxCitaDatabase db, $NoteTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> noteId = const Value.absent(),
                Value<String> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  NoteTagsCompanion(noteId: noteId, tagId: tagId, rowid: rowid),
          createCompanionCallback:
              ({
                required String noteId,
                required String tagId,
                Value<int> rowid = const Value.absent(),
              }) => NoteTagsCompanion.insert(
                noteId: noteId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NoteTagsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({noteId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (noteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.noteId,
                                referencedTable: $$NoteTagsTableReferences
                                    ._noteIdTable(db),
                                referencedColumn: $$NoteTagsTableReferences
                                    ._noteIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (tagId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagId,
                                referencedTable: $$NoteTagsTableReferences
                                    ._tagIdTable(db),
                                referencedColumn: $$NoteTagsTableReferences
                                    ._tagIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NoteTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $NoteTagsTable,
      NoteTag,
      $$NoteTagsTableFilterComposer,
      $$NoteTagsTableOrderingComposer,
      $$NoteTagsTableAnnotationComposer,
      $$NoteTagsTableCreateCompanionBuilder,
      $$NoteTagsTableUpdateCompanionBuilder,
      (NoteTag, $$NoteTagsTableReferences),
      NoteTag,
      PrefetchHooks Function({bool noteId, bool tagId})
    >;
typedef $$ProcessingJobsTableCreateCompanionBuilder =
    ProcessingJobsCompanion Function({
      required String id,
      required String noteId,
      required String jobType,
      required String status,
      Value<double> progress,
      Value<String?> errorMessage,
      required DateTime createdAt,
      Value<DateTime?> startedAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$ProcessingJobsTableUpdateCompanionBuilder =
    ProcessingJobsCompanion Function({
      Value<String> id,
      Value<String> noteId,
      Value<String> jobType,
      Value<String> status,
      Value<double> progress,
      Value<String?> errorMessage,
      Value<DateTime> createdAt,
      Value<DateTime?> startedAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

final class $$ProcessingJobsTableReferences
    extends
        BaseReferences<_$VoxCitaDatabase, $ProcessingJobsTable, ProcessingJob> {
  $$ProcessingJobsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $NotesTable _noteIdTable(_$VoxCitaDatabase db) => db.notes.createAlias(
    $_aliasNameGenerator(db.processingJobs.noteId, db.notes.id),
  );

  $$NotesTableProcessedTableManager get noteId {
    final $_column = $_itemColumn<String>('note_id')!;

    final manager = $$NotesTableTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_noteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProcessingJobsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $ProcessingJobsTable> {
  $$ProcessingJobsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobType => $composableBuilder(
    column: $table.jobType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$NotesTableFilterComposer get noteId {
    final $$NotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProcessingJobsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $ProcessingJobsTable> {
  $$ProcessingJobsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobType => $composableBuilder(
    column: $table.jobType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$NotesTableOrderingComposer get noteId {
    final $$NotesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableOrderingComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProcessingJobsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $ProcessingJobsTable> {
  $$ProcessingJobsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get jobType =>
      $composableBuilder(column: $table.jobType, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  $$NotesTableAnnotationComposer get noteId {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProcessingJobsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $ProcessingJobsTable,
          ProcessingJob,
          $$ProcessingJobsTableFilterComposer,
          $$ProcessingJobsTableOrderingComposer,
          $$ProcessingJobsTableAnnotationComposer,
          $$ProcessingJobsTableCreateCompanionBuilder,
          $$ProcessingJobsTableUpdateCompanionBuilder,
          (ProcessingJob, $$ProcessingJobsTableReferences),
          ProcessingJob,
          PrefetchHooks Function({bool noteId})
        > {
  $$ProcessingJobsTableTableManager(
    _$VoxCitaDatabase db,
    $ProcessingJobsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProcessingJobsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProcessingJobsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProcessingJobsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> noteId = const Value.absent(),
                Value<String> jobType = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProcessingJobsCompanion(
                id: id,
                noteId: noteId,
                jobType: jobType,
                status: status,
                progress: progress,
                errorMessage: errorMessage,
                createdAt: createdAt,
                startedAt: startedAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String noteId,
                required String jobType,
                required String status,
                Value<double> progress = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProcessingJobsCompanion.insert(
                id: id,
                noteId: noteId,
                jobType: jobType,
                status: status,
                progress: progress,
                errorMessage: errorMessage,
                createdAt: createdAt,
                startedAt: startedAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProcessingJobsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({noteId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (noteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.noteId,
                                referencedTable: $$ProcessingJobsTableReferences
                                    ._noteIdTable(db),
                                referencedColumn:
                                    $$ProcessingJobsTableReferences
                                        ._noteIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProcessingJobsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $ProcessingJobsTable,
      ProcessingJob,
      $$ProcessingJobsTableFilterComposer,
      $$ProcessingJobsTableOrderingComposer,
      $$ProcessingJobsTableAnnotationComposer,
      $$ProcessingJobsTableCreateCompanionBuilder,
      $$ProcessingJobsTableUpdateCompanionBuilder,
      (ProcessingJob, $$ProcessingJobsTableReferences),
      ProcessingJob,
      PrefetchHooks Function({bool noteId})
    >;
typedef $$ModelRunsTableCreateCompanionBuilder =
    ModelRunsCompanion Function({
      required String id,
      required String noteId,
      required String modelUsed,
      required String modelVersion,
      required String promptVersion,
      required String inputTranscriptHash,
      Value<int?> processingDurationMs,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ModelRunsTableUpdateCompanionBuilder =
    ModelRunsCompanion Function({
      Value<String> id,
      Value<String> noteId,
      Value<String> modelUsed,
      Value<String> modelVersion,
      Value<String> promptVersion,
      Value<String> inputTranscriptHash,
      Value<int?> processingDurationMs,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$ModelRunsTableReferences
    extends BaseReferences<_$VoxCitaDatabase, $ModelRunsTable, ModelRun> {
  $$ModelRunsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NotesTable _noteIdTable(_$VoxCitaDatabase db) => db.notes.createAlias(
    $_aliasNameGenerator(db.modelRuns.noteId, db.notes.id),
  );

  $$NotesTableProcessedTableManager get noteId {
    final $_column = $_itemColumn<String>('note_id')!;

    final manager = $$NotesTableTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_noteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ModelRunsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $ModelRunsTable> {
  $$ModelRunsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelUsed => $composableBuilder(
    column: $table.modelUsed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get promptVersion => $composableBuilder(
    column: $table.promptVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inputTranscriptHash => $composableBuilder(
    column: $table.inputTranscriptHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get processingDurationMs => $composableBuilder(
    column: $table.processingDurationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$NotesTableFilterComposer get noteId {
    final $$NotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ModelRunsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $ModelRunsTable> {
  $$ModelRunsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelUsed => $composableBuilder(
    column: $table.modelUsed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get promptVersion => $composableBuilder(
    column: $table.promptVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inputTranscriptHash => $composableBuilder(
    column: $table.inputTranscriptHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get processingDurationMs => $composableBuilder(
    column: $table.processingDurationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$NotesTableOrderingComposer get noteId {
    final $$NotesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableOrderingComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ModelRunsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $ModelRunsTable> {
  $$ModelRunsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get modelUsed =>
      $composableBuilder(column: $table.modelUsed, builder: (column) => column);

  GeneratedColumn<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get promptVersion => $composableBuilder(
    column: $table.promptVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get inputTranscriptHash => $composableBuilder(
    column: $table.inputTranscriptHash,
    builder: (column) => column,
  );

  GeneratedColumn<int> get processingDurationMs => $composableBuilder(
    column: $table.processingDurationMs,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$NotesTableAnnotationComposer get noteId {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ModelRunsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $ModelRunsTable,
          ModelRun,
          $$ModelRunsTableFilterComposer,
          $$ModelRunsTableOrderingComposer,
          $$ModelRunsTableAnnotationComposer,
          $$ModelRunsTableCreateCompanionBuilder,
          $$ModelRunsTableUpdateCompanionBuilder,
          (ModelRun, $$ModelRunsTableReferences),
          ModelRun,
          PrefetchHooks Function({bool noteId})
        > {
  $$ModelRunsTableTableManager(_$VoxCitaDatabase db, $ModelRunsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModelRunsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModelRunsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModelRunsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> noteId = const Value.absent(),
                Value<String> modelUsed = const Value.absent(),
                Value<String> modelVersion = const Value.absent(),
                Value<String> promptVersion = const Value.absent(),
                Value<String> inputTranscriptHash = const Value.absent(),
                Value<int?> processingDurationMs = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ModelRunsCompanion(
                id: id,
                noteId: noteId,
                modelUsed: modelUsed,
                modelVersion: modelVersion,
                promptVersion: promptVersion,
                inputTranscriptHash: inputTranscriptHash,
                processingDurationMs: processingDurationMs,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String noteId,
                required String modelUsed,
                required String modelVersion,
                required String promptVersion,
                required String inputTranscriptHash,
                Value<int?> processingDurationMs = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ModelRunsCompanion.insert(
                id: id,
                noteId: noteId,
                modelUsed: modelUsed,
                modelVersion: modelVersion,
                promptVersion: promptVersion,
                inputTranscriptHash: inputTranscriptHash,
                processingDurationMs: processingDurationMs,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ModelRunsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({noteId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (noteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.noteId,
                                referencedTable: $$ModelRunsTableReferences
                                    ._noteIdTable(db),
                                referencedColumn: $$ModelRunsTableReferences
                                    ._noteIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ModelRunsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $ModelRunsTable,
      ModelRun,
      $$ModelRunsTableFilterComposer,
      $$ModelRunsTableOrderingComposer,
      $$ModelRunsTableAnnotationComposer,
      $$ModelRunsTableCreateCompanionBuilder,
      $$ModelRunsTableUpdateCompanionBuilder,
      (ModelRun, $$ModelRunsTableReferences),
      ModelRun,
      PrefetchHooks Function({bool noteId})
    >;
typedef $$UserFeedbackTableCreateCompanionBuilder =
    UserFeedbackCompanion Function({
      required String id,
      Value<String?> claimId,
      required String feedbackType,
      Value<String?> feedbackDetail,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$UserFeedbackTableUpdateCompanionBuilder =
    UserFeedbackCompanion Function({
      Value<String> id,
      Value<String?> claimId,
      Value<String> feedbackType,
      Value<String?> feedbackDetail,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$UserFeedbackTableReferences
    extends
        BaseReferences<
          _$VoxCitaDatabase,
          $UserFeedbackTable,
          UserFeedbackData
        > {
  $$UserFeedbackTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InsightClaimsTable _claimIdTable(_$VoxCitaDatabase db) =>
      db.insightClaims.createAlias(
        $_aliasNameGenerator(db.userFeedback.claimId, db.insightClaims.id),
      );

  $$InsightClaimsTableProcessedTableManager? get claimId {
    final $_column = $_itemColumn<String>('claim_id');
    if ($_column == null) return null;
    final manager = $$InsightClaimsTableTableManager(
      $_db,
      $_db.insightClaims,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_claimIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserFeedbackTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $UserFeedbackTable> {
  $$UserFeedbackTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feedbackType => $composableBuilder(
    column: $table.feedbackType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feedbackDetail => $composableBuilder(
    column: $table.feedbackDetail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$InsightClaimsTableFilterComposer get claimId {
    final $$InsightClaimsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.claimId,
      referencedTable: $db.insightClaims,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsightClaimsTableFilterComposer(
            $db: $db,
            $table: $db.insightClaims,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserFeedbackTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $UserFeedbackTable> {
  $$UserFeedbackTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feedbackType => $composableBuilder(
    column: $table.feedbackType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feedbackDetail => $composableBuilder(
    column: $table.feedbackDetail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$InsightClaimsTableOrderingComposer get claimId {
    final $$InsightClaimsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.claimId,
      referencedTable: $db.insightClaims,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsightClaimsTableOrderingComposer(
            $db: $db,
            $table: $db.insightClaims,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserFeedbackTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $UserFeedbackTable> {
  $$UserFeedbackTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get feedbackType => $composableBuilder(
    column: $table.feedbackType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get feedbackDetail => $composableBuilder(
    column: $table.feedbackDetail,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$InsightClaimsTableAnnotationComposer get claimId {
    final $$InsightClaimsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.claimId,
      referencedTable: $db.insightClaims,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsightClaimsTableAnnotationComposer(
            $db: $db,
            $table: $db.insightClaims,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserFeedbackTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $UserFeedbackTable,
          UserFeedbackData,
          $$UserFeedbackTableFilterComposer,
          $$UserFeedbackTableOrderingComposer,
          $$UserFeedbackTableAnnotationComposer,
          $$UserFeedbackTableCreateCompanionBuilder,
          $$UserFeedbackTableUpdateCompanionBuilder,
          (UserFeedbackData, $$UserFeedbackTableReferences),
          UserFeedbackData,
          PrefetchHooks Function({bool claimId})
        > {
  $$UserFeedbackTableTableManager(
    _$VoxCitaDatabase db,
    $UserFeedbackTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserFeedbackTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserFeedbackTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserFeedbackTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> claimId = const Value.absent(),
                Value<String> feedbackType = const Value.absent(),
                Value<String?> feedbackDetail = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserFeedbackCompanion(
                id: id,
                claimId: claimId,
                feedbackType: feedbackType,
                feedbackDetail: feedbackDetail,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> claimId = const Value.absent(),
                required String feedbackType,
                Value<String?> feedbackDetail = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => UserFeedbackCompanion.insert(
                id: id,
                claimId: claimId,
                feedbackType: feedbackType,
                feedbackDetail: feedbackDetail,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserFeedbackTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({claimId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (claimId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.claimId,
                                referencedTable: $$UserFeedbackTableReferences
                                    ._claimIdTable(db),
                                referencedColumn: $$UserFeedbackTableReferences
                                    ._claimIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserFeedbackTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $UserFeedbackTable,
      UserFeedbackData,
      $$UserFeedbackTableFilterComposer,
      $$UserFeedbackTableOrderingComposer,
      $$UserFeedbackTableAnnotationComposer,
      $$UserFeedbackTableCreateCompanionBuilder,
      $$UserFeedbackTableUpdateCompanionBuilder,
      (UserFeedbackData, $$UserFeedbackTableReferences),
      UserFeedbackData,
      PrefetchHooks Function({bool claimId})
    >;
typedef $$AskHistoryTableCreateCompanionBuilder =
    AskHistoryCompanion Function({
      required String id,
      required String query,
      required String resultType,
      required String answerText,
      Value<double> confidence,
      Value<String?> abstentionReason,
      required String sourceNoteIds,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$AskHistoryTableUpdateCompanionBuilder =
    AskHistoryCompanion Function({
      Value<String> id,
      Value<String> query,
      Value<String> resultType,
      Value<String> answerText,
      Value<double> confidence,
      Value<String?> abstentionReason,
      Value<String> sourceNoteIds,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$AskHistoryTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $AskHistoryTable> {
  $$AskHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultType => $composableBuilder(
    column: $table.resultType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answerText => $composableBuilder(
    column: $table.answerText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get abstentionReason => $composableBuilder(
    column: $table.abstentionReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceNoteIds => $composableBuilder(
    column: $table.sourceNoteIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AskHistoryTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $AskHistoryTable> {
  $$AskHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultType => $composableBuilder(
    column: $table.resultType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answerText => $composableBuilder(
    column: $table.answerText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get abstentionReason => $composableBuilder(
    column: $table.abstentionReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceNoteIds => $composableBuilder(
    column: $table.sourceNoteIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AskHistoryTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $AskHistoryTable> {
  $$AskHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<String> get resultType => $composableBuilder(
    column: $table.resultType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get answerText => $composableBuilder(
    column: $table.answerText,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get abstentionReason => $composableBuilder(
    column: $table.abstentionReason,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceNoteIds => $composableBuilder(
    column: $table.sourceNoteIds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AskHistoryTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $AskHistoryTable,
          AskHistoryData,
          $$AskHistoryTableFilterComposer,
          $$AskHistoryTableOrderingComposer,
          $$AskHistoryTableAnnotationComposer,
          $$AskHistoryTableCreateCompanionBuilder,
          $$AskHistoryTableUpdateCompanionBuilder,
          (
            AskHistoryData,
            BaseReferences<_$VoxCitaDatabase, $AskHistoryTable, AskHistoryData>,
          ),
          AskHistoryData,
          PrefetchHooks Function()
        > {
  $$AskHistoryTableTableManager(_$VoxCitaDatabase db, $AskHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AskHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AskHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AskHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> query = const Value.absent(),
                Value<String> resultType = const Value.absent(),
                Value<String> answerText = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<String?> abstentionReason = const Value.absent(),
                Value<String> sourceNoteIds = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AskHistoryCompanion(
                id: id,
                query: query,
                resultType: resultType,
                answerText: answerText,
                confidence: confidence,
                abstentionReason: abstentionReason,
                sourceNoteIds: sourceNoteIds,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String query,
                required String resultType,
                required String answerText,
                Value<double> confidence = const Value.absent(),
                Value<String?> abstentionReason = const Value.absent(),
                required String sourceNoteIds,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AskHistoryCompanion.insert(
                id: id,
                query: query,
                resultType: resultType,
                answerText: answerText,
                confidence: confidence,
                abstentionReason: abstentionReason,
                sourceNoteIds: sourceNoteIds,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AskHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $AskHistoryTable,
      AskHistoryData,
      $$AskHistoryTableFilterComposer,
      $$AskHistoryTableOrderingComposer,
      $$AskHistoryTableAnnotationComposer,
      $$AskHistoryTableCreateCompanionBuilder,
      $$AskHistoryTableUpdateCompanionBuilder,
      (
        AskHistoryData,
        BaseReferences<_$VoxCitaDatabase, $AskHistoryTable, AskHistoryData>,
      ),
      AskHistoryData,
      PrefetchHooks Function()
    >;
typedef $$SchemaMigrationsTableCreateCompanionBuilder =
    SchemaMigrationsCompanion Function({
      Value<int> version,
      required String description,
      required DateTime appliedAt,
    });
typedef $$SchemaMigrationsTableUpdateCompanionBuilder =
    SchemaMigrationsCompanion Function({
      Value<int> version,
      Value<String> description,
      Value<DateTime> appliedAt,
    });

class $$SchemaMigrationsTableFilterComposer
    extends Composer<_$VoxCitaDatabase, $SchemaMigrationsTable> {
  $$SchemaMigrationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get appliedAt => $composableBuilder(
    column: $table.appliedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SchemaMigrationsTableOrderingComposer
    extends Composer<_$VoxCitaDatabase, $SchemaMigrationsTable> {
  $$SchemaMigrationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get appliedAt => $composableBuilder(
    column: $table.appliedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SchemaMigrationsTableAnnotationComposer
    extends Composer<_$VoxCitaDatabase, $SchemaMigrationsTable> {
  $$SchemaMigrationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get appliedAt =>
      $composableBuilder(column: $table.appliedAt, builder: (column) => column);
}

class $$SchemaMigrationsTableTableManager
    extends
        RootTableManager<
          _$VoxCitaDatabase,
          $SchemaMigrationsTable,
          SchemaMigration,
          $$SchemaMigrationsTableFilterComposer,
          $$SchemaMigrationsTableOrderingComposer,
          $$SchemaMigrationsTableAnnotationComposer,
          $$SchemaMigrationsTableCreateCompanionBuilder,
          $$SchemaMigrationsTableUpdateCompanionBuilder,
          (
            SchemaMigration,
            BaseReferences<
              _$VoxCitaDatabase,
              $SchemaMigrationsTable,
              SchemaMigration
            >,
          ),
          SchemaMigration,
          PrefetchHooks Function()
        > {
  $$SchemaMigrationsTableTableManager(
    _$VoxCitaDatabase db,
    $SchemaMigrationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchemaMigrationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchemaMigrationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchemaMigrationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> version = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> appliedAt = const Value.absent(),
              }) => SchemaMigrationsCompanion(
                version: version,
                description: description,
                appliedAt: appliedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> version = const Value.absent(),
                required String description,
                required DateTime appliedAt,
              }) => SchemaMigrationsCompanion.insert(
                version: version,
                description: description,
                appliedAt: appliedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SchemaMigrationsTableProcessedTableManager =
    ProcessedTableManager<
      _$VoxCitaDatabase,
      $SchemaMigrationsTable,
      SchemaMigration,
      $$SchemaMigrationsTableFilterComposer,
      $$SchemaMigrationsTableOrderingComposer,
      $$SchemaMigrationsTableAnnotationComposer,
      $$SchemaMigrationsTableCreateCompanionBuilder,
      $$SchemaMigrationsTableUpdateCompanionBuilder,
      (
        SchemaMigration,
        BaseReferences<
          _$VoxCitaDatabase,
          $SchemaMigrationsTable,
          SchemaMigration
        >,
      ),
      SchemaMigration,
      PrefetchHooks Function()
    >;

class $VoxCitaDatabaseManager {
  final _$VoxCitaDatabase _db;
  $VoxCitaDatabaseManager(this._db);
  $$AudioAssetsTableTableManager get audioAssets =>
      $$AudioAssetsTableTableManager(_db, _db.audioAssets);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$RecordingSessionsTableTableManager get recordingSessions =>
      $$RecordingSessionsTableTableManager(_db, _db.recordingSessions);
  $$TranscriptSegmentsTableTableManager get transcriptSegments =>
      $$TranscriptSegmentsTableTableManager(_db, _db.transcriptSegments);
  $$TranscriptRevisionsTableTableManager get transcriptRevisions =>
      $$TranscriptRevisionsTableTableManager(_db, _db.transcriptRevisions);
  $$InsightClaimsTableTableManager get insightClaims =>
      $$InsightClaimsTableTableManager(_db, _db.insightClaims);
  $$ClaimSourcesTableTableManager get claimSources =>
      $$ClaimSourcesTableTableManager(_db, _db.claimSources);
  $$CollectionsTableTableManager get collections =>
      $$CollectionsTableTableManager(_db, _db.collections);
  $$NoteCollectionsTableTableManager get noteCollections =>
      $$NoteCollectionsTableTableManager(_db, _db.noteCollections);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$NoteTagsTableTableManager get noteTags =>
      $$NoteTagsTableTableManager(_db, _db.noteTags);
  $$ProcessingJobsTableTableManager get processingJobs =>
      $$ProcessingJobsTableTableManager(_db, _db.processingJobs);
  $$ModelRunsTableTableManager get modelRuns =>
      $$ModelRunsTableTableManager(_db, _db.modelRuns);
  $$UserFeedbackTableTableManager get userFeedback =>
      $$UserFeedbackTableTableManager(_db, _db.userFeedback);
  $$AskHistoryTableTableManager get askHistory =>
      $$AskHistoryTableTableManager(_db, _db.askHistory);
  $$SchemaMigrationsTableTableManager get schemaMigrations =>
      $$SchemaMigrationsTableTableManager(_db, _db.schemaMigrations);
}
