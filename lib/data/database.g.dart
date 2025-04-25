// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _businessNameMeta =
      const VerificationMeta('businessName');
  @override
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
      'business_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _siteAddressMeta =
      const VerificationMeta('siteAddress');
  @override
  late final GeneratedColumn<String> siteAddress = GeneratedColumn<String>(
      'site_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _siteCityMeta =
      const VerificationMeta('siteCity');
  @override
  late final GeneratedColumn<String> siteCity = GeneratedColumn<String>(
      'site_city', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _siteProvinceMeta =
      const VerificationMeta('siteProvince');
  @override
  late final GeneratedColumn<String> siteProvince = GeneratedColumn<String>(
      'site_province', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sitePostalCodeMeta =
      const VerificationMeta('sitePostalCode');
  @override
  late final GeneratedColumn<String> sitePostalCode = GeneratedColumn<String>(
      'site_postal_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _billingAddressMeta =
      const VerificationMeta('billingAddress');
  @override
  late final GeneratedColumn<String> billingAddress = GeneratedColumn<String>(
      'billing_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _billingCityMeta =
      const VerificationMeta('billingCity');
  @override
  late final GeneratedColumn<String> billingCity = GeneratedColumn<String>(
      'billing_city', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _billingProvinceMeta =
      const VerificationMeta('billingProvince');
  @override
  late final GeneratedColumn<String> billingProvince = GeneratedColumn<String>(
      'billing_province', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _billingPostalCodeMeta =
      const VerificationMeta('billingPostalCode');
  @override
  late final GeneratedColumn<String> billingPostalCode =
      GeneratedColumn<String>('billing_postal_code', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _gpsLocationMeta =
      const VerificationMeta('gpsLocation');
  @override
  late final GeneratedColumn<String> gpsLocation = GeneratedColumn<String>(
      'gps_location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deactivateMeta =
      const VerificationMeta('deactivate');
  @override
  late final GeneratedColumn<bool> deactivate = GeneratedColumn<bool>(
      'deactivate', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deactivate" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditFlagMeta =
      const VerificationMeta('auditFlag');
  @override
  late final GeneratedColumn<bool> auditFlag = GeneratedColumn<bool>(
      'audit_flag', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("audit_flag" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        businessName,
        siteAddress,
        siteCity,
        siteProvince,
        sitePostalCode,
        billingAddress,
        billingCity,
        billingProvince,
        billingPostalCode,
        gpsLocation,
        notes,
        deactivate,
        synced,
        auditFlag
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<Customer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_name')) {
      context.handle(
          _businessNameMeta,
          businessName.isAcceptableOrUnknown(
              data['business_name']!, _businessNameMeta));
    } else if (isInserting) {
      context.missing(_businessNameMeta);
    }
    if (data.containsKey('site_address')) {
      context.handle(
          _siteAddressMeta,
          siteAddress.isAcceptableOrUnknown(
              data['site_address']!, _siteAddressMeta));
    }
    if (data.containsKey('site_city')) {
      context.handle(_siteCityMeta,
          siteCity.isAcceptableOrUnknown(data['site_city']!, _siteCityMeta));
    }
    if (data.containsKey('site_province')) {
      context.handle(
          _siteProvinceMeta,
          siteProvince.isAcceptableOrUnknown(
              data['site_province']!, _siteProvinceMeta));
    }
    if (data.containsKey('site_postal_code')) {
      context.handle(
          _sitePostalCodeMeta,
          sitePostalCode.isAcceptableOrUnknown(
              data['site_postal_code']!, _sitePostalCodeMeta));
    }
    if (data.containsKey('billing_address')) {
      context.handle(
          _billingAddressMeta,
          billingAddress.isAcceptableOrUnknown(
              data['billing_address']!, _billingAddressMeta));
    }
    if (data.containsKey('billing_city')) {
      context.handle(
          _billingCityMeta,
          billingCity.isAcceptableOrUnknown(
              data['billing_city']!, _billingCityMeta));
    }
    if (data.containsKey('billing_province')) {
      context.handle(
          _billingProvinceMeta,
          billingProvince.isAcceptableOrUnknown(
              data['billing_province']!, _billingProvinceMeta));
    }
    if (data.containsKey('billing_postal_code')) {
      context.handle(
          _billingPostalCodeMeta,
          billingPostalCode.isAcceptableOrUnknown(
              data['billing_postal_code']!, _billingPostalCodeMeta));
    }
    if (data.containsKey('gps_location')) {
      context.handle(
          _gpsLocationMeta,
          gpsLocation.isAcceptableOrUnknown(
              data['gps_location']!, _gpsLocationMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('deactivate')) {
      context.handle(
          _deactivateMeta,
          deactivate.isAcceptableOrUnknown(
              data['deactivate']!, _deactivateMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('audit_flag')) {
      context.handle(_auditFlagMeta,
          auditFlag.isAcceptableOrUnknown(data['audit_flag']!, _auditFlagMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      businessName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}business_name'])!,
      siteAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}site_address']),
      siteCity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}site_city']),
      siteProvince: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}site_province']),
      sitePostalCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}site_postal_code']),
      billingAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}billing_address']),
      billingCity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}billing_city']),
      billingProvince: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}billing_province']),
      billingPostalCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}billing_postal_code']),
      gpsLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gps_location']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      deactivate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deactivate'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      auditFlag: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}audit_flag'])!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String businessName;
  final String? siteAddress;
  final String? siteCity;
  final String? siteProvince;
  final String? sitePostalCode;
  final String? billingAddress;
  final String? billingCity;
  final String? billingProvince;
  final String? billingPostalCode;
  final String? gpsLocation;
  final String? notes;
  final bool deactivate;
  final bool synced;
  final bool auditFlag;
  const Customer(
      {required this.id,
      required this.businessName,
      this.siteAddress,
      this.siteCity,
      this.siteProvince,
      this.sitePostalCode,
      this.billingAddress,
      this.billingCity,
      this.billingProvince,
      this.billingPostalCode,
      this.gpsLocation,
      this.notes,
      required this.deactivate,
      required this.synced,
      required this.auditFlag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['business_name'] = Variable<String>(businessName);
    if (!nullToAbsent || siteAddress != null) {
      map['site_address'] = Variable<String>(siteAddress);
    }
    if (!nullToAbsent || siteCity != null) {
      map['site_city'] = Variable<String>(siteCity);
    }
    if (!nullToAbsent || siteProvince != null) {
      map['site_province'] = Variable<String>(siteProvince);
    }
    if (!nullToAbsent || sitePostalCode != null) {
      map['site_postal_code'] = Variable<String>(sitePostalCode);
    }
    if (!nullToAbsent || billingAddress != null) {
      map['billing_address'] = Variable<String>(billingAddress);
    }
    if (!nullToAbsent || billingCity != null) {
      map['billing_city'] = Variable<String>(billingCity);
    }
    if (!nullToAbsent || billingProvince != null) {
      map['billing_province'] = Variable<String>(billingProvince);
    }
    if (!nullToAbsent || billingPostalCode != null) {
      map['billing_postal_code'] = Variable<String>(billingPostalCode);
    }
    if (!nullToAbsent || gpsLocation != null) {
      map['gps_location'] = Variable<String>(gpsLocation);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['deactivate'] = Variable<bool>(deactivate);
    map['synced'] = Variable<bool>(synced);
    map['audit_flag'] = Variable<bool>(auditFlag);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      businessName: Value(businessName),
      siteAddress: siteAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(siteAddress),
      siteCity: siteCity == null && nullToAbsent
          ? const Value.absent()
          : Value(siteCity),
      siteProvince: siteProvince == null && nullToAbsent
          ? const Value.absent()
          : Value(siteProvince),
      sitePostalCode: sitePostalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(sitePostalCode),
      billingAddress: billingAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(billingAddress),
      billingCity: billingCity == null && nullToAbsent
          ? const Value.absent()
          : Value(billingCity),
      billingProvince: billingProvince == null && nullToAbsent
          ? const Value.absent()
          : Value(billingProvince),
      billingPostalCode: billingPostalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(billingPostalCode),
      gpsLocation: gpsLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(gpsLocation),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      deactivate: Value(deactivate),
      synced: Value(synced),
      auditFlag: Value(auditFlag),
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      businessName: serializer.fromJson<String>(json['businessName']),
      siteAddress: serializer.fromJson<String?>(json['siteAddress']),
      siteCity: serializer.fromJson<String?>(json['siteCity']),
      siteProvince: serializer.fromJson<String?>(json['siteProvince']),
      sitePostalCode: serializer.fromJson<String?>(json['sitePostalCode']),
      billingAddress: serializer.fromJson<String?>(json['billingAddress']),
      billingCity: serializer.fromJson<String?>(json['billingCity']),
      billingProvince: serializer.fromJson<String?>(json['billingProvince']),
      billingPostalCode:
          serializer.fromJson<String?>(json['billingPostalCode']),
      gpsLocation: serializer.fromJson<String?>(json['gpsLocation']),
      notes: serializer.fromJson<String?>(json['notes']),
      deactivate: serializer.fromJson<bool>(json['deactivate']),
      synced: serializer.fromJson<bool>(json['synced']),
      auditFlag: serializer.fromJson<bool>(json['auditFlag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'businessName': serializer.toJson<String>(businessName),
      'siteAddress': serializer.toJson<String?>(siteAddress),
      'siteCity': serializer.toJson<String?>(siteCity),
      'siteProvince': serializer.toJson<String?>(siteProvince),
      'sitePostalCode': serializer.toJson<String?>(sitePostalCode),
      'billingAddress': serializer.toJson<String?>(billingAddress),
      'billingCity': serializer.toJson<String?>(billingCity),
      'billingProvince': serializer.toJson<String?>(billingProvince),
      'billingPostalCode': serializer.toJson<String?>(billingPostalCode),
      'gpsLocation': serializer.toJson<String?>(gpsLocation),
      'notes': serializer.toJson<String?>(notes),
      'deactivate': serializer.toJson<bool>(deactivate),
      'synced': serializer.toJson<bool>(synced),
      'auditFlag': serializer.toJson<bool>(auditFlag),
    };
  }

  Customer copyWith(
          {int? id,
          String? businessName,
          Value<String?> siteAddress = const Value.absent(),
          Value<String?> siteCity = const Value.absent(),
          Value<String?> siteProvince = const Value.absent(),
          Value<String?> sitePostalCode = const Value.absent(),
          Value<String?> billingAddress = const Value.absent(),
          Value<String?> billingCity = const Value.absent(),
          Value<String?> billingProvince = const Value.absent(),
          Value<String?> billingPostalCode = const Value.absent(),
          Value<String?> gpsLocation = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? deactivate,
          bool? synced,
          bool? auditFlag}) =>
      Customer(
        id: id ?? this.id,
        businessName: businessName ?? this.businessName,
        siteAddress: siteAddress.present ? siteAddress.value : this.siteAddress,
        siteCity: siteCity.present ? siteCity.value : this.siteCity,
        siteProvince:
            siteProvince.present ? siteProvince.value : this.siteProvince,
        sitePostalCode:
            sitePostalCode.present ? sitePostalCode.value : this.sitePostalCode,
        billingAddress:
            billingAddress.present ? billingAddress.value : this.billingAddress,
        billingCity: billingCity.present ? billingCity.value : this.billingCity,
        billingProvince: billingProvince.present
            ? billingProvince.value
            : this.billingProvince,
        billingPostalCode: billingPostalCode.present
            ? billingPostalCode.value
            : this.billingPostalCode,
        gpsLocation: gpsLocation.present ? gpsLocation.value : this.gpsLocation,
        notes: notes.present ? notes.value : this.notes,
        deactivate: deactivate ?? this.deactivate,
        synced: synced ?? this.synced,
        auditFlag: auditFlag ?? this.auditFlag,
      );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      businessName: data.businessName.present
          ? data.businessName.value
          : this.businessName,
      siteAddress:
          data.siteAddress.present ? data.siteAddress.value : this.siteAddress,
      siteCity: data.siteCity.present ? data.siteCity.value : this.siteCity,
      siteProvince: data.siteProvince.present
          ? data.siteProvince.value
          : this.siteProvince,
      sitePostalCode: data.sitePostalCode.present
          ? data.sitePostalCode.value
          : this.sitePostalCode,
      billingAddress: data.billingAddress.present
          ? data.billingAddress.value
          : this.billingAddress,
      billingCity:
          data.billingCity.present ? data.billingCity.value : this.billingCity,
      billingProvince: data.billingProvince.present
          ? data.billingProvince.value
          : this.billingProvince,
      billingPostalCode: data.billingPostalCode.present
          ? data.billingPostalCode.value
          : this.billingPostalCode,
      gpsLocation:
          data.gpsLocation.present ? data.gpsLocation.value : this.gpsLocation,
      notes: data.notes.present ? data.notes.value : this.notes,
      deactivate:
          data.deactivate.present ? data.deactivate.value : this.deactivate,
      synced: data.synced.present ? data.synced.value : this.synced,
      auditFlag: data.auditFlag.present ? data.auditFlag.value : this.auditFlag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('businessName: $businessName, ')
          ..write('siteAddress: $siteAddress, ')
          ..write('siteCity: $siteCity, ')
          ..write('siteProvince: $siteProvince, ')
          ..write('sitePostalCode: $sitePostalCode, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('billingCity: $billingCity, ')
          ..write('billingProvince: $billingProvince, ')
          ..write('billingPostalCode: $billingPostalCode, ')
          ..write('gpsLocation: $gpsLocation, ')
          ..write('notes: $notes, ')
          ..write('deactivate: $deactivate, ')
          ..write('synced: $synced, ')
          ..write('auditFlag: $auditFlag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      businessName,
      siteAddress,
      siteCity,
      siteProvince,
      sitePostalCode,
      billingAddress,
      billingCity,
      billingProvince,
      billingPostalCode,
      gpsLocation,
      notes,
      deactivate,
      synced,
      auditFlag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.businessName == this.businessName &&
          other.siteAddress == this.siteAddress &&
          other.siteCity == this.siteCity &&
          other.siteProvince == this.siteProvince &&
          other.sitePostalCode == this.sitePostalCode &&
          other.billingAddress == this.billingAddress &&
          other.billingCity == this.billingCity &&
          other.billingProvince == this.billingProvince &&
          other.billingPostalCode == this.billingPostalCode &&
          other.gpsLocation == this.gpsLocation &&
          other.notes == this.notes &&
          other.deactivate == this.deactivate &&
          other.synced == this.synced &&
          other.auditFlag == this.auditFlag);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> businessName;
  final Value<String?> siteAddress;
  final Value<String?> siteCity;
  final Value<String?> siteProvince;
  final Value<String?> sitePostalCode;
  final Value<String?> billingAddress;
  final Value<String?> billingCity;
  final Value<String?> billingProvince;
  final Value<String?> billingPostalCode;
  final Value<String?> gpsLocation;
  final Value<String?> notes;
  final Value<bool> deactivate;
  final Value<bool> synced;
  final Value<bool> auditFlag;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.businessName = const Value.absent(),
    this.siteAddress = const Value.absent(),
    this.siteCity = const Value.absent(),
    this.siteProvince = const Value.absent(),
    this.sitePostalCode = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.billingCity = const Value.absent(),
    this.billingProvince = const Value.absent(),
    this.billingPostalCode = const Value.absent(),
    this.gpsLocation = const Value.absent(),
    this.notes = const Value.absent(),
    this.deactivate = const Value.absent(),
    this.synced = const Value.absent(),
    this.auditFlag = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String businessName,
    this.siteAddress = const Value.absent(),
    this.siteCity = const Value.absent(),
    this.siteProvince = const Value.absent(),
    this.sitePostalCode = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.billingCity = const Value.absent(),
    this.billingProvince = const Value.absent(),
    this.billingPostalCode = const Value.absent(),
    this.gpsLocation = const Value.absent(),
    this.notes = const Value.absent(),
    this.deactivate = const Value.absent(),
    this.synced = const Value.absent(),
    this.auditFlag = const Value.absent(),
  }) : businessName = Value(businessName);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? businessName,
    Expression<String>? siteAddress,
    Expression<String>? siteCity,
    Expression<String>? siteProvince,
    Expression<String>? sitePostalCode,
    Expression<String>? billingAddress,
    Expression<String>? billingCity,
    Expression<String>? billingProvince,
    Expression<String>? billingPostalCode,
    Expression<String>? gpsLocation,
    Expression<String>? notes,
    Expression<bool>? deactivate,
    Expression<bool>? synced,
    Expression<bool>? auditFlag,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessName != null) 'business_name': businessName,
      if (siteAddress != null) 'site_address': siteAddress,
      if (siteCity != null) 'site_city': siteCity,
      if (siteProvince != null) 'site_province': siteProvince,
      if (sitePostalCode != null) 'site_postal_code': sitePostalCode,
      if (billingAddress != null) 'billing_address': billingAddress,
      if (billingCity != null) 'billing_city': billingCity,
      if (billingProvince != null) 'billing_province': billingProvince,
      if (billingPostalCode != null) 'billing_postal_code': billingPostalCode,
      if (gpsLocation != null) 'gps_location': gpsLocation,
      if (notes != null) 'notes': notes,
      if (deactivate != null) 'deactivate': deactivate,
      if (synced != null) 'synced': synced,
      if (auditFlag != null) 'audit_flag': auditFlag,
    });
  }

  CustomersCompanion copyWith(
      {Value<int>? id,
      Value<String>? businessName,
      Value<String?>? siteAddress,
      Value<String?>? siteCity,
      Value<String?>? siteProvince,
      Value<String?>? sitePostalCode,
      Value<String?>? billingAddress,
      Value<String?>? billingCity,
      Value<String?>? billingProvince,
      Value<String?>? billingPostalCode,
      Value<String?>? gpsLocation,
      Value<String?>? notes,
      Value<bool>? deactivate,
      Value<bool>? synced,
      Value<bool>? auditFlag}) {
    return CustomersCompanion(
      id: id ?? this.id,
      businessName: businessName ?? this.businessName,
      siteAddress: siteAddress ?? this.siteAddress,
      siteCity: siteCity ?? this.siteCity,
      siteProvince: siteProvince ?? this.siteProvince,
      sitePostalCode: sitePostalCode ?? this.sitePostalCode,
      billingAddress: billingAddress ?? this.billingAddress,
      billingCity: billingCity ?? this.billingCity,
      billingProvince: billingProvince ?? this.billingProvince,
      billingPostalCode: billingPostalCode ?? this.billingPostalCode,
      gpsLocation: gpsLocation ?? this.gpsLocation,
      notes: notes ?? this.notes,
      deactivate: deactivate ?? this.deactivate,
      synced: synced ?? this.synced,
      auditFlag: auditFlag ?? this.auditFlag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (businessName.present) {
      map['business_name'] = Variable<String>(businessName.value);
    }
    if (siteAddress.present) {
      map['site_address'] = Variable<String>(siteAddress.value);
    }
    if (siteCity.present) {
      map['site_city'] = Variable<String>(siteCity.value);
    }
    if (siteProvince.present) {
      map['site_province'] = Variable<String>(siteProvince.value);
    }
    if (sitePostalCode.present) {
      map['site_postal_code'] = Variable<String>(sitePostalCode.value);
    }
    if (billingAddress.present) {
      map['billing_address'] = Variable<String>(billingAddress.value);
    }
    if (billingCity.present) {
      map['billing_city'] = Variable<String>(billingCity.value);
    }
    if (billingProvince.present) {
      map['billing_province'] = Variable<String>(billingProvince.value);
    }
    if (billingPostalCode.present) {
      map['billing_postal_code'] = Variable<String>(billingPostalCode.value);
    }
    if (gpsLocation.present) {
      map['gps_location'] = Variable<String>(gpsLocation.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (deactivate.present) {
      map['deactivate'] = Variable<bool>(deactivate.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (auditFlag.present) {
      map['audit_flag'] = Variable<bool>(auditFlag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('businessName: $businessName, ')
          ..write('siteAddress: $siteAddress, ')
          ..write('siteCity: $siteCity, ')
          ..write('siteProvince: $siteProvince, ')
          ..write('sitePostalCode: $sitePostalCode, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('billingCity: $billingCity, ')
          ..write('billingProvince: $billingProvince, ')
          ..write('billingPostalCode: $billingPostalCode, ')
          ..write('gpsLocation: $gpsLocation, ')
          ..write('notes: $notes, ')
          ..write('deactivate: $deactivate, ')
          ..write('synced: $synced, ')
          ..write('auditFlag: $auditFlag')
          ..write(')'))
        .toString();
  }
}

class $ContactsTable extends Contacts with TableInfo<$ContactsTable, Contact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES customers (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isMainMeta = const VerificationMeta('isMain');
  @override
  late final GeneratedColumn<bool> isMain = GeneratedColumn<bool>(
      'is_main', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_main" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deactivateMeta =
      const VerificationMeta('deactivate');
  @override
  late final GeneratedColumn<bool> deactivate = GeneratedColumn<bool>(
      'deactivate', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deactivate" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditFlagMeta =
      const VerificationMeta('auditFlag');
  @override
  late final GeneratedColumn<bool> auditFlag = GeneratedColumn<bool>(
      'audit_flag', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("audit_flag" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        customerId,
        name,
        phone,
        email,
        notes,
        isMain,
        deactivate,
        synced,
        auditFlag
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contacts';
  @override
  VerificationContext validateIntegrity(Insertable<Contact> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_main')) {
      context.handle(_isMainMeta,
          isMain.isAcceptableOrUnknown(data['is_main']!, _isMainMeta));
    }
    if (data.containsKey('deactivate')) {
      context.handle(
          _deactivateMeta,
          deactivate.isAcceptableOrUnknown(
              data['deactivate']!, _deactivateMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('audit_flag')) {
      context.handle(_auditFlagMeta,
          auditFlag.isAcceptableOrUnknown(data['audit_flag']!, _auditFlagMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Contact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Contact(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isMain: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_main'])!,
      deactivate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deactivate'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      auditFlag: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}audit_flag'])!,
    );
  }

  @override
  $ContactsTable createAlias(String alias) {
    return $ContactsTable(attachedDatabase, alias);
  }
}

class Contact extends DataClass implements Insertable<Contact> {
  final int id;
  final int customerId;
  final String name;
  final String? phone;
  final String? email;
  final String? notes;
  final bool isMain;
  final bool deactivate;
  final bool synced;
  final bool auditFlag;
  const Contact(
      {required this.id,
      required this.customerId,
      required this.name,
      this.phone,
      this.email,
      this.notes,
      required this.isMain,
      required this.deactivate,
      required this.synced,
      required this.auditFlag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_id'] = Variable<int>(customerId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_main'] = Variable<bool>(isMain);
    map['deactivate'] = Variable<bool>(deactivate);
    map['synced'] = Variable<bool>(synced);
    map['audit_flag'] = Variable<bool>(auditFlag);
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      id: Value(id),
      customerId: Value(customerId),
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isMain: Value(isMain),
      deactivate: Value(deactivate),
      synced: Value(synced),
      auditFlag: Value(auditFlag),
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Contact(
      id: serializer.fromJson<int>(json['id']),
      customerId: serializer.fromJson<int>(json['customerId']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      notes: serializer.fromJson<String?>(json['notes']),
      isMain: serializer.fromJson<bool>(json['isMain']),
      deactivate: serializer.fromJson<bool>(json['deactivate']),
      synced: serializer.fromJson<bool>(json['synced']),
      auditFlag: serializer.fromJson<bool>(json['auditFlag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerId': serializer.toJson<int>(customerId),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'notes': serializer.toJson<String?>(notes),
      'isMain': serializer.toJson<bool>(isMain),
      'deactivate': serializer.toJson<bool>(deactivate),
      'synced': serializer.toJson<bool>(synced),
      'auditFlag': serializer.toJson<bool>(auditFlag),
    };
  }

  Contact copyWith(
          {int? id,
          int? customerId,
          String? name,
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? isMain,
          bool? deactivate,
          bool? synced,
          bool? auditFlag}) =>
      Contact(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        notes: notes.present ? notes.value : this.notes,
        isMain: isMain ?? this.isMain,
        deactivate: deactivate ?? this.deactivate,
        synced: synced ?? this.synced,
        auditFlag: auditFlag ?? this.auditFlag,
      );
  Contact copyWithCompanion(ContactsCompanion data) {
    return Contact(
      id: data.id.present ? data.id.value : this.id,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      notes: data.notes.present ? data.notes.value : this.notes,
      isMain: data.isMain.present ? data.isMain.value : this.isMain,
      deactivate:
          data.deactivate.present ? data.deactivate.value : this.deactivate,
      synced: data.synced.present ? data.synced.value : this.synced,
      auditFlag: data.auditFlag.present ? data.auditFlag.value : this.auditFlag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Contact(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('notes: $notes, ')
          ..write('isMain: $isMain, ')
          ..write('deactivate: $deactivate, ')
          ..write('synced: $synced, ')
          ..write('auditFlag: $auditFlag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, customerId, name, phone, email, notes,
      isMain, deactivate, synced, auditFlag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Contact &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.notes == this.notes &&
          other.isMain == this.isMain &&
          other.deactivate == this.deactivate &&
          other.synced == this.synced &&
          other.auditFlag == this.auditFlag);
}

class ContactsCompanion extends UpdateCompanion<Contact> {
  final Value<int> id;
  final Value<int> customerId;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> notes;
  final Value<bool> isMain;
  final Value<bool> deactivate;
  final Value<bool> synced;
  final Value<bool> auditFlag;
  const ContactsCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.notes = const Value.absent(),
    this.isMain = const Value.absent(),
    this.deactivate = const Value.absent(),
    this.synced = const Value.absent(),
    this.auditFlag = const Value.absent(),
  });
  ContactsCompanion.insert({
    this.id = const Value.absent(),
    required int customerId,
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.notes = const Value.absent(),
    this.isMain = const Value.absent(),
    this.deactivate = const Value.absent(),
    this.synced = const Value.absent(),
    this.auditFlag = const Value.absent(),
  })  : customerId = Value(customerId),
        name = Value(name);
  static Insertable<Contact> custom({
    Expression<int>? id,
    Expression<int>? customerId,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? notes,
    Expression<bool>? isMain,
    Expression<bool>? deactivate,
    Expression<bool>? synced,
    Expression<bool>? auditFlag,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (notes != null) 'notes': notes,
      if (isMain != null) 'is_main': isMain,
      if (deactivate != null) 'deactivate': deactivate,
      if (synced != null) 'synced': synced,
      if (auditFlag != null) 'audit_flag': auditFlag,
    });
  }

  ContactsCompanion copyWith(
      {Value<int>? id,
      Value<int>? customerId,
      Value<String>? name,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? notes,
      Value<bool>? isMain,
      Value<bool>? deactivate,
      Value<bool>? synced,
      Value<bool>? auditFlag}) {
    return ContactsCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      notes: notes ?? this.notes,
      isMain: isMain ?? this.isMain,
      deactivate: deactivate ?? this.deactivate,
      synced: synced ?? this.synced,
      auditFlag: auditFlag ?? this.auditFlag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isMain.present) {
      map['is_main'] = Variable<bool>(isMain.value);
    }
    if (deactivate.present) {
      map['deactivate'] = Variable<bool>(deactivate.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (auditFlag.present) {
      map['audit_flag'] = Variable<bool>(auditFlag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactsCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('notes: $notes, ')
          ..write('isMain: $isMain, ')
          ..write('deactivate: $deactivate, ')
          ..write('synced: $synced, ')
          ..write('auditFlag: $auditFlag')
          ..write(')'))
        .toString();
  }
}

class $WorkOrdersTable extends WorkOrders
    with TableInfo<$WorkOrdersTable, WorkOrder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkOrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _workOrderNumberMeta =
      const VerificationMeta('workOrderNumber');
  @override
  late final GeneratedColumn<String> workOrderNumber = GeneratedColumn<String>(
      'work_order_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _siteAddressMeta =
      const VerificationMeta('siteAddress');
  @override
  late final GeneratedColumn<String> siteAddress = GeneratedColumn<String>(
      'site_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _siteCityMeta =
      const VerificationMeta('siteCity');
  @override
  late final GeneratedColumn<String> siteCity = GeneratedColumn<String>(
      'site_city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _siteProvinceMeta =
      const VerificationMeta('siteProvince');
  @override
  late final GeneratedColumn<String> siteProvince = GeneratedColumn<String>(
      'site_province', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sitePostalCodeMeta =
      const VerificationMeta('sitePostalCode');
  @override
  late final GeneratedColumn<String> sitePostalCode = GeneratedColumn<String>(
      'site_postal_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _billingAddressMeta =
      const VerificationMeta('billingAddress');
  @override
  late final GeneratedColumn<String> billingAddress = GeneratedColumn<String>(
      'billing_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _billingCityMeta =
      const VerificationMeta('billingCity');
  @override
  late final GeneratedColumn<String> billingCity = GeneratedColumn<String>(
      'billing_city', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _billingProvinceMeta =
      const VerificationMeta('billingProvince');
  @override
  late final GeneratedColumn<String> billingProvince = GeneratedColumn<String>(
      'billing_province', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _billingPostalCodeMeta =
      const VerificationMeta('billingPostalCode');
  @override
  late final GeneratedColumn<String> billingPostalCode =
      GeneratedColumn<String>('billing_postal_code', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _gpsLocationMeta =
      const VerificationMeta('gpsLocation');
  @override
  late final GeneratedColumn<String> gpsLocation = GeneratedColumn<String>(
      'gps_location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _customerNotesMeta =
      const VerificationMeta('customerNotes');
  @override
  late final GeneratedColumn<String> customerNotes = GeneratedColumn<String>(
      'customer_notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _auditFlagMeta =
      const VerificationMeta('auditFlag');
  @override
  late final GeneratedColumn<bool> auditFlag = GeneratedColumn<bool>(
      'audit_flag', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("audit_flag" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lastModifiedMeta =
      const VerificationMeta('lastModified');
  @override
  late final GeneratedColumn<DateTime> lastModified = GeneratedColumn<DateTime>(
      'last_modified', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        customerId,
        workOrderNumber,
        siteAddress,
        siteCity,
        siteProvince,
        sitePostalCode,
        billingAddress,
        billingCity,
        billingProvince,
        billingPostalCode,
        gpsLocation,
        customerNotes,
        auditFlag,
        synced,
        lastModified
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_orders';
  @override
  VerificationContext validateIntegrity(Insertable<WorkOrder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('work_order_number')) {
      context.handle(
          _workOrderNumberMeta,
          workOrderNumber.isAcceptableOrUnknown(
              data['work_order_number']!, _workOrderNumberMeta));
    } else if (isInserting) {
      context.missing(_workOrderNumberMeta);
    }
    if (data.containsKey('site_address')) {
      context.handle(
          _siteAddressMeta,
          siteAddress.isAcceptableOrUnknown(
              data['site_address']!, _siteAddressMeta));
    } else if (isInserting) {
      context.missing(_siteAddressMeta);
    }
    if (data.containsKey('site_city')) {
      context.handle(_siteCityMeta,
          siteCity.isAcceptableOrUnknown(data['site_city']!, _siteCityMeta));
    } else if (isInserting) {
      context.missing(_siteCityMeta);
    }
    if (data.containsKey('site_province')) {
      context.handle(
          _siteProvinceMeta,
          siteProvince.isAcceptableOrUnknown(
              data['site_province']!, _siteProvinceMeta));
    } else if (isInserting) {
      context.missing(_siteProvinceMeta);
    }
    if (data.containsKey('site_postal_code')) {
      context.handle(
          _sitePostalCodeMeta,
          sitePostalCode.isAcceptableOrUnknown(
              data['site_postal_code']!, _sitePostalCodeMeta));
    } else if (isInserting) {
      context.missing(_sitePostalCodeMeta);
    }
    if (data.containsKey('billing_address')) {
      context.handle(
          _billingAddressMeta,
          billingAddress.isAcceptableOrUnknown(
              data['billing_address']!, _billingAddressMeta));
    }
    if (data.containsKey('billing_city')) {
      context.handle(
          _billingCityMeta,
          billingCity.isAcceptableOrUnknown(
              data['billing_city']!, _billingCityMeta));
    }
    if (data.containsKey('billing_province')) {
      context.handle(
          _billingProvinceMeta,
          billingProvince.isAcceptableOrUnknown(
              data['billing_province']!, _billingProvinceMeta));
    }
    if (data.containsKey('billing_postal_code')) {
      context.handle(
          _billingPostalCodeMeta,
          billingPostalCode.isAcceptableOrUnknown(
              data['billing_postal_code']!, _billingPostalCodeMeta));
    }
    if (data.containsKey('gps_location')) {
      context.handle(
          _gpsLocationMeta,
          gpsLocation.isAcceptableOrUnknown(
              data['gps_location']!, _gpsLocationMeta));
    } else if (isInserting) {
      context.missing(_gpsLocationMeta);
    }
    if (data.containsKey('customer_notes')) {
      context.handle(
          _customerNotesMeta,
          customerNotes.isAcceptableOrUnknown(
              data['customer_notes']!, _customerNotesMeta));
    }
    if (data.containsKey('audit_flag')) {
      context.handle(_auditFlagMeta,
          auditFlag.isAcceptableOrUnknown(data['audit_flag']!, _auditFlagMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('last_modified')) {
      context.handle(
          _lastModifiedMeta,
          lastModified.isAcceptableOrUnknown(
              data['last_modified']!, _lastModifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkOrder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id'])!,
      workOrderNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}work_order_number'])!,
      siteAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}site_address'])!,
      siteCity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}site_city'])!,
      siteProvince: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}site_province'])!,
      sitePostalCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}site_postal_code'])!,
      billingAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}billing_address']),
      billingCity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}billing_city']),
      billingProvince: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}billing_province']),
      billingPostalCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}billing_postal_code']),
      gpsLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gps_location'])!,
      customerNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_notes'])!,
      auditFlag: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}audit_flag'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      lastModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_modified'])!,
    );
  }

  @override
  $WorkOrdersTable createAlias(String alias) {
    return $WorkOrdersTable(attachedDatabase, alias);
  }
}

class WorkOrder extends DataClass implements Insertable<WorkOrder> {
  final int id;
  final int customerId;
  final String workOrderNumber;
  final String siteAddress;
  final String siteCity;
  final String siteProvince;
  final String sitePostalCode;
  final String? billingAddress;
  final String? billingCity;
  final String? billingProvince;
  final String? billingPostalCode;
  final String gpsLocation;
  final String customerNotes;
  final bool auditFlag;
  final bool synced;
  final DateTime lastModified;
  const WorkOrder(
      {required this.id,
      required this.customerId,
      required this.workOrderNumber,
      required this.siteAddress,
      required this.siteCity,
      required this.siteProvince,
      required this.sitePostalCode,
      this.billingAddress,
      this.billingCity,
      this.billingProvince,
      this.billingPostalCode,
      required this.gpsLocation,
      required this.customerNotes,
      required this.auditFlag,
      required this.synced,
      required this.lastModified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_id'] = Variable<int>(customerId);
    map['work_order_number'] = Variable<String>(workOrderNumber);
    map['site_address'] = Variable<String>(siteAddress);
    map['site_city'] = Variable<String>(siteCity);
    map['site_province'] = Variable<String>(siteProvince);
    map['site_postal_code'] = Variable<String>(sitePostalCode);
    if (!nullToAbsent || billingAddress != null) {
      map['billing_address'] = Variable<String>(billingAddress);
    }
    if (!nullToAbsent || billingCity != null) {
      map['billing_city'] = Variable<String>(billingCity);
    }
    if (!nullToAbsent || billingProvince != null) {
      map['billing_province'] = Variable<String>(billingProvince);
    }
    if (!nullToAbsent || billingPostalCode != null) {
      map['billing_postal_code'] = Variable<String>(billingPostalCode);
    }
    map['gps_location'] = Variable<String>(gpsLocation);
    map['customer_notes'] = Variable<String>(customerNotes);
    map['audit_flag'] = Variable<bool>(auditFlag);
    map['synced'] = Variable<bool>(synced);
    map['last_modified'] = Variable<DateTime>(lastModified);
    return map;
  }

  WorkOrdersCompanion toCompanion(bool nullToAbsent) {
    return WorkOrdersCompanion(
      id: Value(id),
      customerId: Value(customerId),
      workOrderNumber: Value(workOrderNumber),
      siteAddress: Value(siteAddress),
      siteCity: Value(siteCity),
      siteProvince: Value(siteProvince),
      sitePostalCode: Value(sitePostalCode),
      billingAddress: billingAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(billingAddress),
      billingCity: billingCity == null && nullToAbsent
          ? const Value.absent()
          : Value(billingCity),
      billingProvince: billingProvince == null && nullToAbsent
          ? const Value.absent()
          : Value(billingProvince),
      billingPostalCode: billingPostalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(billingPostalCode),
      gpsLocation: Value(gpsLocation),
      customerNotes: Value(customerNotes),
      auditFlag: Value(auditFlag),
      synced: Value(synced),
      lastModified: Value(lastModified),
    );
  }

  factory WorkOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkOrder(
      id: serializer.fromJson<int>(json['id']),
      customerId: serializer.fromJson<int>(json['customerId']),
      workOrderNumber: serializer.fromJson<String>(json['workOrderNumber']),
      siteAddress: serializer.fromJson<String>(json['siteAddress']),
      siteCity: serializer.fromJson<String>(json['siteCity']),
      siteProvince: serializer.fromJson<String>(json['siteProvince']),
      sitePostalCode: serializer.fromJson<String>(json['sitePostalCode']),
      billingAddress: serializer.fromJson<String?>(json['billingAddress']),
      billingCity: serializer.fromJson<String?>(json['billingCity']),
      billingProvince: serializer.fromJson<String?>(json['billingProvince']),
      billingPostalCode:
          serializer.fromJson<String?>(json['billingPostalCode']),
      gpsLocation: serializer.fromJson<String>(json['gpsLocation']),
      customerNotes: serializer.fromJson<String>(json['customerNotes']),
      auditFlag: serializer.fromJson<bool>(json['auditFlag']),
      synced: serializer.fromJson<bool>(json['synced']),
      lastModified: serializer.fromJson<DateTime>(json['lastModified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerId': serializer.toJson<int>(customerId),
      'workOrderNumber': serializer.toJson<String>(workOrderNumber),
      'siteAddress': serializer.toJson<String>(siteAddress),
      'siteCity': serializer.toJson<String>(siteCity),
      'siteProvince': serializer.toJson<String>(siteProvince),
      'sitePostalCode': serializer.toJson<String>(sitePostalCode),
      'billingAddress': serializer.toJson<String?>(billingAddress),
      'billingCity': serializer.toJson<String?>(billingCity),
      'billingProvince': serializer.toJson<String?>(billingProvince),
      'billingPostalCode': serializer.toJson<String?>(billingPostalCode),
      'gpsLocation': serializer.toJson<String>(gpsLocation),
      'customerNotes': serializer.toJson<String>(customerNotes),
      'auditFlag': serializer.toJson<bool>(auditFlag),
      'synced': serializer.toJson<bool>(synced),
      'lastModified': serializer.toJson<DateTime>(lastModified),
    };
  }

  WorkOrder copyWith(
          {int? id,
          int? customerId,
          String? workOrderNumber,
          String? siteAddress,
          String? siteCity,
          String? siteProvince,
          String? sitePostalCode,
          Value<String?> billingAddress = const Value.absent(),
          Value<String?> billingCity = const Value.absent(),
          Value<String?> billingProvince = const Value.absent(),
          Value<String?> billingPostalCode = const Value.absent(),
          String? gpsLocation,
          String? customerNotes,
          bool? auditFlag,
          bool? synced,
          DateTime? lastModified}) =>
      WorkOrder(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        workOrderNumber: workOrderNumber ?? this.workOrderNumber,
        siteAddress: siteAddress ?? this.siteAddress,
        siteCity: siteCity ?? this.siteCity,
        siteProvince: siteProvince ?? this.siteProvince,
        sitePostalCode: sitePostalCode ?? this.sitePostalCode,
        billingAddress:
            billingAddress.present ? billingAddress.value : this.billingAddress,
        billingCity: billingCity.present ? billingCity.value : this.billingCity,
        billingProvince: billingProvince.present
            ? billingProvince.value
            : this.billingProvince,
        billingPostalCode: billingPostalCode.present
            ? billingPostalCode.value
            : this.billingPostalCode,
        gpsLocation: gpsLocation ?? this.gpsLocation,
        customerNotes: customerNotes ?? this.customerNotes,
        auditFlag: auditFlag ?? this.auditFlag,
        synced: synced ?? this.synced,
        lastModified: lastModified ?? this.lastModified,
      );
  WorkOrder copyWithCompanion(WorkOrdersCompanion data) {
    return WorkOrder(
      id: data.id.present ? data.id.value : this.id,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      workOrderNumber: data.workOrderNumber.present
          ? data.workOrderNumber.value
          : this.workOrderNumber,
      siteAddress:
          data.siteAddress.present ? data.siteAddress.value : this.siteAddress,
      siteCity: data.siteCity.present ? data.siteCity.value : this.siteCity,
      siteProvince: data.siteProvince.present
          ? data.siteProvince.value
          : this.siteProvince,
      sitePostalCode: data.sitePostalCode.present
          ? data.sitePostalCode.value
          : this.sitePostalCode,
      billingAddress: data.billingAddress.present
          ? data.billingAddress.value
          : this.billingAddress,
      billingCity:
          data.billingCity.present ? data.billingCity.value : this.billingCity,
      billingProvince: data.billingProvince.present
          ? data.billingProvince.value
          : this.billingProvince,
      billingPostalCode: data.billingPostalCode.present
          ? data.billingPostalCode.value
          : this.billingPostalCode,
      gpsLocation:
          data.gpsLocation.present ? data.gpsLocation.value : this.gpsLocation,
      customerNotes: data.customerNotes.present
          ? data.customerNotes.value
          : this.customerNotes,
      auditFlag: data.auditFlag.present ? data.auditFlag.value : this.auditFlag,
      synced: data.synced.present ? data.synced.value : this.synced,
      lastModified: data.lastModified.present
          ? data.lastModified.value
          : this.lastModified,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkOrder(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('workOrderNumber: $workOrderNumber, ')
          ..write('siteAddress: $siteAddress, ')
          ..write('siteCity: $siteCity, ')
          ..write('siteProvince: $siteProvince, ')
          ..write('sitePostalCode: $sitePostalCode, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('billingCity: $billingCity, ')
          ..write('billingProvince: $billingProvince, ')
          ..write('billingPostalCode: $billingPostalCode, ')
          ..write('gpsLocation: $gpsLocation, ')
          ..write('customerNotes: $customerNotes, ')
          ..write('auditFlag: $auditFlag, ')
          ..write('synced: $synced, ')
          ..write('lastModified: $lastModified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      customerId,
      workOrderNumber,
      siteAddress,
      siteCity,
      siteProvince,
      sitePostalCode,
      billingAddress,
      billingCity,
      billingProvince,
      billingPostalCode,
      gpsLocation,
      customerNotes,
      auditFlag,
      synced,
      lastModified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkOrder &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.workOrderNumber == this.workOrderNumber &&
          other.siteAddress == this.siteAddress &&
          other.siteCity == this.siteCity &&
          other.siteProvince == this.siteProvince &&
          other.sitePostalCode == this.sitePostalCode &&
          other.billingAddress == this.billingAddress &&
          other.billingCity == this.billingCity &&
          other.billingProvince == this.billingProvince &&
          other.billingPostalCode == this.billingPostalCode &&
          other.gpsLocation == this.gpsLocation &&
          other.customerNotes == this.customerNotes &&
          other.auditFlag == this.auditFlag &&
          other.synced == this.synced &&
          other.lastModified == this.lastModified);
}

class WorkOrdersCompanion extends UpdateCompanion<WorkOrder> {
  final Value<int> id;
  final Value<int> customerId;
  final Value<String> workOrderNumber;
  final Value<String> siteAddress;
  final Value<String> siteCity;
  final Value<String> siteProvince;
  final Value<String> sitePostalCode;
  final Value<String?> billingAddress;
  final Value<String?> billingCity;
  final Value<String?> billingProvince;
  final Value<String?> billingPostalCode;
  final Value<String> gpsLocation;
  final Value<String> customerNotes;
  final Value<bool> auditFlag;
  final Value<bool> synced;
  final Value<DateTime> lastModified;
  const WorkOrdersCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.workOrderNumber = const Value.absent(),
    this.siteAddress = const Value.absent(),
    this.siteCity = const Value.absent(),
    this.siteProvince = const Value.absent(),
    this.sitePostalCode = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.billingCity = const Value.absent(),
    this.billingProvince = const Value.absent(),
    this.billingPostalCode = const Value.absent(),
    this.gpsLocation = const Value.absent(),
    this.customerNotes = const Value.absent(),
    this.auditFlag = const Value.absent(),
    this.synced = const Value.absent(),
    this.lastModified = const Value.absent(),
  });
  WorkOrdersCompanion.insert({
    this.id = const Value.absent(),
    required int customerId,
    required String workOrderNumber,
    required String siteAddress,
    required String siteCity,
    required String siteProvince,
    required String sitePostalCode,
    this.billingAddress = const Value.absent(),
    this.billingCity = const Value.absent(),
    this.billingProvince = const Value.absent(),
    this.billingPostalCode = const Value.absent(),
    required String gpsLocation,
    this.customerNotes = const Value.absent(),
    this.auditFlag = const Value.absent(),
    this.synced = const Value.absent(),
    this.lastModified = const Value.absent(),
  })  : customerId = Value(customerId),
        workOrderNumber = Value(workOrderNumber),
        siteAddress = Value(siteAddress),
        siteCity = Value(siteCity),
        siteProvince = Value(siteProvince),
        sitePostalCode = Value(sitePostalCode),
        gpsLocation = Value(gpsLocation);
  static Insertable<WorkOrder> custom({
    Expression<int>? id,
    Expression<int>? customerId,
    Expression<String>? workOrderNumber,
    Expression<String>? siteAddress,
    Expression<String>? siteCity,
    Expression<String>? siteProvince,
    Expression<String>? sitePostalCode,
    Expression<String>? billingAddress,
    Expression<String>? billingCity,
    Expression<String>? billingProvince,
    Expression<String>? billingPostalCode,
    Expression<String>? gpsLocation,
    Expression<String>? customerNotes,
    Expression<bool>? auditFlag,
    Expression<bool>? synced,
    Expression<DateTime>? lastModified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (workOrderNumber != null) 'work_order_number': workOrderNumber,
      if (siteAddress != null) 'site_address': siteAddress,
      if (siteCity != null) 'site_city': siteCity,
      if (siteProvince != null) 'site_province': siteProvince,
      if (sitePostalCode != null) 'site_postal_code': sitePostalCode,
      if (billingAddress != null) 'billing_address': billingAddress,
      if (billingCity != null) 'billing_city': billingCity,
      if (billingProvince != null) 'billing_province': billingProvince,
      if (billingPostalCode != null) 'billing_postal_code': billingPostalCode,
      if (gpsLocation != null) 'gps_location': gpsLocation,
      if (customerNotes != null) 'customer_notes': customerNotes,
      if (auditFlag != null) 'audit_flag': auditFlag,
      if (synced != null) 'synced': synced,
      if (lastModified != null) 'last_modified': lastModified,
    });
  }

  WorkOrdersCompanion copyWith(
      {Value<int>? id,
      Value<int>? customerId,
      Value<String>? workOrderNumber,
      Value<String>? siteAddress,
      Value<String>? siteCity,
      Value<String>? siteProvince,
      Value<String>? sitePostalCode,
      Value<String?>? billingAddress,
      Value<String?>? billingCity,
      Value<String?>? billingProvince,
      Value<String?>? billingPostalCode,
      Value<String>? gpsLocation,
      Value<String>? customerNotes,
      Value<bool>? auditFlag,
      Value<bool>? synced,
      Value<DateTime>? lastModified}) {
    return WorkOrdersCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      workOrderNumber: workOrderNumber ?? this.workOrderNumber,
      siteAddress: siteAddress ?? this.siteAddress,
      siteCity: siteCity ?? this.siteCity,
      siteProvince: siteProvince ?? this.siteProvince,
      sitePostalCode: sitePostalCode ?? this.sitePostalCode,
      billingAddress: billingAddress ?? this.billingAddress,
      billingCity: billingCity ?? this.billingCity,
      billingProvince: billingProvince ?? this.billingProvince,
      billingPostalCode: billingPostalCode ?? this.billingPostalCode,
      gpsLocation: gpsLocation ?? this.gpsLocation,
      customerNotes: customerNotes ?? this.customerNotes,
      auditFlag: auditFlag ?? this.auditFlag,
      synced: synced ?? this.synced,
      lastModified: lastModified ?? this.lastModified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (workOrderNumber.present) {
      map['work_order_number'] = Variable<String>(workOrderNumber.value);
    }
    if (siteAddress.present) {
      map['site_address'] = Variable<String>(siteAddress.value);
    }
    if (siteCity.present) {
      map['site_city'] = Variable<String>(siteCity.value);
    }
    if (siteProvince.present) {
      map['site_province'] = Variable<String>(siteProvince.value);
    }
    if (sitePostalCode.present) {
      map['site_postal_code'] = Variable<String>(sitePostalCode.value);
    }
    if (billingAddress.present) {
      map['billing_address'] = Variable<String>(billingAddress.value);
    }
    if (billingCity.present) {
      map['billing_city'] = Variable<String>(billingCity.value);
    }
    if (billingProvince.present) {
      map['billing_province'] = Variable<String>(billingProvince.value);
    }
    if (billingPostalCode.present) {
      map['billing_postal_code'] = Variable<String>(billingPostalCode.value);
    }
    if (gpsLocation.present) {
      map['gps_location'] = Variable<String>(gpsLocation.value);
    }
    if (customerNotes.present) {
      map['customer_notes'] = Variable<String>(customerNotes.value);
    }
    if (auditFlag.present) {
      map['audit_flag'] = Variable<bool>(auditFlag.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<DateTime>(lastModified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkOrdersCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('workOrderNumber: $workOrderNumber, ')
          ..write('siteAddress: $siteAddress, ')
          ..write('siteCity: $siteCity, ')
          ..write('siteProvince: $siteProvince, ')
          ..write('sitePostalCode: $sitePostalCode, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('billingCity: $billingCity, ')
          ..write('billingProvince: $billingProvince, ')
          ..write('billingPostalCode: $billingPostalCode, ')
          ..write('gpsLocation: $gpsLocation, ')
          ..write('customerNotes: $customerNotes, ')
          ..write('auditFlag: $auditFlag, ')
          ..write('synced: $synced, ')
          ..write('lastModified: $lastModified')
          ..write(')'))
        .toString();
  }
}

class $ScalesTable extends Scales with TableInfo<$ScalesTable, Scale> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES customers (id)'));
  static const VerificationMeta _configurationMeta =
      const VerificationMeta('configuration');
  @override
  late final GeneratedColumn<bool> configuration = GeneratedColumn<bool>(
      'configuration', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("configuration" IN (0, 1))'));
  static const VerificationMeta _scaleTypeMeta =
      const VerificationMeta('scaleType');
  @override
  late final GeneratedColumn<String> scaleType = GeneratedColumn<String>(
      'scale_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _indicatorMakeMeta =
      const VerificationMeta('indicatorMake');
  @override
  late final GeneratedColumn<String> indicatorMake = GeneratedColumn<String>(
      'indicator_make', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _indicatorModelMeta =
      const VerificationMeta('indicatorModel');
  @override
  late final GeneratedColumn<String> indicatorModel = GeneratedColumn<String>(
      'indicator_model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _indicatorSerialMeta =
      const VerificationMeta('indicatorSerial');
  @override
  late final GeneratedColumn<String> indicatorSerial = GeneratedColumn<String>(
      'indicator_serial', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _approvalPrefixMeta =
      const VerificationMeta('approvalPrefix');
  @override
  late final GeneratedColumn<String> approvalPrefix = GeneratedColumn<String>(
      'approval_prefix', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _approvalNumberMeta =
      const VerificationMeta('approvalNumber');
  @override
  late final GeneratedColumn<String> approvalNumber = GeneratedColumn<String>(
      'approval_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _baseMakeMeta =
      const VerificationMeta('baseMake');
  @override
  late final GeneratedColumn<String> baseMake = GeneratedColumn<String>(
      'base_make', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _baseModelMeta =
      const VerificationMeta('baseModel');
  @override
  late final GeneratedColumn<String> baseModel = GeneratedColumn<String>(
      'base_model', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _baseSerialMeta =
      const VerificationMeta('baseSerial');
  @override
  late final GeneratedColumn<String> baseSerial = GeneratedColumn<String>(
      'base_serial', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _baseApprovalPrefixMeta =
      const VerificationMeta('baseApprovalPrefix');
  @override
  late final GeneratedColumn<String> baseApprovalPrefix =
      GeneratedColumn<String>('base_approval_prefix', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _baseApprovalNumberMeta =
      const VerificationMeta('baseApprovalNumber');
  @override
  late final GeneratedColumn<String> baseApprovalNumber =
      GeneratedColumn<String>('base_approval_number', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _capacityMeta =
      const VerificationMeta('capacity');
  @override
  late final GeneratedColumn<double> capacity = GeneratedColumn<double>(
      'capacity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _capacityUnitMeta =
      const VerificationMeta('capacityUnit');
  @override
  late final GeneratedColumn<String> capacityUnit = GeneratedColumn<String>(
      'capacity_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _divisionMeta =
      const VerificationMeta('division');
  @override
  late final GeneratedColumn<double> division = GeneratedColumn<double>(
      'division', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _numberOfLoadCellsMeta =
      const VerificationMeta('numberOfLoadCells');
  @override
  late final GeneratedColumn<int> numberOfLoadCells = GeneratedColumn<int>(
      'number_of_load_cells', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numberOfSectionsMeta =
      const VerificationMeta('numberOfSections');
  @override
  late final GeneratedColumn<int> numberOfSections = GeneratedColumn<int>(
      'number_of_sections', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _loadCellModelMeta =
      const VerificationMeta('loadCellModel');
  @override
  late final GeneratedColumn<String> loadCellModel = GeneratedColumn<String>(
      'load_cell_model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loadCellCapacityMeta =
      const VerificationMeta('loadCellCapacity');
  @override
  late final GeneratedColumn<double> loadCellCapacity = GeneratedColumn<double>(
      'load_cell_capacity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _loadCellCapacityUnitMeta =
      const VerificationMeta('loadCellCapacityUnit');
  @override
  late final GeneratedColumn<String> loadCellCapacityUnit =
      GeneratedColumn<String>('load_cell_capacity_unit', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deactivateMeta =
      const VerificationMeta('deactivate');
  @override
  late final GeneratedColumn<bool> deactivate = GeneratedColumn<bool>(
      'deactivate', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deactivate" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _auditFlagMeta =
      const VerificationMeta('auditFlag');
  @override
  late final GeneratedColumn<bool> auditFlag = GeneratedColumn<bool>(
      'audit_flag', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("audit_flag" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        customerId,
        configuration,
        scaleType,
        indicatorMake,
        indicatorModel,
        indicatorSerial,
        approvalPrefix,
        approvalNumber,
        baseMake,
        baseModel,
        baseSerial,
        baseApprovalPrefix,
        baseApprovalNumber,
        capacity,
        capacityUnit,
        division,
        numberOfLoadCells,
        numberOfSections,
        loadCellModel,
        loadCellCapacity,
        loadCellCapacityUnit,
        notes,
        deactivate,
        auditFlag,
        synced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scales';
  @override
  VerificationContext validateIntegrity(Insertable<Scale> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('configuration')) {
      context.handle(
          _configurationMeta,
          configuration.isAcceptableOrUnknown(
              data['configuration']!, _configurationMeta));
    } else if (isInserting) {
      context.missing(_configurationMeta);
    }
    if (data.containsKey('scale_type')) {
      context.handle(_scaleTypeMeta,
          scaleType.isAcceptableOrUnknown(data['scale_type']!, _scaleTypeMeta));
    } else if (isInserting) {
      context.missing(_scaleTypeMeta);
    }
    if (data.containsKey('indicator_make')) {
      context.handle(
          _indicatorMakeMeta,
          indicatorMake.isAcceptableOrUnknown(
              data['indicator_make']!, _indicatorMakeMeta));
    } else if (isInserting) {
      context.missing(_indicatorMakeMeta);
    }
    if (data.containsKey('indicator_model')) {
      context.handle(
          _indicatorModelMeta,
          indicatorModel.isAcceptableOrUnknown(
              data['indicator_model']!, _indicatorModelMeta));
    } else if (isInserting) {
      context.missing(_indicatorModelMeta);
    }
    if (data.containsKey('indicator_serial')) {
      context.handle(
          _indicatorSerialMeta,
          indicatorSerial.isAcceptableOrUnknown(
              data['indicator_serial']!, _indicatorSerialMeta));
    } else if (isInserting) {
      context.missing(_indicatorSerialMeta);
    }
    if (data.containsKey('approval_prefix')) {
      context.handle(
          _approvalPrefixMeta,
          approvalPrefix.isAcceptableOrUnknown(
              data['approval_prefix']!, _approvalPrefixMeta));
    } else if (isInserting) {
      context.missing(_approvalPrefixMeta);
    }
    if (data.containsKey('approval_number')) {
      context.handle(
          _approvalNumberMeta,
          approvalNumber.isAcceptableOrUnknown(
              data['approval_number']!, _approvalNumberMeta));
    } else if (isInserting) {
      context.missing(_approvalNumberMeta);
    }
    if (data.containsKey('base_make')) {
      context.handle(_baseMakeMeta,
          baseMake.isAcceptableOrUnknown(data['base_make']!, _baseMakeMeta));
    }
    if (data.containsKey('base_model')) {
      context.handle(_baseModelMeta,
          baseModel.isAcceptableOrUnknown(data['base_model']!, _baseModelMeta));
    }
    if (data.containsKey('base_serial')) {
      context.handle(
          _baseSerialMeta,
          baseSerial.isAcceptableOrUnknown(
              data['base_serial']!, _baseSerialMeta));
    }
    if (data.containsKey('base_approval_prefix')) {
      context.handle(
          _baseApprovalPrefixMeta,
          baseApprovalPrefix.isAcceptableOrUnknown(
              data['base_approval_prefix']!, _baseApprovalPrefixMeta));
    }
    if (data.containsKey('base_approval_number')) {
      context.handle(
          _baseApprovalNumberMeta,
          baseApprovalNumber.isAcceptableOrUnknown(
              data['base_approval_number']!, _baseApprovalNumberMeta));
    }
    if (data.containsKey('capacity')) {
      context.handle(_capacityMeta,
          capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta));
    } else if (isInserting) {
      context.missing(_capacityMeta);
    }
    if (data.containsKey('capacity_unit')) {
      context.handle(
          _capacityUnitMeta,
          capacityUnit.isAcceptableOrUnknown(
              data['capacity_unit']!, _capacityUnitMeta));
    } else if (isInserting) {
      context.missing(_capacityUnitMeta);
    }
    if (data.containsKey('division')) {
      context.handle(_divisionMeta,
          division.isAcceptableOrUnknown(data['division']!, _divisionMeta));
    } else if (isInserting) {
      context.missing(_divisionMeta);
    }
    if (data.containsKey('number_of_load_cells')) {
      context.handle(
          _numberOfLoadCellsMeta,
          numberOfLoadCells.isAcceptableOrUnknown(
              data['number_of_load_cells']!, _numberOfLoadCellsMeta));
    } else if (isInserting) {
      context.missing(_numberOfLoadCellsMeta);
    }
    if (data.containsKey('number_of_sections')) {
      context.handle(
          _numberOfSectionsMeta,
          numberOfSections.isAcceptableOrUnknown(
              data['number_of_sections']!, _numberOfSectionsMeta));
    } else if (isInserting) {
      context.missing(_numberOfSectionsMeta);
    }
    if (data.containsKey('load_cell_model')) {
      context.handle(
          _loadCellModelMeta,
          loadCellModel.isAcceptableOrUnknown(
              data['load_cell_model']!, _loadCellModelMeta));
    } else if (isInserting) {
      context.missing(_loadCellModelMeta);
    }
    if (data.containsKey('load_cell_capacity')) {
      context.handle(
          _loadCellCapacityMeta,
          loadCellCapacity.isAcceptableOrUnknown(
              data['load_cell_capacity']!, _loadCellCapacityMeta));
    } else if (isInserting) {
      context.missing(_loadCellCapacityMeta);
    }
    if (data.containsKey('load_cell_capacity_unit')) {
      context.handle(
          _loadCellCapacityUnitMeta,
          loadCellCapacityUnit.isAcceptableOrUnknown(
              data['load_cell_capacity_unit']!, _loadCellCapacityUnitMeta));
    } else if (isInserting) {
      context.missing(_loadCellCapacityUnitMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('deactivate')) {
      context.handle(
          _deactivateMeta,
          deactivate.isAcceptableOrUnknown(
              data['deactivate']!, _deactivateMeta));
    }
    if (data.containsKey('audit_flag')) {
      context.handle(_auditFlagMeta,
          auditFlag.isAcceptableOrUnknown(data['audit_flag']!, _auditFlagMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Scale map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Scale(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id'])!,
      configuration: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}configuration'])!,
      scaleType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scale_type'])!,
      indicatorMake: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}indicator_make'])!,
      indicatorModel: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}indicator_model'])!,
      indicatorSerial: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}indicator_serial'])!,
      approvalPrefix: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}approval_prefix'])!,
      approvalNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}approval_number'])!,
      baseMake: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_make']),
      baseModel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_model']),
      baseSerial: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_serial']),
      baseApprovalPrefix: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}base_approval_prefix']),
      baseApprovalNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}base_approval_number']),
      capacity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}capacity'])!,
      capacityUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}capacity_unit'])!,
      division: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}division'])!,
      numberOfLoadCells: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}number_of_load_cells'])!,
      numberOfSections: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}number_of_sections'])!,
      loadCellModel: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}load_cell_model'])!,
      loadCellCapacity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}load_cell_capacity'])!,
      loadCellCapacityUnit: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}load_cell_capacity_unit'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      deactivate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deactivate'])!,
      auditFlag: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}audit_flag'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $ScalesTable createAlias(String alias) {
    return $ScalesTable(attachedDatabase, alias);
  }
}

class Scale extends DataClass implements Insertable<Scale> {
  final int id;
  final int customerId;
  final bool configuration;
  final String scaleType;
  final String indicatorMake;
  final String indicatorModel;
  final String indicatorSerial;
  final String approvalPrefix;
  final String approvalNumber;
  final String? baseMake;
  final String? baseModel;
  final String? baseSerial;
  final String? baseApprovalPrefix;
  final String? baseApprovalNumber;
  final double capacity;
  final String capacityUnit;
  final double division;
  final int numberOfLoadCells;
  final int numberOfSections;
  final String loadCellModel;
  final double loadCellCapacity;
  final String loadCellCapacityUnit;
  final String? notes;
  final bool deactivate;
  final bool auditFlag;
  final bool synced;
  const Scale(
      {required this.id,
      required this.customerId,
      required this.configuration,
      required this.scaleType,
      required this.indicatorMake,
      required this.indicatorModel,
      required this.indicatorSerial,
      required this.approvalPrefix,
      required this.approvalNumber,
      this.baseMake,
      this.baseModel,
      this.baseSerial,
      this.baseApprovalPrefix,
      this.baseApprovalNumber,
      required this.capacity,
      required this.capacityUnit,
      required this.division,
      required this.numberOfLoadCells,
      required this.numberOfSections,
      required this.loadCellModel,
      required this.loadCellCapacity,
      required this.loadCellCapacityUnit,
      this.notes,
      required this.deactivate,
      required this.auditFlag,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_id'] = Variable<int>(customerId);
    map['configuration'] = Variable<bool>(configuration);
    map['scale_type'] = Variable<String>(scaleType);
    map['indicator_make'] = Variable<String>(indicatorMake);
    map['indicator_model'] = Variable<String>(indicatorModel);
    map['indicator_serial'] = Variable<String>(indicatorSerial);
    map['approval_prefix'] = Variable<String>(approvalPrefix);
    map['approval_number'] = Variable<String>(approvalNumber);
    if (!nullToAbsent || baseMake != null) {
      map['base_make'] = Variable<String>(baseMake);
    }
    if (!nullToAbsent || baseModel != null) {
      map['base_model'] = Variable<String>(baseModel);
    }
    if (!nullToAbsent || baseSerial != null) {
      map['base_serial'] = Variable<String>(baseSerial);
    }
    if (!nullToAbsent || baseApprovalPrefix != null) {
      map['base_approval_prefix'] = Variable<String>(baseApprovalPrefix);
    }
    if (!nullToAbsent || baseApprovalNumber != null) {
      map['base_approval_number'] = Variable<String>(baseApprovalNumber);
    }
    map['capacity'] = Variable<double>(capacity);
    map['capacity_unit'] = Variable<String>(capacityUnit);
    map['division'] = Variable<double>(division);
    map['number_of_load_cells'] = Variable<int>(numberOfLoadCells);
    map['number_of_sections'] = Variable<int>(numberOfSections);
    map['load_cell_model'] = Variable<String>(loadCellModel);
    map['load_cell_capacity'] = Variable<double>(loadCellCapacity);
    map['load_cell_capacity_unit'] = Variable<String>(loadCellCapacityUnit);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['deactivate'] = Variable<bool>(deactivate);
    map['audit_flag'] = Variable<bool>(auditFlag);
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  ScalesCompanion toCompanion(bool nullToAbsent) {
    return ScalesCompanion(
      id: Value(id),
      customerId: Value(customerId),
      configuration: Value(configuration),
      scaleType: Value(scaleType),
      indicatorMake: Value(indicatorMake),
      indicatorModel: Value(indicatorModel),
      indicatorSerial: Value(indicatorSerial),
      approvalPrefix: Value(approvalPrefix),
      approvalNumber: Value(approvalNumber),
      baseMake: baseMake == null && nullToAbsent
          ? const Value.absent()
          : Value(baseMake),
      baseModel: baseModel == null && nullToAbsent
          ? const Value.absent()
          : Value(baseModel),
      baseSerial: baseSerial == null && nullToAbsent
          ? const Value.absent()
          : Value(baseSerial),
      baseApprovalPrefix: baseApprovalPrefix == null && nullToAbsent
          ? const Value.absent()
          : Value(baseApprovalPrefix),
      baseApprovalNumber: baseApprovalNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(baseApprovalNumber),
      capacity: Value(capacity),
      capacityUnit: Value(capacityUnit),
      division: Value(division),
      numberOfLoadCells: Value(numberOfLoadCells),
      numberOfSections: Value(numberOfSections),
      loadCellModel: Value(loadCellModel),
      loadCellCapacity: Value(loadCellCapacity),
      loadCellCapacityUnit: Value(loadCellCapacityUnit),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      deactivate: Value(deactivate),
      auditFlag: Value(auditFlag),
      synced: Value(synced),
    );
  }

  factory Scale.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Scale(
      id: serializer.fromJson<int>(json['id']),
      customerId: serializer.fromJson<int>(json['customerId']),
      configuration: serializer.fromJson<bool>(json['configuration']),
      scaleType: serializer.fromJson<String>(json['scaleType']),
      indicatorMake: serializer.fromJson<String>(json['indicatorMake']),
      indicatorModel: serializer.fromJson<String>(json['indicatorModel']),
      indicatorSerial: serializer.fromJson<String>(json['indicatorSerial']),
      approvalPrefix: serializer.fromJson<String>(json['approvalPrefix']),
      approvalNumber: serializer.fromJson<String>(json['approvalNumber']),
      baseMake: serializer.fromJson<String?>(json['baseMake']),
      baseModel: serializer.fromJson<String?>(json['baseModel']),
      baseSerial: serializer.fromJson<String?>(json['baseSerial']),
      baseApprovalPrefix:
          serializer.fromJson<String?>(json['baseApprovalPrefix']),
      baseApprovalNumber:
          serializer.fromJson<String?>(json['baseApprovalNumber']),
      capacity: serializer.fromJson<double>(json['capacity']),
      capacityUnit: serializer.fromJson<String>(json['capacityUnit']),
      division: serializer.fromJson<double>(json['division']),
      numberOfLoadCells: serializer.fromJson<int>(json['numberOfLoadCells']),
      numberOfSections: serializer.fromJson<int>(json['numberOfSections']),
      loadCellModel: serializer.fromJson<String>(json['loadCellModel']),
      loadCellCapacity: serializer.fromJson<double>(json['loadCellCapacity']),
      loadCellCapacityUnit:
          serializer.fromJson<String>(json['loadCellCapacityUnit']),
      notes: serializer.fromJson<String?>(json['notes']),
      deactivate: serializer.fromJson<bool>(json['deactivate']),
      auditFlag: serializer.fromJson<bool>(json['auditFlag']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerId': serializer.toJson<int>(customerId),
      'configuration': serializer.toJson<bool>(configuration),
      'scaleType': serializer.toJson<String>(scaleType),
      'indicatorMake': serializer.toJson<String>(indicatorMake),
      'indicatorModel': serializer.toJson<String>(indicatorModel),
      'indicatorSerial': serializer.toJson<String>(indicatorSerial),
      'approvalPrefix': serializer.toJson<String>(approvalPrefix),
      'approvalNumber': serializer.toJson<String>(approvalNumber),
      'baseMake': serializer.toJson<String?>(baseMake),
      'baseModel': serializer.toJson<String?>(baseModel),
      'baseSerial': serializer.toJson<String?>(baseSerial),
      'baseApprovalPrefix': serializer.toJson<String?>(baseApprovalPrefix),
      'baseApprovalNumber': serializer.toJson<String?>(baseApprovalNumber),
      'capacity': serializer.toJson<double>(capacity),
      'capacityUnit': serializer.toJson<String>(capacityUnit),
      'division': serializer.toJson<double>(division),
      'numberOfLoadCells': serializer.toJson<int>(numberOfLoadCells),
      'numberOfSections': serializer.toJson<int>(numberOfSections),
      'loadCellModel': serializer.toJson<String>(loadCellModel),
      'loadCellCapacity': serializer.toJson<double>(loadCellCapacity),
      'loadCellCapacityUnit': serializer.toJson<String>(loadCellCapacityUnit),
      'notes': serializer.toJson<String?>(notes),
      'deactivate': serializer.toJson<bool>(deactivate),
      'auditFlag': serializer.toJson<bool>(auditFlag),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  Scale copyWith(
          {int? id,
          int? customerId,
          bool? configuration,
          String? scaleType,
          String? indicatorMake,
          String? indicatorModel,
          String? indicatorSerial,
          String? approvalPrefix,
          String? approvalNumber,
          Value<String?> baseMake = const Value.absent(),
          Value<String?> baseModel = const Value.absent(),
          Value<String?> baseSerial = const Value.absent(),
          Value<String?> baseApprovalPrefix = const Value.absent(),
          Value<String?> baseApprovalNumber = const Value.absent(),
          double? capacity,
          String? capacityUnit,
          double? division,
          int? numberOfLoadCells,
          int? numberOfSections,
          String? loadCellModel,
          double? loadCellCapacity,
          String? loadCellCapacityUnit,
          Value<String?> notes = const Value.absent(),
          bool? deactivate,
          bool? auditFlag,
          bool? synced}) =>
      Scale(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        configuration: configuration ?? this.configuration,
        scaleType: scaleType ?? this.scaleType,
        indicatorMake: indicatorMake ?? this.indicatorMake,
        indicatorModel: indicatorModel ?? this.indicatorModel,
        indicatorSerial: indicatorSerial ?? this.indicatorSerial,
        approvalPrefix: approvalPrefix ?? this.approvalPrefix,
        approvalNumber: approvalNumber ?? this.approvalNumber,
        baseMake: baseMake.present ? baseMake.value : this.baseMake,
        baseModel: baseModel.present ? baseModel.value : this.baseModel,
        baseSerial: baseSerial.present ? baseSerial.value : this.baseSerial,
        baseApprovalPrefix: baseApprovalPrefix.present
            ? baseApprovalPrefix.value
            : this.baseApprovalPrefix,
        baseApprovalNumber: baseApprovalNumber.present
            ? baseApprovalNumber.value
            : this.baseApprovalNumber,
        capacity: capacity ?? this.capacity,
        capacityUnit: capacityUnit ?? this.capacityUnit,
        division: division ?? this.division,
        numberOfLoadCells: numberOfLoadCells ?? this.numberOfLoadCells,
        numberOfSections: numberOfSections ?? this.numberOfSections,
        loadCellModel: loadCellModel ?? this.loadCellModel,
        loadCellCapacity: loadCellCapacity ?? this.loadCellCapacity,
        loadCellCapacityUnit: loadCellCapacityUnit ?? this.loadCellCapacityUnit,
        notes: notes.present ? notes.value : this.notes,
        deactivate: deactivate ?? this.deactivate,
        auditFlag: auditFlag ?? this.auditFlag,
        synced: synced ?? this.synced,
      );
  Scale copyWithCompanion(ScalesCompanion data) {
    return Scale(
      id: data.id.present ? data.id.value : this.id,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      configuration: data.configuration.present
          ? data.configuration.value
          : this.configuration,
      scaleType: data.scaleType.present ? data.scaleType.value : this.scaleType,
      indicatorMake: data.indicatorMake.present
          ? data.indicatorMake.value
          : this.indicatorMake,
      indicatorModel: data.indicatorModel.present
          ? data.indicatorModel.value
          : this.indicatorModel,
      indicatorSerial: data.indicatorSerial.present
          ? data.indicatorSerial.value
          : this.indicatorSerial,
      approvalPrefix: data.approvalPrefix.present
          ? data.approvalPrefix.value
          : this.approvalPrefix,
      approvalNumber: data.approvalNumber.present
          ? data.approvalNumber.value
          : this.approvalNumber,
      baseMake: data.baseMake.present ? data.baseMake.value : this.baseMake,
      baseModel: data.baseModel.present ? data.baseModel.value : this.baseModel,
      baseSerial:
          data.baseSerial.present ? data.baseSerial.value : this.baseSerial,
      baseApprovalPrefix: data.baseApprovalPrefix.present
          ? data.baseApprovalPrefix.value
          : this.baseApprovalPrefix,
      baseApprovalNumber: data.baseApprovalNumber.present
          ? data.baseApprovalNumber.value
          : this.baseApprovalNumber,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      capacityUnit: data.capacityUnit.present
          ? data.capacityUnit.value
          : this.capacityUnit,
      division: data.division.present ? data.division.value : this.division,
      numberOfLoadCells: data.numberOfLoadCells.present
          ? data.numberOfLoadCells.value
          : this.numberOfLoadCells,
      numberOfSections: data.numberOfSections.present
          ? data.numberOfSections.value
          : this.numberOfSections,
      loadCellModel: data.loadCellModel.present
          ? data.loadCellModel.value
          : this.loadCellModel,
      loadCellCapacity: data.loadCellCapacity.present
          ? data.loadCellCapacity.value
          : this.loadCellCapacity,
      loadCellCapacityUnit: data.loadCellCapacityUnit.present
          ? data.loadCellCapacityUnit.value
          : this.loadCellCapacityUnit,
      notes: data.notes.present ? data.notes.value : this.notes,
      deactivate:
          data.deactivate.present ? data.deactivate.value : this.deactivate,
      auditFlag: data.auditFlag.present ? data.auditFlag.value : this.auditFlag,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Scale(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('configuration: $configuration, ')
          ..write('scaleType: $scaleType, ')
          ..write('indicatorMake: $indicatorMake, ')
          ..write('indicatorModel: $indicatorModel, ')
          ..write('indicatorSerial: $indicatorSerial, ')
          ..write('approvalPrefix: $approvalPrefix, ')
          ..write('approvalNumber: $approvalNumber, ')
          ..write('baseMake: $baseMake, ')
          ..write('baseModel: $baseModel, ')
          ..write('baseSerial: $baseSerial, ')
          ..write('baseApprovalPrefix: $baseApprovalPrefix, ')
          ..write('baseApprovalNumber: $baseApprovalNumber, ')
          ..write('capacity: $capacity, ')
          ..write('capacityUnit: $capacityUnit, ')
          ..write('division: $division, ')
          ..write('numberOfLoadCells: $numberOfLoadCells, ')
          ..write('numberOfSections: $numberOfSections, ')
          ..write('loadCellModel: $loadCellModel, ')
          ..write('loadCellCapacity: $loadCellCapacity, ')
          ..write('loadCellCapacityUnit: $loadCellCapacityUnit, ')
          ..write('notes: $notes, ')
          ..write('deactivate: $deactivate, ')
          ..write('auditFlag: $auditFlag, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        customerId,
        configuration,
        scaleType,
        indicatorMake,
        indicatorModel,
        indicatorSerial,
        approvalPrefix,
        approvalNumber,
        baseMake,
        baseModel,
        baseSerial,
        baseApprovalPrefix,
        baseApprovalNumber,
        capacity,
        capacityUnit,
        division,
        numberOfLoadCells,
        numberOfSections,
        loadCellModel,
        loadCellCapacity,
        loadCellCapacityUnit,
        notes,
        deactivate,
        auditFlag,
        synced
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Scale &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.configuration == this.configuration &&
          other.scaleType == this.scaleType &&
          other.indicatorMake == this.indicatorMake &&
          other.indicatorModel == this.indicatorModel &&
          other.indicatorSerial == this.indicatorSerial &&
          other.approvalPrefix == this.approvalPrefix &&
          other.approvalNumber == this.approvalNumber &&
          other.baseMake == this.baseMake &&
          other.baseModel == this.baseModel &&
          other.baseSerial == this.baseSerial &&
          other.baseApprovalPrefix == this.baseApprovalPrefix &&
          other.baseApprovalNumber == this.baseApprovalNumber &&
          other.capacity == this.capacity &&
          other.capacityUnit == this.capacityUnit &&
          other.division == this.division &&
          other.numberOfLoadCells == this.numberOfLoadCells &&
          other.numberOfSections == this.numberOfSections &&
          other.loadCellModel == this.loadCellModel &&
          other.loadCellCapacity == this.loadCellCapacity &&
          other.loadCellCapacityUnit == this.loadCellCapacityUnit &&
          other.notes == this.notes &&
          other.deactivate == this.deactivate &&
          other.auditFlag == this.auditFlag &&
          other.synced == this.synced);
}

class ScalesCompanion extends UpdateCompanion<Scale> {
  final Value<int> id;
  final Value<int> customerId;
  final Value<bool> configuration;
  final Value<String> scaleType;
  final Value<String> indicatorMake;
  final Value<String> indicatorModel;
  final Value<String> indicatorSerial;
  final Value<String> approvalPrefix;
  final Value<String> approvalNumber;
  final Value<String?> baseMake;
  final Value<String?> baseModel;
  final Value<String?> baseSerial;
  final Value<String?> baseApprovalPrefix;
  final Value<String?> baseApprovalNumber;
  final Value<double> capacity;
  final Value<String> capacityUnit;
  final Value<double> division;
  final Value<int> numberOfLoadCells;
  final Value<int> numberOfSections;
  final Value<String> loadCellModel;
  final Value<double> loadCellCapacity;
  final Value<String> loadCellCapacityUnit;
  final Value<String?> notes;
  final Value<bool> deactivate;
  final Value<bool> auditFlag;
  final Value<bool> synced;
  const ScalesCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.configuration = const Value.absent(),
    this.scaleType = const Value.absent(),
    this.indicatorMake = const Value.absent(),
    this.indicatorModel = const Value.absent(),
    this.indicatorSerial = const Value.absent(),
    this.approvalPrefix = const Value.absent(),
    this.approvalNumber = const Value.absent(),
    this.baseMake = const Value.absent(),
    this.baseModel = const Value.absent(),
    this.baseSerial = const Value.absent(),
    this.baseApprovalPrefix = const Value.absent(),
    this.baseApprovalNumber = const Value.absent(),
    this.capacity = const Value.absent(),
    this.capacityUnit = const Value.absent(),
    this.division = const Value.absent(),
    this.numberOfLoadCells = const Value.absent(),
    this.numberOfSections = const Value.absent(),
    this.loadCellModel = const Value.absent(),
    this.loadCellCapacity = const Value.absent(),
    this.loadCellCapacityUnit = const Value.absent(),
    this.notes = const Value.absent(),
    this.deactivate = const Value.absent(),
    this.auditFlag = const Value.absent(),
    this.synced = const Value.absent(),
  });
  ScalesCompanion.insert({
    this.id = const Value.absent(),
    required int customerId,
    required bool configuration,
    required String scaleType,
    required String indicatorMake,
    required String indicatorModel,
    required String indicatorSerial,
    required String approvalPrefix,
    required String approvalNumber,
    this.baseMake = const Value.absent(),
    this.baseModel = const Value.absent(),
    this.baseSerial = const Value.absent(),
    this.baseApprovalPrefix = const Value.absent(),
    this.baseApprovalNumber = const Value.absent(),
    required double capacity,
    required String capacityUnit,
    required double division,
    required int numberOfLoadCells,
    required int numberOfSections,
    required String loadCellModel,
    required double loadCellCapacity,
    required String loadCellCapacityUnit,
    this.notes = const Value.absent(),
    this.deactivate = const Value.absent(),
    this.auditFlag = const Value.absent(),
    this.synced = const Value.absent(),
  })  : customerId = Value(customerId),
        configuration = Value(configuration),
        scaleType = Value(scaleType),
        indicatorMake = Value(indicatorMake),
        indicatorModel = Value(indicatorModel),
        indicatorSerial = Value(indicatorSerial),
        approvalPrefix = Value(approvalPrefix),
        approvalNumber = Value(approvalNumber),
        capacity = Value(capacity),
        capacityUnit = Value(capacityUnit),
        division = Value(division),
        numberOfLoadCells = Value(numberOfLoadCells),
        numberOfSections = Value(numberOfSections),
        loadCellModel = Value(loadCellModel),
        loadCellCapacity = Value(loadCellCapacity),
        loadCellCapacityUnit = Value(loadCellCapacityUnit);
  static Insertable<Scale> custom({
    Expression<int>? id,
    Expression<int>? customerId,
    Expression<bool>? configuration,
    Expression<String>? scaleType,
    Expression<String>? indicatorMake,
    Expression<String>? indicatorModel,
    Expression<String>? indicatorSerial,
    Expression<String>? approvalPrefix,
    Expression<String>? approvalNumber,
    Expression<String>? baseMake,
    Expression<String>? baseModel,
    Expression<String>? baseSerial,
    Expression<String>? baseApprovalPrefix,
    Expression<String>? baseApprovalNumber,
    Expression<double>? capacity,
    Expression<String>? capacityUnit,
    Expression<double>? division,
    Expression<int>? numberOfLoadCells,
    Expression<int>? numberOfSections,
    Expression<String>? loadCellModel,
    Expression<double>? loadCellCapacity,
    Expression<String>? loadCellCapacityUnit,
    Expression<String>? notes,
    Expression<bool>? deactivate,
    Expression<bool>? auditFlag,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (configuration != null) 'configuration': configuration,
      if (scaleType != null) 'scale_type': scaleType,
      if (indicatorMake != null) 'indicator_make': indicatorMake,
      if (indicatorModel != null) 'indicator_model': indicatorModel,
      if (indicatorSerial != null) 'indicator_serial': indicatorSerial,
      if (approvalPrefix != null) 'approval_prefix': approvalPrefix,
      if (approvalNumber != null) 'approval_number': approvalNumber,
      if (baseMake != null) 'base_make': baseMake,
      if (baseModel != null) 'base_model': baseModel,
      if (baseSerial != null) 'base_serial': baseSerial,
      if (baseApprovalPrefix != null)
        'base_approval_prefix': baseApprovalPrefix,
      if (baseApprovalNumber != null)
        'base_approval_number': baseApprovalNumber,
      if (capacity != null) 'capacity': capacity,
      if (capacityUnit != null) 'capacity_unit': capacityUnit,
      if (division != null) 'division': division,
      if (numberOfLoadCells != null) 'number_of_load_cells': numberOfLoadCells,
      if (numberOfSections != null) 'number_of_sections': numberOfSections,
      if (loadCellModel != null) 'load_cell_model': loadCellModel,
      if (loadCellCapacity != null) 'load_cell_capacity': loadCellCapacity,
      if (loadCellCapacityUnit != null)
        'load_cell_capacity_unit': loadCellCapacityUnit,
      if (notes != null) 'notes': notes,
      if (deactivate != null) 'deactivate': deactivate,
      if (auditFlag != null) 'audit_flag': auditFlag,
      if (synced != null) 'synced': synced,
    });
  }

  ScalesCompanion copyWith(
      {Value<int>? id,
      Value<int>? customerId,
      Value<bool>? configuration,
      Value<String>? scaleType,
      Value<String>? indicatorMake,
      Value<String>? indicatorModel,
      Value<String>? indicatorSerial,
      Value<String>? approvalPrefix,
      Value<String>? approvalNumber,
      Value<String?>? baseMake,
      Value<String?>? baseModel,
      Value<String?>? baseSerial,
      Value<String?>? baseApprovalPrefix,
      Value<String?>? baseApprovalNumber,
      Value<double>? capacity,
      Value<String>? capacityUnit,
      Value<double>? division,
      Value<int>? numberOfLoadCells,
      Value<int>? numberOfSections,
      Value<String>? loadCellModel,
      Value<double>? loadCellCapacity,
      Value<String>? loadCellCapacityUnit,
      Value<String?>? notes,
      Value<bool>? deactivate,
      Value<bool>? auditFlag,
      Value<bool>? synced}) {
    return ScalesCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      configuration: configuration ?? this.configuration,
      scaleType: scaleType ?? this.scaleType,
      indicatorMake: indicatorMake ?? this.indicatorMake,
      indicatorModel: indicatorModel ?? this.indicatorModel,
      indicatorSerial: indicatorSerial ?? this.indicatorSerial,
      approvalPrefix: approvalPrefix ?? this.approvalPrefix,
      approvalNumber: approvalNumber ?? this.approvalNumber,
      baseMake: baseMake ?? this.baseMake,
      baseModel: baseModel ?? this.baseModel,
      baseSerial: baseSerial ?? this.baseSerial,
      baseApprovalPrefix: baseApprovalPrefix ?? this.baseApprovalPrefix,
      baseApprovalNumber: baseApprovalNumber ?? this.baseApprovalNumber,
      capacity: capacity ?? this.capacity,
      capacityUnit: capacityUnit ?? this.capacityUnit,
      division: division ?? this.division,
      numberOfLoadCells: numberOfLoadCells ?? this.numberOfLoadCells,
      numberOfSections: numberOfSections ?? this.numberOfSections,
      loadCellModel: loadCellModel ?? this.loadCellModel,
      loadCellCapacity: loadCellCapacity ?? this.loadCellCapacity,
      loadCellCapacityUnit: loadCellCapacityUnit ?? this.loadCellCapacityUnit,
      notes: notes ?? this.notes,
      deactivate: deactivate ?? this.deactivate,
      auditFlag: auditFlag ?? this.auditFlag,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (configuration.present) {
      map['configuration'] = Variable<bool>(configuration.value);
    }
    if (scaleType.present) {
      map['scale_type'] = Variable<String>(scaleType.value);
    }
    if (indicatorMake.present) {
      map['indicator_make'] = Variable<String>(indicatorMake.value);
    }
    if (indicatorModel.present) {
      map['indicator_model'] = Variable<String>(indicatorModel.value);
    }
    if (indicatorSerial.present) {
      map['indicator_serial'] = Variable<String>(indicatorSerial.value);
    }
    if (approvalPrefix.present) {
      map['approval_prefix'] = Variable<String>(approvalPrefix.value);
    }
    if (approvalNumber.present) {
      map['approval_number'] = Variable<String>(approvalNumber.value);
    }
    if (baseMake.present) {
      map['base_make'] = Variable<String>(baseMake.value);
    }
    if (baseModel.present) {
      map['base_model'] = Variable<String>(baseModel.value);
    }
    if (baseSerial.present) {
      map['base_serial'] = Variable<String>(baseSerial.value);
    }
    if (baseApprovalPrefix.present) {
      map['base_approval_prefix'] = Variable<String>(baseApprovalPrefix.value);
    }
    if (baseApprovalNumber.present) {
      map['base_approval_number'] = Variable<String>(baseApprovalNumber.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<double>(capacity.value);
    }
    if (capacityUnit.present) {
      map['capacity_unit'] = Variable<String>(capacityUnit.value);
    }
    if (division.present) {
      map['division'] = Variable<double>(division.value);
    }
    if (numberOfLoadCells.present) {
      map['number_of_load_cells'] = Variable<int>(numberOfLoadCells.value);
    }
    if (numberOfSections.present) {
      map['number_of_sections'] = Variable<int>(numberOfSections.value);
    }
    if (loadCellModel.present) {
      map['load_cell_model'] = Variable<String>(loadCellModel.value);
    }
    if (loadCellCapacity.present) {
      map['load_cell_capacity'] = Variable<double>(loadCellCapacity.value);
    }
    if (loadCellCapacityUnit.present) {
      map['load_cell_capacity_unit'] =
          Variable<String>(loadCellCapacityUnit.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (deactivate.present) {
      map['deactivate'] = Variable<bool>(deactivate.value);
    }
    if (auditFlag.present) {
      map['audit_flag'] = Variable<bool>(auditFlag.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScalesCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('configuration: $configuration, ')
          ..write('scaleType: $scaleType, ')
          ..write('indicatorMake: $indicatorMake, ')
          ..write('indicatorModel: $indicatorModel, ')
          ..write('indicatorSerial: $indicatorSerial, ')
          ..write('approvalPrefix: $approvalPrefix, ')
          ..write('approvalNumber: $approvalNumber, ')
          ..write('baseMake: $baseMake, ')
          ..write('baseModel: $baseModel, ')
          ..write('baseSerial: $baseSerial, ')
          ..write('baseApprovalPrefix: $baseApprovalPrefix, ')
          ..write('baseApprovalNumber: $baseApprovalNumber, ')
          ..write('capacity: $capacity, ')
          ..write('capacityUnit: $capacityUnit, ')
          ..write('division: $division, ')
          ..write('numberOfLoadCells: $numberOfLoadCells, ')
          ..write('numberOfSections: $numberOfSections, ')
          ..write('loadCellModel: $loadCellModel, ')
          ..write('loadCellCapacity: $loadCellCapacity, ')
          ..write('loadCellCapacityUnit: $loadCellCapacityUnit, ')
          ..write('notes: $notes, ')
          ..write('deactivate: $deactivate, ')
          ..write('auditFlag: $auditFlag, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $ServiceReportsTable extends ServiceReports
    with TableInfo<$ServiceReportsTable, ServiceReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _workOrderIdMeta =
      const VerificationMeta('workOrderId');
  @override
  late final GeneratedColumn<int> workOrderId = GeneratedColumn<int>(
      'work_order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES work_orders (id)'));
  static const VerificationMeta _scaleIdMeta =
      const VerificationMeta('scaleId');
  @override
  late final GeneratedColumn<int> scaleId = GeneratedColumn<int>(
      'scale_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES scales (id)'));
  static const VerificationMeta _reportTypeMeta =
      const VerificationMeta('reportType');
  @override
  late final GeneratedColumn<String> reportType = GeneratedColumn<String>(
      'report_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _completeMeta =
      const VerificationMeta('complete');
  @override
  late final GeneratedColumn<bool> complete = GeneratedColumn<bool>(
      'complete', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("complete" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        workOrderId,
        scaleId,
        reportType,
        notes,
        createdAt,
        complete,
        synced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_reports';
  @override
  VerificationContext validateIntegrity(Insertable<ServiceReport> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('work_order_id')) {
      context.handle(
          _workOrderIdMeta,
          workOrderId.isAcceptableOrUnknown(
              data['work_order_id']!, _workOrderIdMeta));
    } else if (isInserting) {
      context.missing(_workOrderIdMeta);
    }
    if (data.containsKey('scale_id')) {
      context.handle(_scaleIdMeta,
          scaleId.isAcceptableOrUnknown(data['scale_id']!, _scaleIdMeta));
    } else if (isInserting) {
      context.missing(_scaleIdMeta);
    }
    if (data.containsKey('report_type')) {
      context.handle(
          _reportTypeMeta,
          reportType.isAcceptableOrUnknown(
              data['report_type']!, _reportTypeMeta));
    } else if (isInserting) {
      context.missing(_reportTypeMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('complete')) {
      context.handle(_completeMeta,
          complete.isAcceptableOrUnknown(data['complete']!, _completeMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceReport(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      workOrderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}work_order_id'])!,
      scaleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}scale_id'])!,
      reportType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}report_type'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      complete: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}complete'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $ServiceReportsTable createAlias(String alias) {
    return $ServiceReportsTable(attachedDatabase, alias);
  }
}

class ServiceReport extends DataClass implements Insertable<ServiceReport> {
  final int id;
  final int workOrderId;
  final int scaleId;
  final String reportType;
  final String? notes;
  final DateTime createdAt;
  final bool complete;
  final bool synced;
  const ServiceReport(
      {required this.id,
      required this.workOrderId,
      required this.scaleId,
      required this.reportType,
      this.notes,
      required this.createdAt,
      required this.complete,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['work_order_id'] = Variable<int>(workOrderId);
    map['scale_id'] = Variable<int>(scaleId);
    map['report_type'] = Variable<String>(reportType);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['complete'] = Variable<bool>(complete);
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  ServiceReportsCompanion toCompanion(bool nullToAbsent) {
    return ServiceReportsCompanion(
      id: Value(id),
      workOrderId: Value(workOrderId),
      scaleId: Value(scaleId),
      reportType: Value(reportType),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      complete: Value(complete),
      synced: Value(synced),
    );
  }

  factory ServiceReport.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceReport(
      id: serializer.fromJson<int>(json['id']),
      workOrderId: serializer.fromJson<int>(json['workOrderId']),
      scaleId: serializer.fromJson<int>(json['scaleId']),
      reportType: serializer.fromJson<String>(json['reportType']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      complete: serializer.fromJson<bool>(json['complete']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workOrderId': serializer.toJson<int>(workOrderId),
      'scaleId': serializer.toJson<int>(scaleId),
      'reportType': serializer.toJson<String>(reportType),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'complete': serializer.toJson<bool>(complete),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  ServiceReport copyWith(
          {int? id,
          int? workOrderId,
          int? scaleId,
          String? reportType,
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          bool? complete,
          bool? synced}) =>
      ServiceReport(
        id: id ?? this.id,
        workOrderId: workOrderId ?? this.workOrderId,
        scaleId: scaleId ?? this.scaleId,
        reportType: reportType ?? this.reportType,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        complete: complete ?? this.complete,
        synced: synced ?? this.synced,
      );
  ServiceReport copyWithCompanion(ServiceReportsCompanion data) {
    return ServiceReport(
      id: data.id.present ? data.id.value : this.id,
      workOrderId:
          data.workOrderId.present ? data.workOrderId.value : this.workOrderId,
      scaleId: data.scaleId.present ? data.scaleId.value : this.scaleId,
      reportType:
          data.reportType.present ? data.reportType.value : this.reportType,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      complete: data.complete.present ? data.complete.value : this.complete,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceReport(')
          ..write('id: $id, ')
          ..write('workOrderId: $workOrderId, ')
          ..write('scaleId: $scaleId, ')
          ..write('reportType: $reportType, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('complete: $complete, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, workOrderId, scaleId, reportType, notes, createdAt, complete, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceReport &&
          other.id == this.id &&
          other.workOrderId == this.workOrderId &&
          other.scaleId == this.scaleId &&
          other.reportType == this.reportType &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.complete == this.complete &&
          other.synced == this.synced);
}

class ServiceReportsCompanion extends UpdateCompanion<ServiceReport> {
  final Value<int> id;
  final Value<int> workOrderId;
  final Value<int> scaleId;
  final Value<String> reportType;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<bool> complete;
  final Value<bool> synced;
  const ServiceReportsCompanion({
    this.id = const Value.absent(),
    this.workOrderId = const Value.absent(),
    this.scaleId = const Value.absent(),
    this.reportType = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.complete = const Value.absent(),
    this.synced = const Value.absent(),
  });
  ServiceReportsCompanion.insert({
    this.id = const Value.absent(),
    required int workOrderId,
    required int scaleId,
    required String reportType,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.complete = const Value.absent(),
    this.synced = const Value.absent(),
  })  : workOrderId = Value(workOrderId),
        scaleId = Value(scaleId),
        reportType = Value(reportType);
  static Insertable<ServiceReport> custom({
    Expression<int>? id,
    Expression<int>? workOrderId,
    Expression<int>? scaleId,
    Expression<String>? reportType,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<bool>? complete,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workOrderId != null) 'work_order_id': workOrderId,
      if (scaleId != null) 'scale_id': scaleId,
      if (reportType != null) 'report_type': reportType,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (complete != null) 'complete': complete,
      if (synced != null) 'synced': synced,
    });
  }

  ServiceReportsCompanion copyWith(
      {Value<int>? id,
      Value<int>? workOrderId,
      Value<int>? scaleId,
      Value<String>? reportType,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<bool>? complete,
      Value<bool>? synced}) {
    return ServiceReportsCompanion(
      id: id ?? this.id,
      workOrderId: workOrderId ?? this.workOrderId,
      scaleId: scaleId ?? this.scaleId,
      reportType: reportType ?? this.reportType,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      complete: complete ?? this.complete,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workOrderId.present) {
      map['work_order_id'] = Variable<int>(workOrderId.value);
    }
    if (scaleId.present) {
      map['scale_id'] = Variable<int>(scaleId.value);
    }
    if (reportType.present) {
      map['report_type'] = Variable<String>(reportType.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (complete.present) {
      map['complete'] = Variable<bool>(complete.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceReportsCompanion(')
          ..write('id: $id, ')
          ..write('workOrderId: $workOrderId, ')
          ..write('scaleId: $scaleId, ')
          ..write('reportType: $reportType, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('complete: $complete, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $ContactsTable contacts = $ContactsTable(this);
  late final $WorkOrdersTable workOrders = $WorkOrdersTable(this);
  late final $ScalesTable scales = $ScalesTable(this);
  late final $ServiceReportsTable serviceReports = $ServiceReportsTable(this);
  late final CustomerDao customerDao = CustomerDao(this as AppDatabase);
  late final ContactDao contactDao = ContactDao(this as AppDatabase);
  late final WorkOrderDao workOrderDao = WorkOrderDao(this as AppDatabase);
  late final ScaleDao scaleDao = ScaleDao(this as AppDatabase);
  late final ServiceReportDao serviceReportDao =
      ServiceReportDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [customers, contacts, workOrders, scales, serviceReports];
}

typedef $$CustomersTableCreateCompanionBuilder = CustomersCompanion Function({
  Value<int> id,
  required String businessName,
  Value<String?> siteAddress,
  Value<String?> siteCity,
  Value<String?> siteProvince,
  Value<String?> sitePostalCode,
  Value<String?> billingAddress,
  Value<String?> billingCity,
  Value<String?> billingProvince,
  Value<String?> billingPostalCode,
  Value<String?> gpsLocation,
  Value<String?> notes,
  Value<bool> deactivate,
  Value<bool> synced,
  Value<bool> auditFlag,
});
typedef $$CustomersTableUpdateCompanionBuilder = CustomersCompanion Function({
  Value<int> id,
  Value<String> businessName,
  Value<String?> siteAddress,
  Value<String?> siteCity,
  Value<String?> siteProvince,
  Value<String?> sitePostalCode,
  Value<String?> billingAddress,
  Value<String?> billingCity,
  Value<String?> billingProvince,
  Value<String?> billingPostalCode,
  Value<String?> gpsLocation,
  Value<String?> notes,
  Value<bool> deactivate,
  Value<bool> synced,
  Value<bool> auditFlag,
});

final class $$CustomersTableReferences
    extends BaseReferences<_$AppDatabase, $CustomersTable, Customer> {
  $$CustomersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ContactsTable, List<Contact>> _contactsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.contacts,
          aliasName:
              $_aliasNameGenerator(db.customers.id, db.contacts.customerId));

  $$ContactsTableProcessedTableManager get contactsRefs {
    final manager = $$ContactsTableTableManager($_db, $_db.contacts)
        .filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contactsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ScalesTable, List<Scale>> _scalesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.scales,
          aliasName:
              $_aliasNameGenerator(db.customers.id, db.scales.customerId));

  $$ScalesTableProcessedTableManager get scalesRefs {
    final manager = $$ScalesTableTableManager($_db, $_db.scales)
        .filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_scalesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get businessName => $composableBuilder(
      column: $table.businessName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteAddress => $composableBuilder(
      column: $table.siteAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteCity => $composableBuilder(
      column: $table.siteCity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteProvince => $composableBuilder(
      column: $table.siteProvince, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sitePostalCode => $composableBuilder(
      column: $table.sitePostalCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingCity => $composableBuilder(
      column: $table.billingCity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingProvince => $composableBuilder(
      column: $table.billingProvince,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingPostalCode => $composableBuilder(
      column: $table.billingPostalCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gpsLocation => $composableBuilder(
      column: $table.gpsLocation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag, builder: (column) => ColumnFilters(column));

  Expression<bool> contactsRefs(
      Expression<bool> Function($$ContactsTableFilterComposer f) f) {
    final $$ContactsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.contacts,
        getReferencedColumn: (t) => t.customerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContactsTableFilterComposer(
              $db: $db,
              $table: $db.contacts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> scalesRefs(
      Expression<bool> Function($$ScalesTableFilterComposer f) f) {
    final $$ScalesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.scales,
        getReferencedColumn: (t) => t.customerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ScalesTableFilterComposer(
              $db: $db,
              $table: $db.scales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get businessName => $composableBuilder(
      column: $table.businessName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteAddress => $composableBuilder(
      column: $table.siteAddress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteCity => $composableBuilder(
      column: $table.siteCity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteProvince => $composableBuilder(
      column: $table.siteProvince,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sitePostalCode => $composableBuilder(
      column: $table.sitePostalCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingCity => $composableBuilder(
      column: $table.billingCity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingProvince => $composableBuilder(
      column: $table.billingProvince,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingPostalCode => $composableBuilder(
      column: $table.billingPostalCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gpsLocation => $composableBuilder(
      column: $table.gpsLocation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag, builder: (column) => ColumnOrderings(column));
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get businessName => $composableBuilder(
      column: $table.businessName, builder: (column) => column);

  GeneratedColumn<String> get siteAddress => $composableBuilder(
      column: $table.siteAddress, builder: (column) => column);

  GeneratedColumn<String> get siteCity =>
      $composableBuilder(column: $table.siteCity, builder: (column) => column);

  GeneratedColumn<String> get siteProvince => $composableBuilder(
      column: $table.siteProvince, builder: (column) => column);

  GeneratedColumn<String> get sitePostalCode => $composableBuilder(
      column: $table.sitePostalCode, builder: (column) => column);

  GeneratedColumn<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress, builder: (column) => column);

  GeneratedColumn<String> get billingCity => $composableBuilder(
      column: $table.billingCity, builder: (column) => column);

  GeneratedColumn<String> get billingProvince => $composableBuilder(
      column: $table.billingProvince, builder: (column) => column);

  GeneratedColumn<String> get billingPostalCode => $composableBuilder(
      column: $table.billingPostalCode, builder: (column) => column);

  GeneratedColumn<String> get gpsLocation => $composableBuilder(
      column: $table.gpsLocation, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<bool> get auditFlag =>
      $composableBuilder(column: $table.auditFlag, builder: (column) => column);

  Expression<T> contactsRefs<T extends Object>(
      Expression<T> Function($$ContactsTableAnnotationComposer a) f) {
    final $$ContactsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.contacts,
        getReferencedColumn: (t) => t.customerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContactsTableAnnotationComposer(
              $db: $db,
              $table: $db.contacts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> scalesRefs<T extends Object>(
      Expression<T> Function($$ScalesTableAnnotationComposer a) f) {
    final $$ScalesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.scales,
        getReferencedColumn: (t) => t.customerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ScalesTableAnnotationComposer(
              $db: $db,
              $table: $db.scales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CustomersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomersTable,
    Customer,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (Customer, $$CustomersTableReferences),
    Customer,
    PrefetchHooks Function({bool contactsRefs, bool scalesRefs})> {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> businessName = const Value.absent(),
            Value<String?> siteAddress = const Value.absent(),
            Value<String?> siteCity = const Value.absent(),
            Value<String?> siteProvince = const Value.absent(),
            Value<String?> sitePostalCode = const Value.absent(),
            Value<String?> billingAddress = const Value.absent(),
            Value<String?> billingCity = const Value.absent(),
            Value<String?> billingProvince = const Value.absent(),
            Value<String?> billingPostalCode = const Value.absent(),
            Value<String?> gpsLocation = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> deactivate = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<bool> auditFlag = const Value.absent(),
          }) =>
              CustomersCompanion(
            id: id,
            businessName: businessName,
            siteAddress: siteAddress,
            siteCity: siteCity,
            siteProvince: siteProvince,
            sitePostalCode: sitePostalCode,
            billingAddress: billingAddress,
            billingCity: billingCity,
            billingProvince: billingProvince,
            billingPostalCode: billingPostalCode,
            gpsLocation: gpsLocation,
            notes: notes,
            deactivate: deactivate,
            synced: synced,
            auditFlag: auditFlag,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String businessName,
            Value<String?> siteAddress = const Value.absent(),
            Value<String?> siteCity = const Value.absent(),
            Value<String?> siteProvince = const Value.absent(),
            Value<String?> sitePostalCode = const Value.absent(),
            Value<String?> billingAddress = const Value.absent(),
            Value<String?> billingCity = const Value.absent(),
            Value<String?> billingProvince = const Value.absent(),
            Value<String?> billingPostalCode = const Value.absent(),
            Value<String?> gpsLocation = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> deactivate = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<bool> auditFlag = const Value.absent(),
          }) =>
              CustomersCompanion.insert(
            id: id,
            businessName: businessName,
            siteAddress: siteAddress,
            siteCity: siteCity,
            siteProvince: siteProvince,
            sitePostalCode: sitePostalCode,
            billingAddress: billingAddress,
            billingCity: billingCity,
            billingProvince: billingProvince,
            billingPostalCode: billingPostalCode,
            gpsLocation: gpsLocation,
            notes: notes,
            deactivate: deactivate,
            synced: synced,
            auditFlag: auditFlag,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CustomersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({contactsRefs = false, scalesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (contactsRefs) db.contacts,
                if (scalesRefs) db.scales
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (contactsRefs)
                    await $_getPrefetchedData<Customer, $CustomersTable,
                            Contact>(
                        currentTable: table,
                        referencedTable:
                            $$CustomersTableReferences._contactsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CustomersTableReferences(db, table, p0)
                                .contactsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.customerId == item.id),
                        typedResults: items),
                  if (scalesRefs)
                    await $_getPrefetchedData<Customer, $CustomersTable, Scale>(
                        currentTable: table,
                        referencedTable:
                            $$CustomersTableReferences._scalesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CustomersTableReferences(db, table, p0)
                                .scalesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.customerId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CustomersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomersTable,
    Customer,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (Customer, $$CustomersTableReferences),
    Customer,
    PrefetchHooks Function({bool contactsRefs, bool scalesRefs})>;
typedef $$ContactsTableCreateCompanionBuilder = ContactsCompanion Function({
  Value<int> id,
  required int customerId,
  required String name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> notes,
  Value<bool> isMain,
  Value<bool> deactivate,
  Value<bool> synced,
  Value<bool> auditFlag,
});
typedef $$ContactsTableUpdateCompanionBuilder = ContactsCompanion Function({
  Value<int> id,
  Value<int> customerId,
  Value<String> name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> notes,
  Value<bool> isMain,
  Value<bool> deactivate,
  Value<bool> synced,
  Value<bool> auditFlag,
});

final class $$ContactsTableReferences
    extends BaseReferences<_$AppDatabase, $ContactsTable, Contact> {
  $$ContactsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias(
          $_aliasNameGenerator(db.contacts.customerId, db.customers.id));

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<int>('customer_id')!;

    final manager = $$CustomersTableTableManager($_db, $_db.customers)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ContactsTableFilterComposer
    extends Composer<_$AppDatabase, $ContactsTable> {
  $$ContactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isMain => $composableBuilder(
      column: $table.isMain, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag, builder: (column) => ColumnFilters(column));

  $$CustomersTableFilterComposer get customerId {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerId,
        referencedTable: $db.customers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomersTableFilterComposer(
              $db: $db,
              $table: $db.customers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContactsTableOrderingComposer
    extends Composer<_$AppDatabase, $ContactsTable> {
  $$ContactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isMain => $composableBuilder(
      column: $table.isMain, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag, builder: (column) => ColumnOrderings(column));

  $$CustomersTableOrderingComposer get customerId {
    final $$CustomersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerId,
        referencedTable: $db.customers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomersTableOrderingComposer(
              $db: $db,
              $table: $db.customers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContactsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContactsTable> {
  $$ContactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isMain =>
      $composableBuilder(column: $table.isMain, builder: (column) => column);

  GeneratedColumn<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<bool> get auditFlag =>
      $composableBuilder(column: $table.auditFlag, builder: (column) => column);

  $$CustomersTableAnnotationComposer get customerId {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerId,
        referencedTable: $db.customers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomersTableAnnotationComposer(
              $db: $db,
              $table: $db.customers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContactsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContactsTable,
    Contact,
    $$ContactsTableFilterComposer,
    $$ContactsTableOrderingComposer,
    $$ContactsTableAnnotationComposer,
    $$ContactsTableCreateCompanionBuilder,
    $$ContactsTableUpdateCompanionBuilder,
    (Contact, $$ContactsTableReferences),
    Contact,
    PrefetchHooks Function({bool customerId})> {
  $$ContactsTableTableManager(_$AppDatabase db, $ContactsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> customerId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isMain = const Value.absent(),
            Value<bool> deactivate = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<bool> auditFlag = const Value.absent(),
          }) =>
              ContactsCompanion(
            id: id,
            customerId: customerId,
            name: name,
            phone: phone,
            email: email,
            notes: notes,
            isMain: isMain,
            deactivate: deactivate,
            synced: synced,
            auditFlag: auditFlag,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int customerId,
            required String name,
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isMain = const Value.absent(),
            Value<bool> deactivate = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<bool> auditFlag = const Value.absent(),
          }) =>
              ContactsCompanion.insert(
            id: id,
            customerId: customerId,
            name: name,
            phone: phone,
            email: email,
            notes: notes,
            isMain: isMain,
            deactivate: deactivate,
            synced: synced,
            auditFlag: auditFlag,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ContactsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({customerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (customerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.customerId,
                    referencedTable:
                        $$ContactsTableReferences._customerIdTable(db),
                    referencedColumn:
                        $$ContactsTableReferences._customerIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ContactsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContactsTable,
    Contact,
    $$ContactsTableFilterComposer,
    $$ContactsTableOrderingComposer,
    $$ContactsTableAnnotationComposer,
    $$ContactsTableCreateCompanionBuilder,
    $$ContactsTableUpdateCompanionBuilder,
    (Contact, $$ContactsTableReferences),
    Contact,
    PrefetchHooks Function({bool customerId})>;
typedef $$WorkOrdersTableCreateCompanionBuilder = WorkOrdersCompanion Function({
  Value<int> id,
  required int customerId,
  required String workOrderNumber,
  required String siteAddress,
  required String siteCity,
  required String siteProvince,
  required String sitePostalCode,
  Value<String?> billingAddress,
  Value<String?> billingCity,
  Value<String?> billingProvince,
  Value<String?> billingPostalCode,
  required String gpsLocation,
  Value<String> customerNotes,
  Value<bool> auditFlag,
  Value<bool> synced,
  Value<DateTime> lastModified,
});
typedef $$WorkOrdersTableUpdateCompanionBuilder = WorkOrdersCompanion Function({
  Value<int> id,
  Value<int> customerId,
  Value<String> workOrderNumber,
  Value<String> siteAddress,
  Value<String> siteCity,
  Value<String> siteProvince,
  Value<String> sitePostalCode,
  Value<String?> billingAddress,
  Value<String?> billingCity,
  Value<String?> billingProvince,
  Value<String?> billingPostalCode,
  Value<String> gpsLocation,
  Value<String> customerNotes,
  Value<bool> auditFlag,
  Value<bool> synced,
  Value<DateTime> lastModified,
});

final class $$WorkOrdersTableReferences
    extends BaseReferences<_$AppDatabase, $WorkOrdersTable, WorkOrder> {
  $$WorkOrdersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ServiceReportsTable, List<ServiceReport>>
      _serviceReportsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.serviceReports,
              aliasName: $_aliasNameGenerator(
                  db.workOrders.id, db.serviceReports.workOrderId));

  $$ServiceReportsTableProcessedTableManager get serviceReportsRefs {
    final manager = $$ServiceReportsTableTableManager($_db, $_db.serviceReports)
        .filter((f) => f.workOrderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_serviceReportsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkOrdersTableFilterComposer
    extends Composer<_$AppDatabase, $WorkOrdersTable> {
  $$WorkOrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workOrderNumber => $composableBuilder(
      column: $table.workOrderNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteAddress => $composableBuilder(
      column: $table.siteAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteCity => $composableBuilder(
      column: $table.siteCity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteProvince => $composableBuilder(
      column: $table.siteProvince, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sitePostalCode => $composableBuilder(
      column: $table.sitePostalCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingCity => $composableBuilder(
      column: $table.billingCity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingProvince => $composableBuilder(
      column: $table.billingProvince,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingPostalCode => $composableBuilder(
      column: $table.billingPostalCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gpsLocation => $composableBuilder(
      column: $table.gpsLocation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerNotes => $composableBuilder(
      column: $table.customerNotes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => ColumnFilters(column));

  Expression<bool> serviceReportsRefs(
      Expression<bool> Function($$ServiceReportsTableFilterComposer f) f) {
    final $$ServiceReportsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.serviceReports,
        getReferencedColumn: (t) => t.workOrderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ServiceReportsTableFilterComposer(
              $db: $db,
              $table: $db.serviceReports,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkOrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkOrdersTable> {
  $$WorkOrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workOrderNumber => $composableBuilder(
      column: $table.workOrderNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteAddress => $composableBuilder(
      column: $table.siteAddress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteCity => $composableBuilder(
      column: $table.siteCity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteProvince => $composableBuilder(
      column: $table.siteProvince,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sitePostalCode => $composableBuilder(
      column: $table.sitePostalCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingCity => $composableBuilder(
      column: $table.billingCity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingProvince => $composableBuilder(
      column: $table.billingProvince,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingPostalCode => $composableBuilder(
      column: $table.billingPostalCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gpsLocation => $composableBuilder(
      column: $table.gpsLocation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerNotes => $composableBuilder(
      column: $table.customerNotes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified,
      builder: (column) => ColumnOrderings(column));
}

class $$WorkOrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkOrdersTable> {
  $$WorkOrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => column);

  GeneratedColumn<String> get workOrderNumber => $composableBuilder(
      column: $table.workOrderNumber, builder: (column) => column);

  GeneratedColumn<String> get siteAddress => $composableBuilder(
      column: $table.siteAddress, builder: (column) => column);

  GeneratedColumn<String> get siteCity =>
      $composableBuilder(column: $table.siteCity, builder: (column) => column);

  GeneratedColumn<String> get siteProvince => $composableBuilder(
      column: $table.siteProvince, builder: (column) => column);

  GeneratedColumn<String> get sitePostalCode => $composableBuilder(
      column: $table.sitePostalCode, builder: (column) => column);

  GeneratedColumn<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress, builder: (column) => column);

  GeneratedColumn<String> get billingCity => $composableBuilder(
      column: $table.billingCity, builder: (column) => column);

  GeneratedColumn<String> get billingProvince => $composableBuilder(
      column: $table.billingProvince, builder: (column) => column);

  GeneratedColumn<String> get billingPostalCode => $composableBuilder(
      column: $table.billingPostalCode, builder: (column) => column);

  GeneratedColumn<String> get gpsLocation => $composableBuilder(
      column: $table.gpsLocation, builder: (column) => column);

  GeneratedColumn<String> get customerNotes => $composableBuilder(
      column: $table.customerNotes, builder: (column) => column);

  GeneratedColumn<bool> get auditFlag =>
      $composableBuilder(column: $table.auditFlag, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => column);

  Expression<T> serviceReportsRefs<T extends Object>(
      Expression<T> Function($$ServiceReportsTableAnnotationComposer a) f) {
    final $$ServiceReportsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.serviceReports,
        getReferencedColumn: (t) => t.workOrderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ServiceReportsTableAnnotationComposer(
              $db: $db,
              $table: $db.serviceReports,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkOrdersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkOrdersTable,
    WorkOrder,
    $$WorkOrdersTableFilterComposer,
    $$WorkOrdersTableOrderingComposer,
    $$WorkOrdersTableAnnotationComposer,
    $$WorkOrdersTableCreateCompanionBuilder,
    $$WorkOrdersTableUpdateCompanionBuilder,
    (WorkOrder, $$WorkOrdersTableReferences),
    WorkOrder,
    PrefetchHooks Function({bool serviceReportsRefs})> {
  $$WorkOrdersTableTableManager(_$AppDatabase db, $WorkOrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkOrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkOrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkOrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> customerId = const Value.absent(),
            Value<String> workOrderNumber = const Value.absent(),
            Value<String> siteAddress = const Value.absent(),
            Value<String> siteCity = const Value.absent(),
            Value<String> siteProvince = const Value.absent(),
            Value<String> sitePostalCode = const Value.absent(),
            Value<String?> billingAddress = const Value.absent(),
            Value<String?> billingCity = const Value.absent(),
            Value<String?> billingProvince = const Value.absent(),
            Value<String?> billingPostalCode = const Value.absent(),
            Value<String> gpsLocation = const Value.absent(),
            Value<String> customerNotes = const Value.absent(),
            Value<bool> auditFlag = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<DateTime> lastModified = const Value.absent(),
          }) =>
              WorkOrdersCompanion(
            id: id,
            customerId: customerId,
            workOrderNumber: workOrderNumber,
            siteAddress: siteAddress,
            siteCity: siteCity,
            siteProvince: siteProvince,
            sitePostalCode: sitePostalCode,
            billingAddress: billingAddress,
            billingCity: billingCity,
            billingProvince: billingProvince,
            billingPostalCode: billingPostalCode,
            gpsLocation: gpsLocation,
            customerNotes: customerNotes,
            auditFlag: auditFlag,
            synced: synced,
            lastModified: lastModified,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int customerId,
            required String workOrderNumber,
            required String siteAddress,
            required String siteCity,
            required String siteProvince,
            required String sitePostalCode,
            Value<String?> billingAddress = const Value.absent(),
            Value<String?> billingCity = const Value.absent(),
            Value<String?> billingProvince = const Value.absent(),
            Value<String?> billingPostalCode = const Value.absent(),
            required String gpsLocation,
            Value<String> customerNotes = const Value.absent(),
            Value<bool> auditFlag = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<DateTime> lastModified = const Value.absent(),
          }) =>
              WorkOrdersCompanion.insert(
            id: id,
            customerId: customerId,
            workOrderNumber: workOrderNumber,
            siteAddress: siteAddress,
            siteCity: siteCity,
            siteProvince: siteProvince,
            sitePostalCode: sitePostalCode,
            billingAddress: billingAddress,
            billingCity: billingCity,
            billingProvince: billingProvince,
            billingPostalCode: billingPostalCode,
            gpsLocation: gpsLocation,
            customerNotes: customerNotes,
            auditFlag: auditFlag,
            synced: synced,
            lastModified: lastModified,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkOrdersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({serviceReportsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (serviceReportsRefs) db.serviceReports
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (serviceReportsRefs)
                    await $_getPrefetchedData<WorkOrder, $WorkOrdersTable,
                            ServiceReport>(
                        currentTable: table,
                        referencedTable: $$WorkOrdersTableReferences
                            ._serviceReportsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkOrdersTableReferences(db, table, p0)
                                .serviceReportsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workOrderId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorkOrdersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkOrdersTable,
    WorkOrder,
    $$WorkOrdersTableFilterComposer,
    $$WorkOrdersTableOrderingComposer,
    $$WorkOrdersTableAnnotationComposer,
    $$WorkOrdersTableCreateCompanionBuilder,
    $$WorkOrdersTableUpdateCompanionBuilder,
    (WorkOrder, $$WorkOrdersTableReferences),
    WorkOrder,
    PrefetchHooks Function({bool serviceReportsRefs})>;
typedef $$ScalesTableCreateCompanionBuilder = ScalesCompanion Function({
  Value<int> id,
  required int customerId,
  required bool configuration,
  required String scaleType,
  required String indicatorMake,
  required String indicatorModel,
  required String indicatorSerial,
  required String approvalPrefix,
  required String approvalNumber,
  Value<String?> baseMake,
  Value<String?> baseModel,
  Value<String?> baseSerial,
  Value<String?> baseApprovalPrefix,
  Value<String?> baseApprovalNumber,
  required double capacity,
  required String capacityUnit,
  required double division,
  required int numberOfLoadCells,
  required int numberOfSections,
  required String loadCellModel,
  required double loadCellCapacity,
  required String loadCellCapacityUnit,
  Value<String?> notes,
  Value<bool> deactivate,
  Value<bool> auditFlag,
  Value<bool> synced,
});
typedef $$ScalesTableUpdateCompanionBuilder = ScalesCompanion Function({
  Value<int> id,
  Value<int> customerId,
  Value<bool> configuration,
  Value<String> scaleType,
  Value<String> indicatorMake,
  Value<String> indicatorModel,
  Value<String> indicatorSerial,
  Value<String> approvalPrefix,
  Value<String> approvalNumber,
  Value<String?> baseMake,
  Value<String?> baseModel,
  Value<String?> baseSerial,
  Value<String?> baseApprovalPrefix,
  Value<String?> baseApprovalNumber,
  Value<double> capacity,
  Value<String> capacityUnit,
  Value<double> division,
  Value<int> numberOfLoadCells,
  Value<int> numberOfSections,
  Value<String> loadCellModel,
  Value<double> loadCellCapacity,
  Value<String> loadCellCapacityUnit,
  Value<String?> notes,
  Value<bool> deactivate,
  Value<bool> auditFlag,
  Value<bool> synced,
});

final class $$ScalesTableReferences
    extends BaseReferences<_$AppDatabase, $ScalesTable, Scale> {
  $$ScalesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) => db.customers
      .createAlias($_aliasNameGenerator(db.scales.customerId, db.customers.id));

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<int>('customer_id')!;

    final manager = $$CustomersTableTableManager($_db, $_db.customers)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ServiceReportsTable, List<ServiceReport>>
      _serviceReportsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.serviceReports,
              aliasName: $_aliasNameGenerator(
                  db.scales.id, db.serviceReports.scaleId));

  $$ServiceReportsTableProcessedTableManager get serviceReportsRefs {
    final manager = $$ServiceReportsTableTableManager($_db, $_db.serviceReports)
        .filter((f) => f.scaleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_serviceReportsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ScalesTableFilterComposer
    extends Composer<_$AppDatabase, $ScalesTable> {
  $$ScalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get configuration => $composableBuilder(
      column: $table.configuration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scaleType => $composableBuilder(
      column: $table.scaleType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get indicatorMake => $composableBuilder(
      column: $table.indicatorMake, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get indicatorModel => $composableBuilder(
      column: $table.indicatorModel,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get indicatorSerial => $composableBuilder(
      column: $table.indicatorSerial,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get approvalPrefix => $composableBuilder(
      column: $table.approvalPrefix,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get approvalNumber => $composableBuilder(
      column: $table.approvalNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get baseMake => $composableBuilder(
      column: $table.baseMake, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get baseModel => $composableBuilder(
      column: $table.baseModel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get baseSerial => $composableBuilder(
      column: $table.baseSerial, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get baseApprovalPrefix => $composableBuilder(
      column: $table.baseApprovalPrefix,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get baseApprovalNumber => $composableBuilder(
      column: $table.baseApprovalNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get capacity => $composableBuilder(
      column: $table.capacity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get capacityUnit => $composableBuilder(
      column: $table.capacityUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get division => $composableBuilder(
      column: $table.division, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfLoadCells => $composableBuilder(
      column: $table.numberOfLoadCells,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfSections => $composableBuilder(
      column: $table.numberOfSections,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loadCellModel => $composableBuilder(
      column: $table.loadCellModel, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get loadCellCapacity => $composableBuilder(
      column: $table.loadCellCapacity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loadCellCapacityUnit => $composableBuilder(
      column: $table.loadCellCapacityUnit,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  $$CustomersTableFilterComposer get customerId {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerId,
        referencedTable: $db.customers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomersTableFilterComposer(
              $db: $db,
              $table: $db.customers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> serviceReportsRefs(
      Expression<bool> Function($$ServiceReportsTableFilterComposer f) f) {
    final $$ServiceReportsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.serviceReports,
        getReferencedColumn: (t) => t.scaleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ServiceReportsTableFilterComposer(
              $db: $db,
              $table: $db.serviceReports,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ScalesTableOrderingComposer
    extends Composer<_$AppDatabase, $ScalesTable> {
  $$ScalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get configuration => $composableBuilder(
      column: $table.configuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scaleType => $composableBuilder(
      column: $table.scaleType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get indicatorMake => $composableBuilder(
      column: $table.indicatorMake,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get indicatorModel => $composableBuilder(
      column: $table.indicatorModel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get indicatorSerial => $composableBuilder(
      column: $table.indicatorSerial,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get approvalPrefix => $composableBuilder(
      column: $table.approvalPrefix,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get approvalNumber => $composableBuilder(
      column: $table.approvalNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get baseMake => $composableBuilder(
      column: $table.baseMake, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get baseModel => $composableBuilder(
      column: $table.baseModel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get baseSerial => $composableBuilder(
      column: $table.baseSerial, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get baseApprovalPrefix => $composableBuilder(
      column: $table.baseApprovalPrefix,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get baseApprovalNumber => $composableBuilder(
      column: $table.baseApprovalNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get capacity => $composableBuilder(
      column: $table.capacity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get capacityUnit => $composableBuilder(
      column: $table.capacityUnit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get division => $composableBuilder(
      column: $table.division, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfLoadCells => $composableBuilder(
      column: $table.numberOfLoadCells,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfSections => $composableBuilder(
      column: $table.numberOfSections,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loadCellModel => $composableBuilder(
      column: $table.loadCellModel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get loadCellCapacity => $composableBuilder(
      column: $table.loadCellCapacity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loadCellCapacityUnit => $composableBuilder(
      column: $table.loadCellCapacityUnit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  $$CustomersTableOrderingComposer get customerId {
    final $$CustomersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerId,
        referencedTable: $db.customers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomersTableOrderingComposer(
              $db: $db,
              $table: $db.customers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ScalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScalesTable> {
  $$ScalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get configuration => $composableBuilder(
      column: $table.configuration, builder: (column) => column);

  GeneratedColumn<String> get scaleType =>
      $composableBuilder(column: $table.scaleType, builder: (column) => column);

  GeneratedColumn<String> get indicatorMake => $composableBuilder(
      column: $table.indicatorMake, builder: (column) => column);

  GeneratedColumn<String> get indicatorModel => $composableBuilder(
      column: $table.indicatorModel, builder: (column) => column);

  GeneratedColumn<String> get indicatorSerial => $composableBuilder(
      column: $table.indicatorSerial, builder: (column) => column);

  GeneratedColumn<String> get approvalPrefix => $composableBuilder(
      column: $table.approvalPrefix, builder: (column) => column);

  GeneratedColumn<String> get approvalNumber => $composableBuilder(
      column: $table.approvalNumber, builder: (column) => column);

  GeneratedColumn<String> get baseMake =>
      $composableBuilder(column: $table.baseMake, builder: (column) => column);

  GeneratedColumn<String> get baseModel =>
      $composableBuilder(column: $table.baseModel, builder: (column) => column);

  GeneratedColumn<String> get baseSerial => $composableBuilder(
      column: $table.baseSerial, builder: (column) => column);

  GeneratedColumn<String> get baseApprovalPrefix => $composableBuilder(
      column: $table.baseApprovalPrefix, builder: (column) => column);

  GeneratedColumn<String> get baseApprovalNumber => $composableBuilder(
      column: $table.baseApprovalNumber, builder: (column) => column);

  GeneratedColumn<double> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<String> get capacityUnit => $composableBuilder(
      column: $table.capacityUnit, builder: (column) => column);

  GeneratedColumn<double> get division =>
      $composableBuilder(column: $table.division, builder: (column) => column);

  GeneratedColumn<int> get numberOfLoadCells => $composableBuilder(
      column: $table.numberOfLoadCells, builder: (column) => column);

  GeneratedColumn<int> get numberOfSections => $composableBuilder(
      column: $table.numberOfSections, builder: (column) => column);

  GeneratedColumn<String> get loadCellModel => $composableBuilder(
      column: $table.loadCellModel, builder: (column) => column);

  GeneratedColumn<double> get loadCellCapacity => $composableBuilder(
      column: $table.loadCellCapacity, builder: (column) => column);

  GeneratedColumn<String> get loadCellCapacityUnit => $composableBuilder(
      column: $table.loadCellCapacityUnit, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => column);

  GeneratedColumn<bool> get auditFlag =>
      $composableBuilder(column: $table.auditFlag, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  $$CustomersTableAnnotationComposer get customerId {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerId,
        referencedTable: $db.customers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomersTableAnnotationComposer(
              $db: $db,
              $table: $db.customers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> serviceReportsRefs<T extends Object>(
      Expression<T> Function($$ServiceReportsTableAnnotationComposer a) f) {
    final $$ServiceReportsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.serviceReports,
        getReferencedColumn: (t) => t.scaleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ServiceReportsTableAnnotationComposer(
              $db: $db,
              $table: $db.serviceReports,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ScalesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ScalesTable,
    Scale,
    $$ScalesTableFilterComposer,
    $$ScalesTableOrderingComposer,
    $$ScalesTableAnnotationComposer,
    $$ScalesTableCreateCompanionBuilder,
    $$ScalesTableUpdateCompanionBuilder,
    (Scale, $$ScalesTableReferences),
    Scale,
    PrefetchHooks Function({bool customerId, bool serviceReportsRefs})> {
  $$ScalesTableTableManager(_$AppDatabase db, $ScalesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> customerId = const Value.absent(),
            Value<bool> configuration = const Value.absent(),
            Value<String> scaleType = const Value.absent(),
            Value<String> indicatorMake = const Value.absent(),
            Value<String> indicatorModel = const Value.absent(),
            Value<String> indicatorSerial = const Value.absent(),
            Value<String> approvalPrefix = const Value.absent(),
            Value<String> approvalNumber = const Value.absent(),
            Value<String?> baseMake = const Value.absent(),
            Value<String?> baseModel = const Value.absent(),
            Value<String?> baseSerial = const Value.absent(),
            Value<String?> baseApprovalPrefix = const Value.absent(),
            Value<String?> baseApprovalNumber = const Value.absent(),
            Value<double> capacity = const Value.absent(),
            Value<String> capacityUnit = const Value.absent(),
            Value<double> division = const Value.absent(),
            Value<int> numberOfLoadCells = const Value.absent(),
            Value<int> numberOfSections = const Value.absent(),
            Value<String> loadCellModel = const Value.absent(),
            Value<double> loadCellCapacity = const Value.absent(),
            Value<String> loadCellCapacityUnit = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> deactivate = const Value.absent(),
            Value<bool> auditFlag = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              ScalesCompanion(
            id: id,
            customerId: customerId,
            configuration: configuration,
            scaleType: scaleType,
            indicatorMake: indicatorMake,
            indicatorModel: indicatorModel,
            indicatorSerial: indicatorSerial,
            approvalPrefix: approvalPrefix,
            approvalNumber: approvalNumber,
            baseMake: baseMake,
            baseModel: baseModel,
            baseSerial: baseSerial,
            baseApprovalPrefix: baseApprovalPrefix,
            baseApprovalNumber: baseApprovalNumber,
            capacity: capacity,
            capacityUnit: capacityUnit,
            division: division,
            numberOfLoadCells: numberOfLoadCells,
            numberOfSections: numberOfSections,
            loadCellModel: loadCellModel,
            loadCellCapacity: loadCellCapacity,
            loadCellCapacityUnit: loadCellCapacityUnit,
            notes: notes,
            deactivate: deactivate,
            auditFlag: auditFlag,
            synced: synced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int customerId,
            required bool configuration,
            required String scaleType,
            required String indicatorMake,
            required String indicatorModel,
            required String indicatorSerial,
            required String approvalPrefix,
            required String approvalNumber,
            Value<String?> baseMake = const Value.absent(),
            Value<String?> baseModel = const Value.absent(),
            Value<String?> baseSerial = const Value.absent(),
            Value<String?> baseApprovalPrefix = const Value.absent(),
            Value<String?> baseApprovalNumber = const Value.absent(),
            required double capacity,
            required String capacityUnit,
            required double division,
            required int numberOfLoadCells,
            required int numberOfSections,
            required String loadCellModel,
            required double loadCellCapacity,
            required String loadCellCapacityUnit,
            Value<String?> notes = const Value.absent(),
            Value<bool> deactivate = const Value.absent(),
            Value<bool> auditFlag = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              ScalesCompanion.insert(
            id: id,
            customerId: customerId,
            configuration: configuration,
            scaleType: scaleType,
            indicatorMake: indicatorMake,
            indicatorModel: indicatorModel,
            indicatorSerial: indicatorSerial,
            approvalPrefix: approvalPrefix,
            approvalNumber: approvalNumber,
            baseMake: baseMake,
            baseModel: baseModel,
            baseSerial: baseSerial,
            baseApprovalPrefix: baseApprovalPrefix,
            baseApprovalNumber: baseApprovalNumber,
            capacity: capacity,
            capacityUnit: capacityUnit,
            division: division,
            numberOfLoadCells: numberOfLoadCells,
            numberOfSections: numberOfSections,
            loadCellModel: loadCellModel,
            loadCellCapacity: loadCellCapacity,
            loadCellCapacityUnit: loadCellCapacityUnit,
            notes: notes,
            deactivate: deactivate,
            auditFlag: auditFlag,
            synced: synced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ScalesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {customerId = false, serviceReportsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (serviceReportsRefs) db.serviceReports
              ],
              addJoins: <
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
                      dynamic>>(state) {
                if (customerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.customerId,
                    referencedTable:
                        $$ScalesTableReferences._customerIdTable(db),
                    referencedColumn:
                        $$ScalesTableReferences._customerIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (serviceReportsRefs)
                    await $_getPrefetchedData<Scale, $ScalesTable,
                            ServiceReport>(
                        currentTable: table,
                        referencedTable: $$ScalesTableReferences
                            ._serviceReportsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ScalesTableReferences(db, table, p0)
                                .serviceReportsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.scaleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ScalesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ScalesTable,
    Scale,
    $$ScalesTableFilterComposer,
    $$ScalesTableOrderingComposer,
    $$ScalesTableAnnotationComposer,
    $$ScalesTableCreateCompanionBuilder,
    $$ScalesTableUpdateCompanionBuilder,
    (Scale, $$ScalesTableReferences),
    Scale,
    PrefetchHooks Function({bool customerId, bool serviceReportsRefs})>;
typedef $$ServiceReportsTableCreateCompanionBuilder = ServiceReportsCompanion
    Function({
  Value<int> id,
  required int workOrderId,
  required int scaleId,
  required String reportType,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<bool> complete,
  Value<bool> synced,
});
typedef $$ServiceReportsTableUpdateCompanionBuilder = ServiceReportsCompanion
    Function({
  Value<int> id,
  Value<int> workOrderId,
  Value<int> scaleId,
  Value<String> reportType,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<bool> complete,
  Value<bool> synced,
});

final class $$ServiceReportsTableReferences
    extends BaseReferences<_$AppDatabase, $ServiceReportsTable, ServiceReport> {
  $$ServiceReportsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkOrdersTable _workOrderIdTable(_$AppDatabase db) =>
      db.workOrders.createAlias($_aliasNameGenerator(
          db.serviceReports.workOrderId, db.workOrders.id));

  $$WorkOrdersTableProcessedTableManager get workOrderId {
    final $_column = $_itemColumn<int>('work_order_id')!;

    final manager = $$WorkOrdersTableTableManager($_db, $_db.workOrders)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workOrderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ScalesTable _scaleIdTable(_$AppDatabase db) => db.scales.createAlias(
      $_aliasNameGenerator(db.serviceReports.scaleId, db.scales.id));

  $$ScalesTableProcessedTableManager get scaleId {
    final $_column = $_itemColumn<int>('scale_id')!;

    final manager = $$ScalesTableTableManager($_db, $_db.scales)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_scaleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ServiceReportsTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceReportsTable> {
  $$ServiceReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get complete => $composableBuilder(
      column: $table.complete, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  $$WorkOrdersTableFilterComposer get workOrderId {
    final $$WorkOrdersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workOrderId,
        referencedTable: $db.workOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkOrdersTableFilterComposer(
              $db: $db,
              $table: $db.workOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ScalesTableFilterComposer get scaleId {
    final $$ScalesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scaleId,
        referencedTable: $db.scales,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ScalesTableFilterComposer(
              $db: $db,
              $table: $db.scales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ServiceReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceReportsTable> {
  $$ServiceReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get complete => $composableBuilder(
      column: $table.complete, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  $$WorkOrdersTableOrderingComposer get workOrderId {
    final $$WorkOrdersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workOrderId,
        referencedTable: $db.workOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkOrdersTableOrderingComposer(
              $db: $db,
              $table: $db.workOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ScalesTableOrderingComposer get scaleId {
    final $$ScalesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scaleId,
        referencedTable: $db.scales,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ScalesTableOrderingComposer(
              $db: $db,
              $table: $db.scales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ServiceReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceReportsTable> {
  $$ServiceReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get complete =>
      $composableBuilder(column: $table.complete, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  $$WorkOrdersTableAnnotationComposer get workOrderId {
    final $$WorkOrdersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workOrderId,
        referencedTable: $db.workOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkOrdersTableAnnotationComposer(
              $db: $db,
              $table: $db.workOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ScalesTableAnnotationComposer get scaleId {
    final $$ScalesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scaleId,
        referencedTable: $db.scales,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ScalesTableAnnotationComposer(
              $db: $db,
              $table: $db.scales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ServiceReportsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ServiceReportsTable,
    ServiceReport,
    $$ServiceReportsTableFilterComposer,
    $$ServiceReportsTableOrderingComposer,
    $$ServiceReportsTableAnnotationComposer,
    $$ServiceReportsTableCreateCompanionBuilder,
    $$ServiceReportsTableUpdateCompanionBuilder,
    (ServiceReport, $$ServiceReportsTableReferences),
    ServiceReport,
    PrefetchHooks Function({bool workOrderId, bool scaleId})> {
  $$ServiceReportsTableTableManager(
      _$AppDatabase db, $ServiceReportsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> workOrderId = const Value.absent(),
            Value<int> scaleId = const Value.absent(),
            Value<String> reportType = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> complete = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              ServiceReportsCompanion(
            id: id,
            workOrderId: workOrderId,
            scaleId: scaleId,
            reportType: reportType,
            notes: notes,
            createdAt: createdAt,
            complete: complete,
            synced: synced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int workOrderId,
            required int scaleId,
            required String reportType,
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> complete = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              ServiceReportsCompanion.insert(
            id: id,
            workOrderId: workOrderId,
            scaleId: scaleId,
            reportType: reportType,
            notes: notes,
            createdAt: createdAt,
            complete: complete,
            synced: synced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ServiceReportsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workOrderId = false, scaleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (workOrderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workOrderId,
                    referencedTable:
                        $$ServiceReportsTableReferences._workOrderIdTable(db),
                    referencedColumn: $$ServiceReportsTableReferences
                        ._workOrderIdTable(db)
                        .id,
                  ) as T;
                }
                if (scaleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.scaleId,
                    referencedTable:
                        $$ServiceReportsTableReferences._scaleIdTable(db),
                    referencedColumn:
                        $$ServiceReportsTableReferences._scaleIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ServiceReportsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ServiceReportsTable,
    ServiceReport,
    $$ServiceReportsTableFilterComposer,
    $$ServiceReportsTableOrderingComposer,
    $$ServiceReportsTableAnnotationComposer,
    $$ServiceReportsTableCreateCompanionBuilder,
    $$ServiceReportsTableUpdateCompanionBuilder,
    (ServiceReport, $$ServiceReportsTableReferences),
    ServiceReport,
    PrefetchHooks Function({bool workOrderId, bool scaleId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$ContactsTableTableManager get contacts =>
      $$ContactsTableTableManager(_db, _db.contacts);
  $$WorkOrdersTableTableManager get workOrders =>
      $$WorkOrdersTableTableManager(_db, _db.workOrders);
  $$ScalesTableTableManager get scales =>
      $$ScalesTableTableManager(_db, _db.scales);
  $$ServiceReportsTableTableManager get serviceReports =>
      $$ServiceReportsTableTableManager(_db, _db.serviceReports);
}
