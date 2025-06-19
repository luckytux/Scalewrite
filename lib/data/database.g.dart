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
  static const VerificationMeta _scaleSubtypeMeta =
      const VerificationMeta('scaleSubtype');
  @override
  late final GeneratedColumn<String> scaleSubtype = GeneratedColumn<String>(
      'scale_subtype', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _customTypeDescriptionMeta =
      const VerificationMeta('customTypeDescription');
  @override
  late final GeneratedColumn<String> customTypeDescription =
      GeneratedColumn<String>('custom_type_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
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
  static const VerificationMeta _legalForTradeMeta =
      const VerificationMeta('legalForTrade');
  @override
  late final GeneratedColumn<bool> legalForTrade = GeneratedColumn<bool>(
      'legal_for_trade', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("legal_for_trade" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _inspectionExpiryMeta =
      const VerificationMeta('inspectionExpiry');
  @override
  late final GeneratedColumn<DateTime> inspectionExpiry =
      GeneratedColumn<DateTime>('inspection_expiry', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _sealStatusMeta =
      const VerificationMeta('sealStatus');
  @override
  late final GeneratedColumn<String> sealStatus = GeneratedColumn<String>(
      'seal_status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _inspectionResultMeta =
      const VerificationMeta('inspectionResult');
  @override
  late final GeneratedColumn<String> inspectionResult = GeneratedColumn<String>(
      'inspection_result', aliasedName, true,
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
        scaleSubtype,
        customTypeDescription,
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
        legalForTrade,
        inspectionExpiry,
        sealStatus,
        inspectionResult,
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
    if (data.containsKey('scale_subtype')) {
      context.handle(
          _scaleSubtypeMeta,
          scaleSubtype.isAcceptableOrUnknown(
              data['scale_subtype']!, _scaleSubtypeMeta));
    } else if (isInserting) {
      context.missing(_scaleSubtypeMeta);
    }
    if (data.containsKey('custom_type_description')) {
      context.handle(
          _customTypeDescriptionMeta,
          customTypeDescription.isAcceptableOrUnknown(
              data['custom_type_description']!, _customTypeDescriptionMeta));
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
    if (data.containsKey('legal_for_trade')) {
      context.handle(
          _legalForTradeMeta,
          legalForTrade.isAcceptableOrUnknown(
              data['legal_for_trade']!, _legalForTradeMeta));
    }
    if (data.containsKey('inspection_expiry')) {
      context.handle(
          _inspectionExpiryMeta,
          inspectionExpiry.isAcceptableOrUnknown(
              data['inspection_expiry']!, _inspectionExpiryMeta));
    }
    if (data.containsKey('seal_status')) {
      context.handle(
          _sealStatusMeta,
          sealStatus.isAcceptableOrUnknown(
              data['seal_status']!, _sealStatusMeta));
    }
    if (data.containsKey('inspection_result')) {
      context.handle(
          _inspectionResultMeta,
          inspectionResult.isAcceptableOrUnknown(
              data['inspection_result']!, _inspectionResultMeta));
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
      scaleSubtype: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scale_subtype'])!,
      customTypeDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}custom_type_description']),
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
      legalForTrade: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}legal_for_trade'])!,
      inspectionExpiry: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}inspection_expiry']),
      sealStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}seal_status']),
      inspectionResult: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}inspection_result']),
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
  final String scaleSubtype;
  final String? customTypeDescription;
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
  final bool legalForTrade;
  final DateTime? inspectionExpiry;
  final String? sealStatus;
  final String? inspectionResult;
  final String? notes;
  final bool deactivate;
  final bool auditFlag;
  final bool synced;
  const Scale(
      {required this.id,
      required this.customerId,
      required this.configuration,
      required this.scaleType,
      required this.scaleSubtype,
      this.customTypeDescription,
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
      required this.legalForTrade,
      this.inspectionExpiry,
      this.sealStatus,
      this.inspectionResult,
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
    map['scale_subtype'] = Variable<String>(scaleSubtype);
    if (!nullToAbsent || customTypeDescription != null) {
      map['custom_type_description'] = Variable<String>(customTypeDescription);
    }
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
    map['legal_for_trade'] = Variable<bool>(legalForTrade);
    if (!nullToAbsent || inspectionExpiry != null) {
      map['inspection_expiry'] = Variable<DateTime>(inspectionExpiry);
    }
    if (!nullToAbsent || sealStatus != null) {
      map['seal_status'] = Variable<String>(sealStatus);
    }
    if (!nullToAbsent || inspectionResult != null) {
      map['inspection_result'] = Variable<String>(inspectionResult);
    }
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
      scaleSubtype: Value(scaleSubtype),
      customTypeDescription: customTypeDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(customTypeDescription),
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
      legalForTrade: Value(legalForTrade),
      inspectionExpiry: inspectionExpiry == null && nullToAbsent
          ? const Value.absent()
          : Value(inspectionExpiry),
      sealStatus: sealStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(sealStatus),
      inspectionResult: inspectionResult == null && nullToAbsent
          ? const Value.absent()
          : Value(inspectionResult),
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
      scaleSubtype: serializer.fromJson<String>(json['scaleSubtype']),
      customTypeDescription:
          serializer.fromJson<String?>(json['customTypeDescription']),
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
      legalForTrade: serializer.fromJson<bool>(json['legalForTrade']),
      inspectionExpiry:
          serializer.fromJson<DateTime?>(json['inspectionExpiry']),
      sealStatus: serializer.fromJson<String?>(json['sealStatus']),
      inspectionResult: serializer.fromJson<String?>(json['inspectionResult']),
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
      'scaleSubtype': serializer.toJson<String>(scaleSubtype),
      'customTypeDescription':
          serializer.toJson<String?>(customTypeDescription),
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
      'legalForTrade': serializer.toJson<bool>(legalForTrade),
      'inspectionExpiry': serializer.toJson<DateTime?>(inspectionExpiry),
      'sealStatus': serializer.toJson<String?>(sealStatus),
      'inspectionResult': serializer.toJson<String?>(inspectionResult),
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
          String? scaleSubtype,
          Value<String?> customTypeDescription = const Value.absent(),
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
          bool? legalForTrade,
          Value<DateTime?> inspectionExpiry = const Value.absent(),
          Value<String?> sealStatus = const Value.absent(),
          Value<String?> inspectionResult = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? deactivate,
          bool? auditFlag,
          bool? synced}) =>
      Scale(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        configuration: configuration ?? this.configuration,
        scaleType: scaleType ?? this.scaleType,
        scaleSubtype: scaleSubtype ?? this.scaleSubtype,
        customTypeDescription: customTypeDescription.present
            ? customTypeDescription.value
            : this.customTypeDescription,
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
        legalForTrade: legalForTrade ?? this.legalForTrade,
        inspectionExpiry: inspectionExpiry.present
            ? inspectionExpiry.value
            : this.inspectionExpiry,
        sealStatus: sealStatus.present ? sealStatus.value : this.sealStatus,
        inspectionResult: inspectionResult.present
            ? inspectionResult.value
            : this.inspectionResult,
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
      scaleSubtype: data.scaleSubtype.present
          ? data.scaleSubtype.value
          : this.scaleSubtype,
      customTypeDescription: data.customTypeDescription.present
          ? data.customTypeDescription.value
          : this.customTypeDescription,
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
      legalForTrade: data.legalForTrade.present
          ? data.legalForTrade.value
          : this.legalForTrade,
      inspectionExpiry: data.inspectionExpiry.present
          ? data.inspectionExpiry.value
          : this.inspectionExpiry,
      sealStatus:
          data.sealStatus.present ? data.sealStatus.value : this.sealStatus,
      inspectionResult: data.inspectionResult.present
          ? data.inspectionResult.value
          : this.inspectionResult,
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
          ..write('scaleSubtype: $scaleSubtype, ')
          ..write('customTypeDescription: $customTypeDescription, ')
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
          ..write('legalForTrade: $legalForTrade, ')
          ..write('inspectionExpiry: $inspectionExpiry, ')
          ..write('sealStatus: $sealStatus, ')
          ..write('inspectionResult: $inspectionResult, ')
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
        scaleSubtype,
        customTypeDescription,
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
        legalForTrade,
        inspectionExpiry,
        sealStatus,
        inspectionResult,
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
          other.scaleSubtype == this.scaleSubtype &&
          other.customTypeDescription == this.customTypeDescription &&
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
          other.legalForTrade == this.legalForTrade &&
          other.inspectionExpiry == this.inspectionExpiry &&
          other.sealStatus == this.sealStatus &&
          other.inspectionResult == this.inspectionResult &&
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
  final Value<String> scaleSubtype;
  final Value<String?> customTypeDescription;
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
  final Value<bool> legalForTrade;
  final Value<DateTime?> inspectionExpiry;
  final Value<String?> sealStatus;
  final Value<String?> inspectionResult;
  final Value<String?> notes;
  final Value<bool> deactivate;
  final Value<bool> auditFlag;
  final Value<bool> synced;
  const ScalesCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.configuration = const Value.absent(),
    this.scaleType = const Value.absent(),
    this.scaleSubtype = const Value.absent(),
    this.customTypeDescription = const Value.absent(),
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
    this.legalForTrade = const Value.absent(),
    this.inspectionExpiry = const Value.absent(),
    this.sealStatus = const Value.absent(),
    this.inspectionResult = const Value.absent(),
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
    required String scaleSubtype,
    this.customTypeDescription = const Value.absent(),
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
    this.legalForTrade = const Value.absent(),
    this.inspectionExpiry = const Value.absent(),
    this.sealStatus = const Value.absent(),
    this.inspectionResult = const Value.absent(),
    this.notes = const Value.absent(),
    this.deactivate = const Value.absent(),
    this.auditFlag = const Value.absent(),
    this.synced = const Value.absent(),
  })  : customerId = Value(customerId),
        configuration = Value(configuration),
        scaleType = Value(scaleType),
        scaleSubtype = Value(scaleSubtype),
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
    Expression<String>? scaleSubtype,
    Expression<String>? customTypeDescription,
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
    Expression<bool>? legalForTrade,
    Expression<DateTime>? inspectionExpiry,
    Expression<String>? sealStatus,
    Expression<String>? inspectionResult,
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
      if (scaleSubtype != null) 'scale_subtype': scaleSubtype,
      if (customTypeDescription != null)
        'custom_type_description': customTypeDescription,
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
      if (legalForTrade != null) 'legal_for_trade': legalForTrade,
      if (inspectionExpiry != null) 'inspection_expiry': inspectionExpiry,
      if (sealStatus != null) 'seal_status': sealStatus,
      if (inspectionResult != null) 'inspection_result': inspectionResult,
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
      Value<String>? scaleSubtype,
      Value<String?>? customTypeDescription,
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
      Value<bool>? legalForTrade,
      Value<DateTime?>? inspectionExpiry,
      Value<String?>? sealStatus,
      Value<String?>? inspectionResult,
      Value<String?>? notes,
      Value<bool>? deactivate,
      Value<bool>? auditFlag,
      Value<bool>? synced}) {
    return ScalesCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      configuration: configuration ?? this.configuration,
      scaleType: scaleType ?? this.scaleType,
      scaleSubtype: scaleSubtype ?? this.scaleSubtype,
      customTypeDescription:
          customTypeDescription ?? this.customTypeDescription,
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
      legalForTrade: legalForTrade ?? this.legalForTrade,
      inspectionExpiry: inspectionExpiry ?? this.inspectionExpiry,
      sealStatus: sealStatus ?? this.sealStatus,
      inspectionResult: inspectionResult ?? this.inspectionResult,
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
    if (scaleSubtype.present) {
      map['scale_subtype'] = Variable<String>(scaleSubtype.value);
    }
    if (customTypeDescription.present) {
      map['custom_type_description'] =
          Variable<String>(customTypeDescription.value);
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
    if (legalForTrade.present) {
      map['legal_for_trade'] = Variable<bool>(legalForTrade.value);
    }
    if (inspectionExpiry.present) {
      map['inspection_expiry'] = Variable<DateTime>(inspectionExpiry.value);
    }
    if (sealStatus.present) {
      map['seal_status'] = Variable<String>(sealStatus.value);
    }
    if (inspectionResult.present) {
      map['inspection_result'] = Variable<String>(inspectionResult.value);
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
          ..write('scaleSubtype: $scaleSubtype, ')
          ..write('customTypeDescription: $customTypeDescription, ')
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
          ..write('legalForTrade: $legalForTrade, ')
          ..write('inspectionExpiry: $inspectionExpiry, ')
          ..write('sealStatus: $sealStatus, ')
          ..write('inspectionResult: $inspectionResult, ')
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

class $WeightTestsTable extends WeightTests
    with TableInfo<$WeightTestsTable, WeightTest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeightTestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serviceReportIdMeta =
      const VerificationMeta('serviceReportId');
  @override
  late final GeneratedColumn<int> serviceReportId = GeneratedColumn<int>(
      'service_report_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES service_reports (id)'));
  static const VerificationMeta _eccentricityTypeMeta =
      const VerificationMeta('eccentricityType');
  @override
  late final GeneratedColumn<String> eccentricityType = GeneratedColumn<String>(
      'eccentricity_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _eccentricityPointsMeta =
      const VerificationMeta('eccentricityPoints');
  @override
  late final GeneratedColumn<int> eccentricityPoints = GeneratedColumn<int>(
      'eccentricity_points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(4));
  static const VerificationMeta _eccentricityDirectionsMeta =
      const VerificationMeta('eccentricityDirections');
  @override
  late final GeneratedColumn<String> eccentricityDirections =
      GeneratedColumn<String>('eccentricity_directions', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _eccentricity1Meta =
      const VerificationMeta('eccentricity1');
  @override
  late final GeneratedColumn<double> eccentricity1 = GeneratedColumn<double>(
      'eccentricity1', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _eccentricity2Meta =
      const VerificationMeta('eccentricity2');
  @override
  late final GeneratedColumn<double> eccentricity2 = GeneratedColumn<double>(
      'eccentricity2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _eccentricity3Meta =
      const VerificationMeta('eccentricity3');
  @override
  late final GeneratedColumn<double> eccentricity3 = GeneratedColumn<double>(
      'eccentricity3', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _eccentricity4Meta =
      const VerificationMeta('eccentricity4');
  @override
  late final GeneratedColumn<double> eccentricity4 = GeneratedColumn<double>(
      'eccentricity4', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _eccentricity5Meta =
      const VerificationMeta('eccentricity5');
  @override
  late final GeneratedColumn<double> eccentricity5 = GeneratedColumn<double>(
      'eccentricity5', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _eccentricity6Meta =
      const VerificationMeta('eccentricity6');
  @override
  late final GeneratedColumn<double> eccentricity6 = GeneratedColumn<double>(
      'eccentricity6', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _eccentricity7Meta =
      const VerificationMeta('eccentricity7');
  @override
  late final GeneratedColumn<double> eccentricity7 = GeneratedColumn<double>(
      'eccentricity7', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _eccentricity8Meta =
      const VerificationMeta('eccentricity8');
  @override
  late final GeneratedColumn<double> eccentricity8 = GeneratedColumn<double>(
      'eccentricity8', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _eccentricity9Meta =
      const VerificationMeta('eccentricity9');
  @override
  late final GeneratedColumn<double> eccentricity9 = GeneratedColumn<double>(
      'eccentricity9', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _eccentricity10Meta =
      const VerificationMeta('eccentricity10');
  @override
  late final GeneratedColumn<double> eccentricity10 = GeneratedColumn<double>(
      'eccentricity10', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _eccentricityErrorMeta =
      const VerificationMeta('eccentricityError');
  @override
  late final GeneratedColumn<String> eccentricityError =
      GeneratedColumn<String>('eccentricity_error', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _asFoundTest1Meta =
      const VerificationMeta('asFoundTest1');
  @override
  late final GeneratedColumn<double> asFoundTest1 = GeneratedColumn<double>(
      'as_found_test1', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundRead1Meta =
      const VerificationMeta('asFoundRead1');
  @override
  late final GeneratedColumn<double> asFoundRead1 = GeneratedColumn<double>(
      'as_found_read1', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundDiff1Meta =
      const VerificationMeta('asFoundDiff1');
  @override
  late final GeneratedColumn<double> asFoundDiff1 = GeneratedColumn<double>(
      'as_found_diff1', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundTest2Meta =
      const VerificationMeta('asFoundTest2');
  @override
  late final GeneratedColumn<double> asFoundTest2 = GeneratedColumn<double>(
      'as_found_test2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundRead2Meta =
      const VerificationMeta('asFoundRead2');
  @override
  late final GeneratedColumn<double> asFoundRead2 = GeneratedColumn<double>(
      'as_found_read2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundDiff2Meta =
      const VerificationMeta('asFoundDiff2');
  @override
  late final GeneratedColumn<double> asFoundDiff2 = GeneratedColumn<double>(
      'as_found_diff2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundTest3Meta =
      const VerificationMeta('asFoundTest3');
  @override
  late final GeneratedColumn<double> asFoundTest3 = GeneratedColumn<double>(
      'as_found_test3', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundRead3Meta =
      const VerificationMeta('asFoundRead3');
  @override
  late final GeneratedColumn<double> asFoundRead3 = GeneratedColumn<double>(
      'as_found_read3', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundDiff3Meta =
      const VerificationMeta('asFoundDiff3');
  @override
  late final GeneratedColumn<double> asFoundDiff3 = GeneratedColumn<double>(
      'as_found_diff3', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundTest4Meta =
      const VerificationMeta('asFoundTest4');
  @override
  late final GeneratedColumn<double> asFoundTest4 = GeneratedColumn<double>(
      'as_found_test4', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundRead4Meta =
      const VerificationMeta('asFoundRead4');
  @override
  late final GeneratedColumn<double> asFoundRead4 = GeneratedColumn<double>(
      'as_found_read4', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundDiff4Meta =
      const VerificationMeta('asFoundDiff4');
  @override
  late final GeneratedColumn<double> asFoundDiff4 = GeneratedColumn<double>(
      'as_found_diff4', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundTest5Meta =
      const VerificationMeta('asFoundTest5');
  @override
  late final GeneratedColumn<double> asFoundTest5 = GeneratedColumn<double>(
      'as_found_test5', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundRead5Meta =
      const VerificationMeta('asFoundRead5');
  @override
  late final GeneratedColumn<double> asFoundRead5 = GeneratedColumn<double>(
      'as_found_read5', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundDiff5Meta =
      const VerificationMeta('asFoundDiff5');
  @override
  late final GeneratedColumn<double> asFoundDiff5 = GeneratedColumn<double>(
      'as_found_diff5', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundTest6Meta =
      const VerificationMeta('asFoundTest6');
  @override
  late final GeneratedColumn<double> asFoundTest6 = GeneratedColumn<double>(
      'as_found_test6', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundRead6Meta =
      const VerificationMeta('asFoundRead6');
  @override
  late final GeneratedColumn<double> asFoundRead6 = GeneratedColumn<double>(
      'as_found_read6', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asFoundDiff6Meta =
      const VerificationMeta('asFoundDiff6');
  @override
  late final GeneratedColumn<double> asFoundDiff6 = GeneratedColumn<double>(
      'as_found_diff6', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftTest1Meta =
      const VerificationMeta('asLeftTest1');
  @override
  late final GeneratedColumn<double> asLeftTest1 = GeneratedColumn<double>(
      'as_left_test1', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftRead1Meta =
      const VerificationMeta('asLeftRead1');
  @override
  late final GeneratedColumn<double> asLeftRead1 = GeneratedColumn<double>(
      'as_left_read1', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftDiff1Meta =
      const VerificationMeta('asLeftDiff1');
  @override
  late final GeneratedColumn<double> asLeftDiff1 = GeneratedColumn<double>(
      'as_left_diff1', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftTest2Meta =
      const VerificationMeta('asLeftTest2');
  @override
  late final GeneratedColumn<double> asLeftTest2 = GeneratedColumn<double>(
      'as_left_test2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftRead2Meta =
      const VerificationMeta('asLeftRead2');
  @override
  late final GeneratedColumn<double> asLeftRead2 = GeneratedColumn<double>(
      'as_left_read2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftDiff2Meta =
      const VerificationMeta('asLeftDiff2');
  @override
  late final GeneratedColumn<double> asLeftDiff2 = GeneratedColumn<double>(
      'as_left_diff2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftTest3Meta =
      const VerificationMeta('asLeftTest3');
  @override
  late final GeneratedColumn<double> asLeftTest3 = GeneratedColumn<double>(
      'as_left_test3', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftRead3Meta =
      const VerificationMeta('asLeftRead3');
  @override
  late final GeneratedColumn<double> asLeftRead3 = GeneratedColumn<double>(
      'as_left_read3', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftDiff3Meta =
      const VerificationMeta('asLeftDiff3');
  @override
  late final GeneratedColumn<double> asLeftDiff3 = GeneratedColumn<double>(
      'as_left_diff3', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftTest4Meta =
      const VerificationMeta('asLeftTest4');
  @override
  late final GeneratedColumn<double> asLeftTest4 = GeneratedColumn<double>(
      'as_left_test4', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftRead4Meta =
      const VerificationMeta('asLeftRead4');
  @override
  late final GeneratedColumn<double> asLeftRead4 = GeneratedColumn<double>(
      'as_left_read4', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftDiff4Meta =
      const VerificationMeta('asLeftDiff4');
  @override
  late final GeneratedColumn<double> asLeftDiff4 = GeneratedColumn<double>(
      'as_left_diff4', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftTest5Meta =
      const VerificationMeta('asLeftTest5');
  @override
  late final GeneratedColumn<double> asLeftTest5 = GeneratedColumn<double>(
      'as_left_test5', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftRead5Meta =
      const VerificationMeta('asLeftRead5');
  @override
  late final GeneratedColumn<double> asLeftRead5 = GeneratedColumn<double>(
      'as_left_read5', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftDiff5Meta =
      const VerificationMeta('asLeftDiff5');
  @override
  late final GeneratedColumn<double> asLeftDiff5 = GeneratedColumn<double>(
      'as_left_diff5', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftTest6Meta =
      const VerificationMeta('asLeftTest6');
  @override
  late final GeneratedColumn<double> asLeftTest6 = GeneratedColumn<double>(
      'as_left_test6', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftRead6Meta =
      const VerificationMeta('asLeftRead6');
  @override
  late final GeneratedColumn<double> asLeftRead6 = GeneratedColumn<double>(
      'as_left_read6', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asLeftDiff6Meta =
      const VerificationMeta('asLeftDiff6');
  @override
  late final GeneratedColumn<double> asLeftDiff6 = GeneratedColumn<double>(
      'as_left_diff6', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _weightTestUnitMeta =
      const VerificationMeta('weightTestUnit');
  @override
  late final GeneratedColumn<String> weightTestUnit = GeneratedColumn<String>(
      'weight_test_unit', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        serviceReportId,
        eccentricityType,
        eccentricityPoints,
        eccentricityDirections,
        eccentricity1,
        eccentricity2,
        eccentricity3,
        eccentricity4,
        eccentricity5,
        eccentricity6,
        eccentricity7,
        eccentricity8,
        eccentricity9,
        eccentricity10,
        eccentricityError,
        asFoundTest1,
        asFoundRead1,
        asFoundDiff1,
        asFoundTest2,
        asFoundRead2,
        asFoundDiff2,
        asFoundTest3,
        asFoundRead3,
        asFoundDiff3,
        asFoundTest4,
        asFoundRead4,
        asFoundDiff4,
        asFoundTest5,
        asFoundRead5,
        asFoundDiff5,
        asFoundTest6,
        asFoundRead6,
        asFoundDiff6,
        asLeftTest1,
        asLeftRead1,
        asLeftDiff1,
        asLeftTest2,
        asLeftRead2,
        asLeftDiff2,
        asLeftTest3,
        asLeftRead3,
        asLeftDiff3,
        asLeftTest4,
        asLeftRead4,
        asLeftDiff4,
        asLeftTest5,
        asLeftRead5,
        asLeftDiff5,
        asLeftTest6,
        asLeftRead6,
        asLeftDiff6,
        notes,
        weightTestUnit,
        timestamp
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weight_tests';
  @override
  VerificationContext validateIntegrity(Insertable<WeightTest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('service_report_id')) {
      context.handle(
          _serviceReportIdMeta,
          serviceReportId.isAcceptableOrUnknown(
              data['service_report_id']!, _serviceReportIdMeta));
    } else if (isInserting) {
      context.missing(_serviceReportIdMeta);
    }
    if (data.containsKey('eccentricity_type')) {
      context.handle(
          _eccentricityTypeMeta,
          eccentricityType.isAcceptableOrUnknown(
              data['eccentricity_type']!, _eccentricityTypeMeta));
    } else if (isInserting) {
      context.missing(_eccentricityTypeMeta);
    }
    if (data.containsKey('eccentricity_points')) {
      context.handle(
          _eccentricityPointsMeta,
          eccentricityPoints.isAcceptableOrUnknown(
              data['eccentricity_points']!, _eccentricityPointsMeta));
    }
    if (data.containsKey('eccentricity_directions')) {
      context.handle(
          _eccentricityDirectionsMeta,
          eccentricityDirections.isAcceptableOrUnknown(
              data['eccentricity_directions']!, _eccentricityDirectionsMeta));
    }
    if (data.containsKey('eccentricity1')) {
      context.handle(
          _eccentricity1Meta,
          eccentricity1.isAcceptableOrUnknown(
              data['eccentricity1']!, _eccentricity1Meta));
    }
    if (data.containsKey('eccentricity2')) {
      context.handle(
          _eccentricity2Meta,
          eccentricity2.isAcceptableOrUnknown(
              data['eccentricity2']!, _eccentricity2Meta));
    }
    if (data.containsKey('eccentricity3')) {
      context.handle(
          _eccentricity3Meta,
          eccentricity3.isAcceptableOrUnknown(
              data['eccentricity3']!, _eccentricity3Meta));
    }
    if (data.containsKey('eccentricity4')) {
      context.handle(
          _eccentricity4Meta,
          eccentricity4.isAcceptableOrUnknown(
              data['eccentricity4']!, _eccentricity4Meta));
    }
    if (data.containsKey('eccentricity5')) {
      context.handle(
          _eccentricity5Meta,
          eccentricity5.isAcceptableOrUnknown(
              data['eccentricity5']!, _eccentricity5Meta));
    }
    if (data.containsKey('eccentricity6')) {
      context.handle(
          _eccentricity6Meta,
          eccentricity6.isAcceptableOrUnknown(
              data['eccentricity6']!, _eccentricity6Meta));
    }
    if (data.containsKey('eccentricity7')) {
      context.handle(
          _eccentricity7Meta,
          eccentricity7.isAcceptableOrUnknown(
              data['eccentricity7']!, _eccentricity7Meta));
    }
    if (data.containsKey('eccentricity8')) {
      context.handle(
          _eccentricity8Meta,
          eccentricity8.isAcceptableOrUnknown(
              data['eccentricity8']!, _eccentricity8Meta));
    }
    if (data.containsKey('eccentricity9')) {
      context.handle(
          _eccentricity9Meta,
          eccentricity9.isAcceptableOrUnknown(
              data['eccentricity9']!, _eccentricity9Meta));
    }
    if (data.containsKey('eccentricity10')) {
      context.handle(
          _eccentricity10Meta,
          eccentricity10.isAcceptableOrUnknown(
              data['eccentricity10']!, _eccentricity10Meta));
    }
    if (data.containsKey('eccentricity_error')) {
      context.handle(
          _eccentricityErrorMeta,
          eccentricityError.isAcceptableOrUnknown(
              data['eccentricity_error']!, _eccentricityErrorMeta));
    }
    if (data.containsKey('as_found_test1')) {
      context.handle(
          _asFoundTest1Meta,
          asFoundTest1.isAcceptableOrUnknown(
              data['as_found_test1']!, _asFoundTest1Meta));
    }
    if (data.containsKey('as_found_read1')) {
      context.handle(
          _asFoundRead1Meta,
          asFoundRead1.isAcceptableOrUnknown(
              data['as_found_read1']!, _asFoundRead1Meta));
    }
    if (data.containsKey('as_found_diff1')) {
      context.handle(
          _asFoundDiff1Meta,
          asFoundDiff1.isAcceptableOrUnknown(
              data['as_found_diff1']!, _asFoundDiff1Meta));
    }
    if (data.containsKey('as_found_test2')) {
      context.handle(
          _asFoundTest2Meta,
          asFoundTest2.isAcceptableOrUnknown(
              data['as_found_test2']!, _asFoundTest2Meta));
    }
    if (data.containsKey('as_found_read2')) {
      context.handle(
          _asFoundRead2Meta,
          asFoundRead2.isAcceptableOrUnknown(
              data['as_found_read2']!, _asFoundRead2Meta));
    }
    if (data.containsKey('as_found_diff2')) {
      context.handle(
          _asFoundDiff2Meta,
          asFoundDiff2.isAcceptableOrUnknown(
              data['as_found_diff2']!, _asFoundDiff2Meta));
    }
    if (data.containsKey('as_found_test3')) {
      context.handle(
          _asFoundTest3Meta,
          asFoundTest3.isAcceptableOrUnknown(
              data['as_found_test3']!, _asFoundTest3Meta));
    }
    if (data.containsKey('as_found_read3')) {
      context.handle(
          _asFoundRead3Meta,
          asFoundRead3.isAcceptableOrUnknown(
              data['as_found_read3']!, _asFoundRead3Meta));
    }
    if (data.containsKey('as_found_diff3')) {
      context.handle(
          _asFoundDiff3Meta,
          asFoundDiff3.isAcceptableOrUnknown(
              data['as_found_diff3']!, _asFoundDiff3Meta));
    }
    if (data.containsKey('as_found_test4')) {
      context.handle(
          _asFoundTest4Meta,
          asFoundTest4.isAcceptableOrUnknown(
              data['as_found_test4']!, _asFoundTest4Meta));
    }
    if (data.containsKey('as_found_read4')) {
      context.handle(
          _asFoundRead4Meta,
          asFoundRead4.isAcceptableOrUnknown(
              data['as_found_read4']!, _asFoundRead4Meta));
    }
    if (data.containsKey('as_found_diff4')) {
      context.handle(
          _asFoundDiff4Meta,
          asFoundDiff4.isAcceptableOrUnknown(
              data['as_found_diff4']!, _asFoundDiff4Meta));
    }
    if (data.containsKey('as_found_test5')) {
      context.handle(
          _asFoundTest5Meta,
          asFoundTest5.isAcceptableOrUnknown(
              data['as_found_test5']!, _asFoundTest5Meta));
    }
    if (data.containsKey('as_found_read5')) {
      context.handle(
          _asFoundRead5Meta,
          asFoundRead5.isAcceptableOrUnknown(
              data['as_found_read5']!, _asFoundRead5Meta));
    }
    if (data.containsKey('as_found_diff5')) {
      context.handle(
          _asFoundDiff5Meta,
          asFoundDiff5.isAcceptableOrUnknown(
              data['as_found_diff5']!, _asFoundDiff5Meta));
    }
    if (data.containsKey('as_found_test6')) {
      context.handle(
          _asFoundTest6Meta,
          asFoundTest6.isAcceptableOrUnknown(
              data['as_found_test6']!, _asFoundTest6Meta));
    }
    if (data.containsKey('as_found_read6')) {
      context.handle(
          _asFoundRead6Meta,
          asFoundRead6.isAcceptableOrUnknown(
              data['as_found_read6']!, _asFoundRead6Meta));
    }
    if (data.containsKey('as_found_diff6')) {
      context.handle(
          _asFoundDiff6Meta,
          asFoundDiff6.isAcceptableOrUnknown(
              data['as_found_diff6']!, _asFoundDiff6Meta));
    }
    if (data.containsKey('as_left_test1')) {
      context.handle(
          _asLeftTest1Meta,
          asLeftTest1.isAcceptableOrUnknown(
              data['as_left_test1']!, _asLeftTest1Meta));
    }
    if (data.containsKey('as_left_read1')) {
      context.handle(
          _asLeftRead1Meta,
          asLeftRead1.isAcceptableOrUnknown(
              data['as_left_read1']!, _asLeftRead1Meta));
    }
    if (data.containsKey('as_left_diff1')) {
      context.handle(
          _asLeftDiff1Meta,
          asLeftDiff1.isAcceptableOrUnknown(
              data['as_left_diff1']!, _asLeftDiff1Meta));
    }
    if (data.containsKey('as_left_test2')) {
      context.handle(
          _asLeftTest2Meta,
          asLeftTest2.isAcceptableOrUnknown(
              data['as_left_test2']!, _asLeftTest2Meta));
    }
    if (data.containsKey('as_left_read2')) {
      context.handle(
          _asLeftRead2Meta,
          asLeftRead2.isAcceptableOrUnknown(
              data['as_left_read2']!, _asLeftRead2Meta));
    }
    if (data.containsKey('as_left_diff2')) {
      context.handle(
          _asLeftDiff2Meta,
          asLeftDiff2.isAcceptableOrUnknown(
              data['as_left_diff2']!, _asLeftDiff2Meta));
    }
    if (data.containsKey('as_left_test3')) {
      context.handle(
          _asLeftTest3Meta,
          asLeftTest3.isAcceptableOrUnknown(
              data['as_left_test3']!, _asLeftTest3Meta));
    }
    if (data.containsKey('as_left_read3')) {
      context.handle(
          _asLeftRead3Meta,
          asLeftRead3.isAcceptableOrUnknown(
              data['as_left_read3']!, _asLeftRead3Meta));
    }
    if (data.containsKey('as_left_diff3')) {
      context.handle(
          _asLeftDiff3Meta,
          asLeftDiff3.isAcceptableOrUnknown(
              data['as_left_diff3']!, _asLeftDiff3Meta));
    }
    if (data.containsKey('as_left_test4')) {
      context.handle(
          _asLeftTest4Meta,
          asLeftTest4.isAcceptableOrUnknown(
              data['as_left_test4']!, _asLeftTest4Meta));
    }
    if (data.containsKey('as_left_read4')) {
      context.handle(
          _asLeftRead4Meta,
          asLeftRead4.isAcceptableOrUnknown(
              data['as_left_read4']!, _asLeftRead4Meta));
    }
    if (data.containsKey('as_left_diff4')) {
      context.handle(
          _asLeftDiff4Meta,
          asLeftDiff4.isAcceptableOrUnknown(
              data['as_left_diff4']!, _asLeftDiff4Meta));
    }
    if (data.containsKey('as_left_test5')) {
      context.handle(
          _asLeftTest5Meta,
          asLeftTest5.isAcceptableOrUnknown(
              data['as_left_test5']!, _asLeftTest5Meta));
    }
    if (data.containsKey('as_left_read5')) {
      context.handle(
          _asLeftRead5Meta,
          asLeftRead5.isAcceptableOrUnknown(
              data['as_left_read5']!, _asLeftRead5Meta));
    }
    if (data.containsKey('as_left_diff5')) {
      context.handle(
          _asLeftDiff5Meta,
          asLeftDiff5.isAcceptableOrUnknown(
              data['as_left_diff5']!, _asLeftDiff5Meta));
    }
    if (data.containsKey('as_left_test6')) {
      context.handle(
          _asLeftTest6Meta,
          asLeftTest6.isAcceptableOrUnknown(
              data['as_left_test6']!, _asLeftTest6Meta));
    }
    if (data.containsKey('as_left_read6')) {
      context.handle(
          _asLeftRead6Meta,
          asLeftRead6.isAcceptableOrUnknown(
              data['as_left_read6']!, _asLeftRead6Meta));
    }
    if (data.containsKey('as_left_diff6')) {
      context.handle(
          _asLeftDiff6Meta,
          asLeftDiff6.isAcceptableOrUnknown(
              data['as_left_diff6']!, _asLeftDiff6Meta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('weight_test_unit')) {
      context.handle(
          _weightTestUnitMeta,
          weightTestUnit.isAcceptableOrUnknown(
              data['weight_test_unit']!, _weightTestUnitMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {serviceReportId},
      ];
  @override
  WeightTest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeightTest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serviceReportId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}service_report_id'])!,
      eccentricityType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}eccentricity_type'])!,
      eccentricityPoints: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}eccentricity_points'])!,
      eccentricityDirections: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}eccentricity_directions']),
      eccentricity1: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eccentricity1']),
      eccentricity2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eccentricity2']),
      eccentricity3: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eccentricity3']),
      eccentricity4: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eccentricity4']),
      eccentricity5: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eccentricity5']),
      eccentricity6: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eccentricity6']),
      eccentricity7: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eccentricity7']),
      eccentricity8: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eccentricity8']),
      eccentricity9: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eccentricity9']),
      eccentricity10: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eccentricity10']),
      eccentricityError: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}eccentricity_error']),
      asFoundTest1: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_test1']),
      asFoundRead1: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_read1']),
      asFoundDiff1: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_diff1']),
      asFoundTest2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_test2']),
      asFoundRead2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_read2']),
      asFoundDiff2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_diff2']),
      asFoundTest3: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_test3']),
      asFoundRead3: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_read3']),
      asFoundDiff3: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_diff3']),
      asFoundTest4: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_test4']),
      asFoundRead4: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_read4']),
      asFoundDiff4: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_diff4']),
      asFoundTest5: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_test5']),
      asFoundRead5: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_read5']),
      asFoundDiff5: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_diff5']),
      asFoundTest6: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_test6']),
      asFoundRead6: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_read6']),
      asFoundDiff6: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_found_diff6']),
      asLeftTest1: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_test1']),
      asLeftRead1: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_read1']),
      asLeftDiff1: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_diff1']),
      asLeftTest2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_test2']),
      asLeftRead2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_read2']),
      asLeftDiff2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_diff2']),
      asLeftTest3: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_test3']),
      asLeftRead3: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_read3']),
      asLeftDiff3: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_diff3']),
      asLeftTest4: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_test4']),
      asLeftRead4: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_read4']),
      asLeftDiff4: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_diff4']),
      asLeftTest5: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_test5']),
      asLeftRead5: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_read5']),
      asLeftDiff5: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_diff5']),
      asLeftTest6: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_test6']),
      asLeftRead6: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_read6']),
      asLeftDiff6: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}as_left_diff6']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      weightTestUnit: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}weight_test_unit']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $WeightTestsTable createAlias(String alias) {
    return $WeightTestsTable(attachedDatabase, alias);
  }
}

class WeightTest extends DataClass implements Insertable<WeightTest> {
  final int id;
  final int serviceReportId;
  final String eccentricityType;
  final int eccentricityPoints;
  final String? eccentricityDirections;
  final double? eccentricity1;
  final double? eccentricity2;
  final double? eccentricity3;
  final double? eccentricity4;
  final double? eccentricity5;
  final double? eccentricity6;
  final double? eccentricity7;
  final double? eccentricity8;
  final double? eccentricity9;
  final double? eccentricity10;
  final String? eccentricityError;
  final double? asFoundTest1;
  final double? asFoundRead1;
  final double? asFoundDiff1;
  final double? asFoundTest2;
  final double? asFoundRead2;
  final double? asFoundDiff2;
  final double? asFoundTest3;
  final double? asFoundRead3;
  final double? asFoundDiff3;
  final double? asFoundTest4;
  final double? asFoundRead4;
  final double? asFoundDiff4;
  final double? asFoundTest5;
  final double? asFoundRead5;
  final double? asFoundDiff5;
  final double? asFoundTest6;
  final double? asFoundRead6;
  final double? asFoundDiff6;
  final double? asLeftTest1;
  final double? asLeftRead1;
  final double? asLeftDiff1;
  final double? asLeftTest2;
  final double? asLeftRead2;
  final double? asLeftDiff2;
  final double? asLeftTest3;
  final double? asLeftRead3;
  final double? asLeftDiff3;
  final double? asLeftTest4;
  final double? asLeftRead4;
  final double? asLeftDiff4;
  final double? asLeftTest5;
  final double? asLeftRead5;
  final double? asLeftDiff5;
  final double? asLeftTest6;
  final double? asLeftRead6;
  final double? asLeftDiff6;
  final String? notes;
  final String? weightTestUnit;
  final DateTime timestamp;
  const WeightTest(
      {required this.id,
      required this.serviceReportId,
      required this.eccentricityType,
      required this.eccentricityPoints,
      this.eccentricityDirections,
      this.eccentricity1,
      this.eccentricity2,
      this.eccentricity3,
      this.eccentricity4,
      this.eccentricity5,
      this.eccentricity6,
      this.eccentricity7,
      this.eccentricity8,
      this.eccentricity9,
      this.eccentricity10,
      this.eccentricityError,
      this.asFoundTest1,
      this.asFoundRead1,
      this.asFoundDiff1,
      this.asFoundTest2,
      this.asFoundRead2,
      this.asFoundDiff2,
      this.asFoundTest3,
      this.asFoundRead3,
      this.asFoundDiff3,
      this.asFoundTest4,
      this.asFoundRead4,
      this.asFoundDiff4,
      this.asFoundTest5,
      this.asFoundRead5,
      this.asFoundDiff5,
      this.asFoundTest6,
      this.asFoundRead6,
      this.asFoundDiff6,
      this.asLeftTest1,
      this.asLeftRead1,
      this.asLeftDiff1,
      this.asLeftTest2,
      this.asLeftRead2,
      this.asLeftDiff2,
      this.asLeftTest3,
      this.asLeftRead3,
      this.asLeftDiff3,
      this.asLeftTest4,
      this.asLeftRead4,
      this.asLeftDiff4,
      this.asLeftTest5,
      this.asLeftRead5,
      this.asLeftDiff5,
      this.asLeftTest6,
      this.asLeftRead6,
      this.asLeftDiff6,
      this.notes,
      this.weightTestUnit,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['service_report_id'] = Variable<int>(serviceReportId);
    map['eccentricity_type'] = Variable<String>(eccentricityType);
    map['eccentricity_points'] = Variable<int>(eccentricityPoints);
    if (!nullToAbsent || eccentricityDirections != null) {
      map['eccentricity_directions'] = Variable<String>(eccentricityDirections);
    }
    if (!nullToAbsent || eccentricity1 != null) {
      map['eccentricity1'] = Variable<double>(eccentricity1);
    }
    if (!nullToAbsent || eccentricity2 != null) {
      map['eccentricity2'] = Variable<double>(eccentricity2);
    }
    if (!nullToAbsent || eccentricity3 != null) {
      map['eccentricity3'] = Variable<double>(eccentricity3);
    }
    if (!nullToAbsent || eccentricity4 != null) {
      map['eccentricity4'] = Variable<double>(eccentricity4);
    }
    if (!nullToAbsent || eccentricity5 != null) {
      map['eccentricity5'] = Variable<double>(eccentricity5);
    }
    if (!nullToAbsent || eccentricity6 != null) {
      map['eccentricity6'] = Variable<double>(eccentricity6);
    }
    if (!nullToAbsent || eccentricity7 != null) {
      map['eccentricity7'] = Variable<double>(eccentricity7);
    }
    if (!nullToAbsent || eccentricity8 != null) {
      map['eccentricity8'] = Variable<double>(eccentricity8);
    }
    if (!nullToAbsent || eccentricity9 != null) {
      map['eccentricity9'] = Variable<double>(eccentricity9);
    }
    if (!nullToAbsent || eccentricity10 != null) {
      map['eccentricity10'] = Variable<double>(eccentricity10);
    }
    if (!nullToAbsent || eccentricityError != null) {
      map['eccentricity_error'] = Variable<String>(eccentricityError);
    }
    if (!nullToAbsent || asFoundTest1 != null) {
      map['as_found_test1'] = Variable<double>(asFoundTest1);
    }
    if (!nullToAbsent || asFoundRead1 != null) {
      map['as_found_read1'] = Variable<double>(asFoundRead1);
    }
    if (!nullToAbsent || asFoundDiff1 != null) {
      map['as_found_diff1'] = Variable<double>(asFoundDiff1);
    }
    if (!nullToAbsent || asFoundTest2 != null) {
      map['as_found_test2'] = Variable<double>(asFoundTest2);
    }
    if (!nullToAbsent || asFoundRead2 != null) {
      map['as_found_read2'] = Variable<double>(asFoundRead2);
    }
    if (!nullToAbsent || asFoundDiff2 != null) {
      map['as_found_diff2'] = Variable<double>(asFoundDiff2);
    }
    if (!nullToAbsent || asFoundTest3 != null) {
      map['as_found_test3'] = Variable<double>(asFoundTest3);
    }
    if (!nullToAbsent || asFoundRead3 != null) {
      map['as_found_read3'] = Variable<double>(asFoundRead3);
    }
    if (!nullToAbsent || asFoundDiff3 != null) {
      map['as_found_diff3'] = Variable<double>(asFoundDiff3);
    }
    if (!nullToAbsent || asFoundTest4 != null) {
      map['as_found_test4'] = Variable<double>(asFoundTest4);
    }
    if (!nullToAbsent || asFoundRead4 != null) {
      map['as_found_read4'] = Variable<double>(asFoundRead4);
    }
    if (!nullToAbsent || asFoundDiff4 != null) {
      map['as_found_diff4'] = Variable<double>(asFoundDiff4);
    }
    if (!nullToAbsent || asFoundTest5 != null) {
      map['as_found_test5'] = Variable<double>(asFoundTest5);
    }
    if (!nullToAbsent || asFoundRead5 != null) {
      map['as_found_read5'] = Variable<double>(asFoundRead5);
    }
    if (!nullToAbsent || asFoundDiff5 != null) {
      map['as_found_diff5'] = Variable<double>(asFoundDiff5);
    }
    if (!nullToAbsent || asFoundTest6 != null) {
      map['as_found_test6'] = Variable<double>(asFoundTest6);
    }
    if (!nullToAbsent || asFoundRead6 != null) {
      map['as_found_read6'] = Variable<double>(asFoundRead6);
    }
    if (!nullToAbsent || asFoundDiff6 != null) {
      map['as_found_diff6'] = Variable<double>(asFoundDiff6);
    }
    if (!nullToAbsent || asLeftTest1 != null) {
      map['as_left_test1'] = Variable<double>(asLeftTest1);
    }
    if (!nullToAbsent || asLeftRead1 != null) {
      map['as_left_read1'] = Variable<double>(asLeftRead1);
    }
    if (!nullToAbsent || asLeftDiff1 != null) {
      map['as_left_diff1'] = Variable<double>(asLeftDiff1);
    }
    if (!nullToAbsent || asLeftTest2 != null) {
      map['as_left_test2'] = Variable<double>(asLeftTest2);
    }
    if (!nullToAbsent || asLeftRead2 != null) {
      map['as_left_read2'] = Variable<double>(asLeftRead2);
    }
    if (!nullToAbsent || asLeftDiff2 != null) {
      map['as_left_diff2'] = Variable<double>(asLeftDiff2);
    }
    if (!nullToAbsent || asLeftTest3 != null) {
      map['as_left_test3'] = Variable<double>(asLeftTest3);
    }
    if (!nullToAbsent || asLeftRead3 != null) {
      map['as_left_read3'] = Variable<double>(asLeftRead3);
    }
    if (!nullToAbsent || asLeftDiff3 != null) {
      map['as_left_diff3'] = Variable<double>(asLeftDiff3);
    }
    if (!nullToAbsent || asLeftTest4 != null) {
      map['as_left_test4'] = Variable<double>(asLeftTest4);
    }
    if (!nullToAbsent || asLeftRead4 != null) {
      map['as_left_read4'] = Variable<double>(asLeftRead4);
    }
    if (!nullToAbsent || asLeftDiff4 != null) {
      map['as_left_diff4'] = Variable<double>(asLeftDiff4);
    }
    if (!nullToAbsent || asLeftTest5 != null) {
      map['as_left_test5'] = Variable<double>(asLeftTest5);
    }
    if (!nullToAbsent || asLeftRead5 != null) {
      map['as_left_read5'] = Variable<double>(asLeftRead5);
    }
    if (!nullToAbsent || asLeftDiff5 != null) {
      map['as_left_diff5'] = Variable<double>(asLeftDiff5);
    }
    if (!nullToAbsent || asLeftTest6 != null) {
      map['as_left_test6'] = Variable<double>(asLeftTest6);
    }
    if (!nullToAbsent || asLeftRead6 != null) {
      map['as_left_read6'] = Variable<double>(asLeftRead6);
    }
    if (!nullToAbsent || asLeftDiff6 != null) {
      map['as_left_diff6'] = Variable<double>(asLeftDiff6);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || weightTestUnit != null) {
      map['weight_test_unit'] = Variable<String>(weightTestUnit);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  WeightTestsCompanion toCompanion(bool nullToAbsent) {
    return WeightTestsCompanion(
      id: Value(id),
      serviceReportId: Value(serviceReportId),
      eccentricityType: Value(eccentricityType),
      eccentricityPoints: Value(eccentricityPoints),
      eccentricityDirections: eccentricityDirections == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricityDirections),
      eccentricity1: eccentricity1 == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricity1),
      eccentricity2: eccentricity2 == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricity2),
      eccentricity3: eccentricity3 == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricity3),
      eccentricity4: eccentricity4 == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricity4),
      eccentricity5: eccentricity5 == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricity5),
      eccentricity6: eccentricity6 == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricity6),
      eccentricity7: eccentricity7 == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricity7),
      eccentricity8: eccentricity8 == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricity8),
      eccentricity9: eccentricity9 == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricity9),
      eccentricity10: eccentricity10 == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricity10),
      eccentricityError: eccentricityError == null && nullToAbsent
          ? const Value.absent()
          : Value(eccentricityError),
      asFoundTest1: asFoundTest1 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundTest1),
      asFoundRead1: asFoundRead1 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundRead1),
      asFoundDiff1: asFoundDiff1 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundDiff1),
      asFoundTest2: asFoundTest2 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundTest2),
      asFoundRead2: asFoundRead2 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundRead2),
      asFoundDiff2: asFoundDiff2 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundDiff2),
      asFoundTest3: asFoundTest3 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundTest3),
      asFoundRead3: asFoundRead3 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundRead3),
      asFoundDiff3: asFoundDiff3 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundDiff3),
      asFoundTest4: asFoundTest4 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundTest4),
      asFoundRead4: asFoundRead4 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundRead4),
      asFoundDiff4: asFoundDiff4 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundDiff4),
      asFoundTest5: asFoundTest5 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundTest5),
      asFoundRead5: asFoundRead5 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundRead5),
      asFoundDiff5: asFoundDiff5 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundDiff5),
      asFoundTest6: asFoundTest6 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundTest6),
      asFoundRead6: asFoundRead6 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundRead6),
      asFoundDiff6: asFoundDiff6 == null && nullToAbsent
          ? const Value.absent()
          : Value(asFoundDiff6),
      asLeftTest1: asLeftTest1 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftTest1),
      asLeftRead1: asLeftRead1 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftRead1),
      asLeftDiff1: asLeftDiff1 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftDiff1),
      asLeftTest2: asLeftTest2 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftTest2),
      asLeftRead2: asLeftRead2 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftRead2),
      asLeftDiff2: asLeftDiff2 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftDiff2),
      asLeftTest3: asLeftTest3 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftTest3),
      asLeftRead3: asLeftRead3 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftRead3),
      asLeftDiff3: asLeftDiff3 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftDiff3),
      asLeftTest4: asLeftTest4 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftTest4),
      asLeftRead4: asLeftRead4 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftRead4),
      asLeftDiff4: asLeftDiff4 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftDiff4),
      asLeftTest5: asLeftTest5 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftTest5),
      asLeftRead5: asLeftRead5 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftRead5),
      asLeftDiff5: asLeftDiff5 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftDiff5),
      asLeftTest6: asLeftTest6 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftTest6),
      asLeftRead6: asLeftRead6 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftRead6),
      asLeftDiff6: asLeftDiff6 == null && nullToAbsent
          ? const Value.absent()
          : Value(asLeftDiff6),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      weightTestUnit: weightTestUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(weightTestUnit),
      timestamp: Value(timestamp),
    );
  }

  factory WeightTest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeightTest(
      id: serializer.fromJson<int>(json['id']),
      serviceReportId: serializer.fromJson<int>(json['serviceReportId']),
      eccentricityType: serializer.fromJson<String>(json['eccentricityType']),
      eccentricityPoints: serializer.fromJson<int>(json['eccentricityPoints']),
      eccentricityDirections:
          serializer.fromJson<String?>(json['eccentricityDirections']),
      eccentricity1: serializer.fromJson<double?>(json['eccentricity1']),
      eccentricity2: serializer.fromJson<double?>(json['eccentricity2']),
      eccentricity3: serializer.fromJson<double?>(json['eccentricity3']),
      eccentricity4: serializer.fromJson<double?>(json['eccentricity4']),
      eccentricity5: serializer.fromJson<double?>(json['eccentricity5']),
      eccentricity6: serializer.fromJson<double?>(json['eccentricity6']),
      eccentricity7: serializer.fromJson<double?>(json['eccentricity7']),
      eccentricity8: serializer.fromJson<double?>(json['eccentricity8']),
      eccentricity9: serializer.fromJson<double?>(json['eccentricity9']),
      eccentricity10: serializer.fromJson<double?>(json['eccentricity10']),
      eccentricityError:
          serializer.fromJson<String?>(json['eccentricityError']),
      asFoundTest1: serializer.fromJson<double?>(json['asFoundTest1']),
      asFoundRead1: serializer.fromJson<double?>(json['asFoundRead1']),
      asFoundDiff1: serializer.fromJson<double?>(json['asFoundDiff1']),
      asFoundTest2: serializer.fromJson<double?>(json['asFoundTest2']),
      asFoundRead2: serializer.fromJson<double?>(json['asFoundRead2']),
      asFoundDiff2: serializer.fromJson<double?>(json['asFoundDiff2']),
      asFoundTest3: serializer.fromJson<double?>(json['asFoundTest3']),
      asFoundRead3: serializer.fromJson<double?>(json['asFoundRead3']),
      asFoundDiff3: serializer.fromJson<double?>(json['asFoundDiff3']),
      asFoundTest4: serializer.fromJson<double?>(json['asFoundTest4']),
      asFoundRead4: serializer.fromJson<double?>(json['asFoundRead4']),
      asFoundDiff4: serializer.fromJson<double?>(json['asFoundDiff4']),
      asFoundTest5: serializer.fromJson<double?>(json['asFoundTest5']),
      asFoundRead5: serializer.fromJson<double?>(json['asFoundRead5']),
      asFoundDiff5: serializer.fromJson<double?>(json['asFoundDiff5']),
      asFoundTest6: serializer.fromJson<double?>(json['asFoundTest6']),
      asFoundRead6: serializer.fromJson<double?>(json['asFoundRead6']),
      asFoundDiff6: serializer.fromJson<double?>(json['asFoundDiff6']),
      asLeftTest1: serializer.fromJson<double?>(json['asLeftTest1']),
      asLeftRead1: serializer.fromJson<double?>(json['asLeftRead1']),
      asLeftDiff1: serializer.fromJson<double?>(json['asLeftDiff1']),
      asLeftTest2: serializer.fromJson<double?>(json['asLeftTest2']),
      asLeftRead2: serializer.fromJson<double?>(json['asLeftRead2']),
      asLeftDiff2: serializer.fromJson<double?>(json['asLeftDiff2']),
      asLeftTest3: serializer.fromJson<double?>(json['asLeftTest3']),
      asLeftRead3: serializer.fromJson<double?>(json['asLeftRead3']),
      asLeftDiff3: serializer.fromJson<double?>(json['asLeftDiff3']),
      asLeftTest4: serializer.fromJson<double?>(json['asLeftTest4']),
      asLeftRead4: serializer.fromJson<double?>(json['asLeftRead4']),
      asLeftDiff4: serializer.fromJson<double?>(json['asLeftDiff4']),
      asLeftTest5: serializer.fromJson<double?>(json['asLeftTest5']),
      asLeftRead5: serializer.fromJson<double?>(json['asLeftRead5']),
      asLeftDiff5: serializer.fromJson<double?>(json['asLeftDiff5']),
      asLeftTest6: serializer.fromJson<double?>(json['asLeftTest6']),
      asLeftRead6: serializer.fromJson<double?>(json['asLeftRead6']),
      asLeftDiff6: serializer.fromJson<double?>(json['asLeftDiff6']),
      notes: serializer.fromJson<String?>(json['notes']),
      weightTestUnit: serializer.fromJson<String?>(json['weightTestUnit']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serviceReportId': serializer.toJson<int>(serviceReportId),
      'eccentricityType': serializer.toJson<String>(eccentricityType),
      'eccentricityPoints': serializer.toJson<int>(eccentricityPoints),
      'eccentricityDirections':
          serializer.toJson<String?>(eccentricityDirections),
      'eccentricity1': serializer.toJson<double?>(eccentricity1),
      'eccentricity2': serializer.toJson<double?>(eccentricity2),
      'eccentricity3': serializer.toJson<double?>(eccentricity3),
      'eccentricity4': serializer.toJson<double?>(eccentricity4),
      'eccentricity5': serializer.toJson<double?>(eccentricity5),
      'eccentricity6': serializer.toJson<double?>(eccentricity6),
      'eccentricity7': serializer.toJson<double?>(eccentricity7),
      'eccentricity8': serializer.toJson<double?>(eccentricity8),
      'eccentricity9': serializer.toJson<double?>(eccentricity9),
      'eccentricity10': serializer.toJson<double?>(eccentricity10),
      'eccentricityError': serializer.toJson<String?>(eccentricityError),
      'asFoundTest1': serializer.toJson<double?>(asFoundTest1),
      'asFoundRead1': serializer.toJson<double?>(asFoundRead1),
      'asFoundDiff1': serializer.toJson<double?>(asFoundDiff1),
      'asFoundTest2': serializer.toJson<double?>(asFoundTest2),
      'asFoundRead2': serializer.toJson<double?>(asFoundRead2),
      'asFoundDiff2': serializer.toJson<double?>(asFoundDiff2),
      'asFoundTest3': serializer.toJson<double?>(asFoundTest3),
      'asFoundRead3': serializer.toJson<double?>(asFoundRead3),
      'asFoundDiff3': serializer.toJson<double?>(asFoundDiff3),
      'asFoundTest4': serializer.toJson<double?>(asFoundTest4),
      'asFoundRead4': serializer.toJson<double?>(asFoundRead4),
      'asFoundDiff4': serializer.toJson<double?>(asFoundDiff4),
      'asFoundTest5': serializer.toJson<double?>(asFoundTest5),
      'asFoundRead5': serializer.toJson<double?>(asFoundRead5),
      'asFoundDiff5': serializer.toJson<double?>(asFoundDiff5),
      'asFoundTest6': serializer.toJson<double?>(asFoundTest6),
      'asFoundRead6': serializer.toJson<double?>(asFoundRead6),
      'asFoundDiff6': serializer.toJson<double?>(asFoundDiff6),
      'asLeftTest1': serializer.toJson<double?>(asLeftTest1),
      'asLeftRead1': serializer.toJson<double?>(asLeftRead1),
      'asLeftDiff1': serializer.toJson<double?>(asLeftDiff1),
      'asLeftTest2': serializer.toJson<double?>(asLeftTest2),
      'asLeftRead2': serializer.toJson<double?>(asLeftRead2),
      'asLeftDiff2': serializer.toJson<double?>(asLeftDiff2),
      'asLeftTest3': serializer.toJson<double?>(asLeftTest3),
      'asLeftRead3': serializer.toJson<double?>(asLeftRead3),
      'asLeftDiff3': serializer.toJson<double?>(asLeftDiff3),
      'asLeftTest4': serializer.toJson<double?>(asLeftTest4),
      'asLeftRead4': serializer.toJson<double?>(asLeftRead4),
      'asLeftDiff4': serializer.toJson<double?>(asLeftDiff4),
      'asLeftTest5': serializer.toJson<double?>(asLeftTest5),
      'asLeftRead5': serializer.toJson<double?>(asLeftRead5),
      'asLeftDiff5': serializer.toJson<double?>(asLeftDiff5),
      'asLeftTest6': serializer.toJson<double?>(asLeftTest6),
      'asLeftRead6': serializer.toJson<double?>(asLeftRead6),
      'asLeftDiff6': serializer.toJson<double?>(asLeftDiff6),
      'notes': serializer.toJson<String?>(notes),
      'weightTestUnit': serializer.toJson<String?>(weightTestUnit),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  WeightTest copyWith(
          {int? id,
          int? serviceReportId,
          String? eccentricityType,
          int? eccentricityPoints,
          Value<String?> eccentricityDirections = const Value.absent(),
          Value<double?> eccentricity1 = const Value.absent(),
          Value<double?> eccentricity2 = const Value.absent(),
          Value<double?> eccentricity3 = const Value.absent(),
          Value<double?> eccentricity4 = const Value.absent(),
          Value<double?> eccentricity5 = const Value.absent(),
          Value<double?> eccentricity6 = const Value.absent(),
          Value<double?> eccentricity7 = const Value.absent(),
          Value<double?> eccentricity8 = const Value.absent(),
          Value<double?> eccentricity9 = const Value.absent(),
          Value<double?> eccentricity10 = const Value.absent(),
          Value<String?> eccentricityError = const Value.absent(),
          Value<double?> asFoundTest1 = const Value.absent(),
          Value<double?> asFoundRead1 = const Value.absent(),
          Value<double?> asFoundDiff1 = const Value.absent(),
          Value<double?> asFoundTest2 = const Value.absent(),
          Value<double?> asFoundRead2 = const Value.absent(),
          Value<double?> asFoundDiff2 = const Value.absent(),
          Value<double?> asFoundTest3 = const Value.absent(),
          Value<double?> asFoundRead3 = const Value.absent(),
          Value<double?> asFoundDiff3 = const Value.absent(),
          Value<double?> asFoundTest4 = const Value.absent(),
          Value<double?> asFoundRead4 = const Value.absent(),
          Value<double?> asFoundDiff4 = const Value.absent(),
          Value<double?> asFoundTest5 = const Value.absent(),
          Value<double?> asFoundRead5 = const Value.absent(),
          Value<double?> asFoundDiff5 = const Value.absent(),
          Value<double?> asFoundTest6 = const Value.absent(),
          Value<double?> asFoundRead6 = const Value.absent(),
          Value<double?> asFoundDiff6 = const Value.absent(),
          Value<double?> asLeftTest1 = const Value.absent(),
          Value<double?> asLeftRead1 = const Value.absent(),
          Value<double?> asLeftDiff1 = const Value.absent(),
          Value<double?> asLeftTest2 = const Value.absent(),
          Value<double?> asLeftRead2 = const Value.absent(),
          Value<double?> asLeftDiff2 = const Value.absent(),
          Value<double?> asLeftTest3 = const Value.absent(),
          Value<double?> asLeftRead3 = const Value.absent(),
          Value<double?> asLeftDiff3 = const Value.absent(),
          Value<double?> asLeftTest4 = const Value.absent(),
          Value<double?> asLeftRead4 = const Value.absent(),
          Value<double?> asLeftDiff4 = const Value.absent(),
          Value<double?> asLeftTest5 = const Value.absent(),
          Value<double?> asLeftRead5 = const Value.absent(),
          Value<double?> asLeftDiff5 = const Value.absent(),
          Value<double?> asLeftTest6 = const Value.absent(),
          Value<double?> asLeftRead6 = const Value.absent(),
          Value<double?> asLeftDiff6 = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<String?> weightTestUnit = const Value.absent(),
          DateTime? timestamp}) =>
      WeightTest(
        id: id ?? this.id,
        serviceReportId: serviceReportId ?? this.serviceReportId,
        eccentricityType: eccentricityType ?? this.eccentricityType,
        eccentricityPoints: eccentricityPoints ?? this.eccentricityPoints,
        eccentricityDirections: eccentricityDirections.present
            ? eccentricityDirections.value
            : this.eccentricityDirections,
        eccentricity1:
            eccentricity1.present ? eccentricity1.value : this.eccentricity1,
        eccentricity2:
            eccentricity2.present ? eccentricity2.value : this.eccentricity2,
        eccentricity3:
            eccentricity3.present ? eccentricity3.value : this.eccentricity3,
        eccentricity4:
            eccentricity4.present ? eccentricity4.value : this.eccentricity4,
        eccentricity5:
            eccentricity5.present ? eccentricity5.value : this.eccentricity5,
        eccentricity6:
            eccentricity6.present ? eccentricity6.value : this.eccentricity6,
        eccentricity7:
            eccentricity7.present ? eccentricity7.value : this.eccentricity7,
        eccentricity8:
            eccentricity8.present ? eccentricity8.value : this.eccentricity8,
        eccentricity9:
            eccentricity9.present ? eccentricity9.value : this.eccentricity9,
        eccentricity10:
            eccentricity10.present ? eccentricity10.value : this.eccentricity10,
        eccentricityError: eccentricityError.present
            ? eccentricityError.value
            : this.eccentricityError,
        asFoundTest1:
            asFoundTest1.present ? asFoundTest1.value : this.asFoundTest1,
        asFoundRead1:
            asFoundRead1.present ? asFoundRead1.value : this.asFoundRead1,
        asFoundDiff1:
            asFoundDiff1.present ? asFoundDiff1.value : this.asFoundDiff1,
        asFoundTest2:
            asFoundTest2.present ? asFoundTest2.value : this.asFoundTest2,
        asFoundRead2:
            asFoundRead2.present ? asFoundRead2.value : this.asFoundRead2,
        asFoundDiff2:
            asFoundDiff2.present ? asFoundDiff2.value : this.asFoundDiff2,
        asFoundTest3:
            asFoundTest3.present ? asFoundTest3.value : this.asFoundTest3,
        asFoundRead3:
            asFoundRead3.present ? asFoundRead3.value : this.asFoundRead3,
        asFoundDiff3:
            asFoundDiff3.present ? asFoundDiff3.value : this.asFoundDiff3,
        asFoundTest4:
            asFoundTest4.present ? asFoundTest4.value : this.asFoundTest4,
        asFoundRead4:
            asFoundRead4.present ? asFoundRead4.value : this.asFoundRead4,
        asFoundDiff4:
            asFoundDiff4.present ? asFoundDiff4.value : this.asFoundDiff4,
        asFoundTest5:
            asFoundTest5.present ? asFoundTest5.value : this.asFoundTest5,
        asFoundRead5:
            asFoundRead5.present ? asFoundRead5.value : this.asFoundRead5,
        asFoundDiff5:
            asFoundDiff5.present ? asFoundDiff5.value : this.asFoundDiff5,
        asFoundTest6:
            asFoundTest6.present ? asFoundTest6.value : this.asFoundTest6,
        asFoundRead6:
            asFoundRead6.present ? asFoundRead6.value : this.asFoundRead6,
        asFoundDiff6:
            asFoundDiff6.present ? asFoundDiff6.value : this.asFoundDiff6,
        asLeftTest1: asLeftTest1.present ? asLeftTest1.value : this.asLeftTest1,
        asLeftRead1: asLeftRead1.present ? asLeftRead1.value : this.asLeftRead1,
        asLeftDiff1: asLeftDiff1.present ? asLeftDiff1.value : this.asLeftDiff1,
        asLeftTest2: asLeftTest2.present ? asLeftTest2.value : this.asLeftTest2,
        asLeftRead2: asLeftRead2.present ? asLeftRead2.value : this.asLeftRead2,
        asLeftDiff2: asLeftDiff2.present ? asLeftDiff2.value : this.asLeftDiff2,
        asLeftTest3: asLeftTest3.present ? asLeftTest3.value : this.asLeftTest3,
        asLeftRead3: asLeftRead3.present ? asLeftRead3.value : this.asLeftRead3,
        asLeftDiff3: asLeftDiff3.present ? asLeftDiff3.value : this.asLeftDiff3,
        asLeftTest4: asLeftTest4.present ? asLeftTest4.value : this.asLeftTest4,
        asLeftRead4: asLeftRead4.present ? asLeftRead4.value : this.asLeftRead4,
        asLeftDiff4: asLeftDiff4.present ? asLeftDiff4.value : this.asLeftDiff4,
        asLeftTest5: asLeftTest5.present ? asLeftTest5.value : this.asLeftTest5,
        asLeftRead5: asLeftRead5.present ? asLeftRead5.value : this.asLeftRead5,
        asLeftDiff5: asLeftDiff5.present ? asLeftDiff5.value : this.asLeftDiff5,
        asLeftTest6: asLeftTest6.present ? asLeftTest6.value : this.asLeftTest6,
        asLeftRead6: asLeftRead6.present ? asLeftRead6.value : this.asLeftRead6,
        asLeftDiff6: asLeftDiff6.present ? asLeftDiff6.value : this.asLeftDiff6,
        notes: notes.present ? notes.value : this.notes,
        weightTestUnit:
            weightTestUnit.present ? weightTestUnit.value : this.weightTestUnit,
        timestamp: timestamp ?? this.timestamp,
      );
  WeightTest copyWithCompanion(WeightTestsCompanion data) {
    return WeightTest(
      id: data.id.present ? data.id.value : this.id,
      serviceReportId: data.serviceReportId.present
          ? data.serviceReportId.value
          : this.serviceReportId,
      eccentricityType: data.eccentricityType.present
          ? data.eccentricityType.value
          : this.eccentricityType,
      eccentricityPoints: data.eccentricityPoints.present
          ? data.eccentricityPoints.value
          : this.eccentricityPoints,
      eccentricityDirections: data.eccentricityDirections.present
          ? data.eccentricityDirections.value
          : this.eccentricityDirections,
      eccentricity1: data.eccentricity1.present
          ? data.eccentricity1.value
          : this.eccentricity1,
      eccentricity2: data.eccentricity2.present
          ? data.eccentricity2.value
          : this.eccentricity2,
      eccentricity3: data.eccentricity3.present
          ? data.eccentricity3.value
          : this.eccentricity3,
      eccentricity4: data.eccentricity4.present
          ? data.eccentricity4.value
          : this.eccentricity4,
      eccentricity5: data.eccentricity5.present
          ? data.eccentricity5.value
          : this.eccentricity5,
      eccentricity6: data.eccentricity6.present
          ? data.eccentricity6.value
          : this.eccentricity6,
      eccentricity7: data.eccentricity7.present
          ? data.eccentricity7.value
          : this.eccentricity7,
      eccentricity8: data.eccentricity8.present
          ? data.eccentricity8.value
          : this.eccentricity8,
      eccentricity9: data.eccentricity9.present
          ? data.eccentricity9.value
          : this.eccentricity9,
      eccentricity10: data.eccentricity10.present
          ? data.eccentricity10.value
          : this.eccentricity10,
      eccentricityError: data.eccentricityError.present
          ? data.eccentricityError.value
          : this.eccentricityError,
      asFoundTest1: data.asFoundTest1.present
          ? data.asFoundTest1.value
          : this.asFoundTest1,
      asFoundRead1: data.asFoundRead1.present
          ? data.asFoundRead1.value
          : this.asFoundRead1,
      asFoundDiff1: data.asFoundDiff1.present
          ? data.asFoundDiff1.value
          : this.asFoundDiff1,
      asFoundTest2: data.asFoundTest2.present
          ? data.asFoundTest2.value
          : this.asFoundTest2,
      asFoundRead2: data.asFoundRead2.present
          ? data.asFoundRead2.value
          : this.asFoundRead2,
      asFoundDiff2: data.asFoundDiff2.present
          ? data.asFoundDiff2.value
          : this.asFoundDiff2,
      asFoundTest3: data.asFoundTest3.present
          ? data.asFoundTest3.value
          : this.asFoundTest3,
      asFoundRead3: data.asFoundRead3.present
          ? data.asFoundRead3.value
          : this.asFoundRead3,
      asFoundDiff3: data.asFoundDiff3.present
          ? data.asFoundDiff3.value
          : this.asFoundDiff3,
      asFoundTest4: data.asFoundTest4.present
          ? data.asFoundTest4.value
          : this.asFoundTest4,
      asFoundRead4: data.asFoundRead4.present
          ? data.asFoundRead4.value
          : this.asFoundRead4,
      asFoundDiff4: data.asFoundDiff4.present
          ? data.asFoundDiff4.value
          : this.asFoundDiff4,
      asFoundTest5: data.asFoundTest5.present
          ? data.asFoundTest5.value
          : this.asFoundTest5,
      asFoundRead5: data.asFoundRead5.present
          ? data.asFoundRead5.value
          : this.asFoundRead5,
      asFoundDiff5: data.asFoundDiff5.present
          ? data.asFoundDiff5.value
          : this.asFoundDiff5,
      asFoundTest6: data.asFoundTest6.present
          ? data.asFoundTest6.value
          : this.asFoundTest6,
      asFoundRead6: data.asFoundRead6.present
          ? data.asFoundRead6.value
          : this.asFoundRead6,
      asFoundDiff6: data.asFoundDiff6.present
          ? data.asFoundDiff6.value
          : this.asFoundDiff6,
      asLeftTest1:
          data.asLeftTest1.present ? data.asLeftTest1.value : this.asLeftTest1,
      asLeftRead1:
          data.asLeftRead1.present ? data.asLeftRead1.value : this.asLeftRead1,
      asLeftDiff1:
          data.asLeftDiff1.present ? data.asLeftDiff1.value : this.asLeftDiff1,
      asLeftTest2:
          data.asLeftTest2.present ? data.asLeftTest2.value : this.asLeftTest2,
      asLeftRead2:
          data.asLeftRead2.present ? data.asLeftRead2.value : this.asLeftRead2,
      asLeftDiff2:
          data.asLeftDiff2.present ? data.asLeftDiff2.value : this.asLeftDiff2,
      asLeftTest3:
          data.asLeftTest3.present ? data.asLeftTest3.value : this.asLeftTest3,
      asLeftRead3:
          data.asLeftRead3.present ? data.asLeftRead3.value : this.asLeftRead3,
      asLeftDiff3:
          data.asLeftDiff3.present ? data.asLeftDiff3.value : this.asLeftDiff3,
      asLeftTest4:
          data.asLeftTest4.present ? data.asLeftTest4.value : this.asLeftTest4,
      asLeftRead4:
          data.asLeftRead4.present ? data.asLeftRead4.value : this.asLeftRead4,
      asLeftDiff4:
          data.asLeftDiff4.present ? data.asLeftDiff4.value : this.asLeftDiff4,
      asLeftTest5:
          data.asLeftTest5.present ? data.asLeftTest5.value : this.asLeftTest5,
      asLeftRead5:
          data.asLeftRead5.present ? data.asLeftRead5.value : this.asLeftRead5,
      asLeftDiff5:
          data.asLeftDiff5.present ? data.asLeftDiff5.value : this.asLeftDiff5,
      asLeftTest6:
          data.asLeftTest6.present ? data.asLeftTest6.value : this.asLeftTest6,
      asLeftRead6:
          data.asLeftRead6.present ? data.asLeftRead6.value : this.asLeftRead6,
      asLeftDiff6:
          data.asLeftDiff6.present ? data.asLeftDiff6.value : this.asLeftDiff6,
      notes: data.notes.present ? data.notes.value : this.notes,
      weightTestUnit: data.weightTestUnit.present
          ? data.weightTestUnit.value
          : this.weightTestUnit,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeightTest(')
          ..write('id: $id, ')
          ..write('serviceReportId: $serviceReportId, ')
          ..write('eccentricityType: $eccentricityType, ')
          ..write('eccentricityPoints: $eccentricityPoints, ')
          ..write('eccentricityDirections: $eccentricityDirections, ')
          ..write('eccentricity1: $eccentricity1, ')
          ..write('eccentricity2: $eccentricity2, ')
          ..write('eccentricity3: $eccentricity3, ')
          ..write('eccentricity4: $eccentricity4, ')
          ..write('eccentricity5: $eccentricity5, ')
          ..write('eccentricity6: $eccentricity6, ')
          ..write('eccentricity7: $eccentricity7, ')
          ..write('eccentricity8: $eccentricity8, ')
          ..write('eccentricity9: $eccentricity9, ')
          ..write('eccentricity10: $eccentricity10, ')
          ..write('eccentricityError: $eccentricityError, ')
          ..write('asFoundTest1: $asFoundTest1, ')
          ..write('asFoundRead1: $asFoundRead1, ')
          ..write('asFoundDiff1: $asFoundDiff1, ')
          ..write('asFoundTest2: $asFoundTest2, ')
          ..write('asFoundRead2: $asFoundRead2, ')
          ..write('asFoundDiff2: $asFoundDiff2, ')
          ..write('asFoundTest3: $asFoundTest3, ')
          ..write('asFoundRead3: $asFoundRead3, ')
          ..write('asFoundDiff3: $asFoundDiff3, ')
          ..write('asFoundTest4: $asFoundTest4, ')
          ..write('asFoundRead4: $asFoundRead4, ')
          ..write('asFoundDiff4: $asFoundDiff4, ')
          ..write('asFoundTest5: $asFoundTest5, ')
          ..write('asFoundRead5: $asFoundRead5, ')
          ..write('asFoundDiff5: $asFoundDiff5, ')
          ..write('asFoundTest6: $asFoundTest6, ')
          ..write('asFoundRead6: $asFoundRead6, ')
          ..write('asFoundDiff6: $asFoundDiff6, ')
          ..write('asLeftTest1: $asLeftTest1, ')
          ..write('asLeftRead1: $asLeftRead1, ')
          ..write('asLeftDiff1: $asLeftDiff1, ')
          ..write('asLeftTest2: $asLeftTest2, ')
          ..write('asLeftRead2: $asLeftRead2, ')
          ..write('asLeftDiff2: $asLeftDiff2, ')
          ..write('asLeftTest3: $asLeftTest3, ')
          ..write('asLeftRead3: $asLeftRead3, ')
          ..write('asLeftDiff3: $asLeftDiff3, ')
          ..write('asLeftTest4: $asLeftTest4, ')
          ..write('asLeftRead4: $asLeftRead4, ')
          ..write('asLeftDiff4: $asLeftDiff4, ')
          ..write('asLeftTest5: $asLeftTest5, ')
          ..write('asLeftRead5: $asLeftRead5, ')
          ..write('asLeftDiff5: $asLeftDiff5, ')
          ..write('asLeftTest6: $asLeftTest6, ')
          ..write('asLeftRead6: $asLeftRead6, ')
          ..write('asLeftDiff6: $asLeftDiff6, ')
          ..write('notes: $notes, ')
          ..write('weightTestUnit: $weightTestUnit, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        serviceReportId,
        eccentricityType,
        eccentricityPoints,
        eccentricityDirections,
        eccentricity1,
        eccentricity2,
        eccentricity3,
        eccentricity4,
        eccentricity5,
        eccentricity6,
        eccentricity7,
        eccentricity8,
        eccentricity9,
        eccentricity10,
        eccentricityError,
        asFoundTest1,
        asFoundRead1,
        asFoundDiff1,
        asFoundTest2,
        asFoundRead2,
        asFoundDiff2,
        asFoundTest3,
        asFoundRead3,
        asFoundDiff3,
        asFoundTest4,
        asFoundRead4,
        asFoundDiff4,
        asFoundTest5,
        asFoundRead5,
        asFoundDiff5,
        asFoundTest6,
        asFoundRead6,
        asFoundDiff6,
        asLeftTest1,
        asLeftRead1,
        asLeftDiff1,
        asLeftTest2,
        asLeftRead2,
        asLeftDiff2,
        asLeftTest3,
        asLeftRead3,
        asLeftDiff3,
        asLeftTest4,
        asLeftRead4,
        asLeftDiff4,
        asLeftTest5,
        asLeftRead5,
        asLeftDiff5,
        asLeftTest6,
        asLeftRead6,
        asLeftDiff6,
        notes,
        weightTestUnit,
        timestamp
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeightTest &&
          other.id == this.id &&
          other.serviceReportId == this.serviceReportId &&
          other.eccentricityType == this.eccentricityType &&
          other.eccentricityPoints == this.eccentricityPoints &&
          other.eccentricityDirections == this.eccentricityDirections &&
          other.eccentricity1 == this.eccentricity1 &&
          other.eccentricity2 == this.eccentricity2 &&
          other.eccentricity3 == this.eccentricity3 &&
          other.eccentricity4 == this.eccentricity4 &&
          other.eccentricity5 == this.eccentricity5 &&
          other.eccentricity6 == this.eccentricity6 &&
          other.eccentricity7 == this.eccentricity7 &&
          other.eccentricity8 == this.eccentricity8 &&
          other.eccentricity9 == this.eccentricity9 &&
          other.eccentricity10 == this.eccentricity10 &&
          other.eccentricityError == this.eccentricityError &&
          other.asFoundTest1 == this.asFoundTest1 &&
          other.asFoundRead1 == this.asFoundRead1 &&
          other.asFoundDiff1 == this.asFoundDiff1 &&
          other.asFoundTest2 == this.asFoundTest2 &&
          other.asFoundRead2 == this.asFoundRead2 &&
          other.asFoundDiff2 == this.asFoundDiff2 &&
          other.asFoundTest3 == this.asFoundTest3 &&
          other.asFoundRead3 == this.asFoundRead3 &&
          other.asFoundDiff3 == this.asFoundDiff3 &&
          other.asFoundTest4 == this.asFoundTest4 &&
          other.asFoundRead4 == this.asFoundRead4 &&
          other.asFoundDiff4 == this.asFoundDiff4 &&
          other.asFoundTest5 == this.asFoundTest5 &&
          other.asFoundRead5 == this.asFoundRead5 &&
          other.asFoundDiff5 == this.asFoundDiff5 &&
          other.asFoundTest6 == this.asFoundTest6 &&
          other.asFoundRead6 == this.asFoundRead6 &&
          other.asFoundDiff6 == this.asFoundDiff6 &&
          other.asLeftTest1 == this.asLeftTest1 &&
          other.asLeftRead1 == this.asLeftRead1 &&
          other.asLeftDiff1 == this.asLeftDiff1 &&
          other.asLeftTest2 == this.asLeftTest2 &&
          other.asLeftRead2 == this.asLeftRead2 &&
          other.asLeftDiff2 == this.asLeftDiff2 &&
          other.asLeftTest3 == this.asLeftTest3 &&
          other.asLeftRead3 == this.asLeftRead3 &&
          other.asLeftDiff3 == this.asLeftDiff3 &&
          other.asLeftTest4 == this.asLeftTest4 &&
          other.asLeftRead4 == this.asLeftRead4 &&
          other.asLeftDiff4 == this.asLeftDiff4 &&
          other.asLeftTest5 == this.asLeftTest5 &&
          other.asLeftRead5 == this.asLeftRead5 &&
          other.asLeftDiff5 == this.asLeftDiff5 &&
          other.asLeftTest6 == this.asLeftTest6 &&
          other.asLeftRead6 == this.asLeftRead6 &&
          other.asLeftDiff6 == this.asLeftDiff6 &&
          other.notes == this.notes &&
          other.weightTestUnit == this.weightTestUnit &&
          other.timestamp == this.timestamp);
}

class WeightTestsCompanion extends UpdateCompanion<WeightTest> {
  final Value<int> id;
  final Value<int> serviceReportId;
  final Value<String> eccentricityType;
  final Value<int> eccentricityPoints;
  final Value<String?> eccentricityDirections;
  final Value<double?> eccentricity1;
  final Value<double?> eccentricity2;
  final Value<double?> eccentricity3;
  final Value<double?> eccentricity4;
  final Value<double?> eccentricity5;
  final Value<double?> eccentricity6;
  final Value<double?> eccentricity7;
  final Value<double?> eccentricity8;
  final Value<double?> eccentricity9;
  final Value<double?> eccentricity10;
  final Value<String?> eccentricityError;
  final Value<double?> asFoundTest1;
  final Value<double?> asFoundRead1;
  final Value<double?> asFoundDiff1;
  final Value<double?> asFoundTest2;
  final Value<double?> asFoundRead2;
  final Value<double?> asFoundDiff2;
  final Value<double?> asFoundTest3;
  final Value<double?> asFoundRead3;
  final Value<double?> asFoundDiff3;
  final Value<double?> asFoundTest4;
  final Value<double?> asFoundRead4;
  final Value<double?> asFoundDiff4;
  final Value<double?> asFoundTest5;
  final Value<double?> asFoundRead5;
  final Value<double?> asFoundDiff5;
  final Value<double?> asFoundTest6;
  final Value<double?> asFoundRead6;
  final Value<double?> asFoundDiff6;
  final Value<double?> asLeftTest1;
  final Value<double?> asLeftRead1;
  final Value<double?> asLeftDiff1;
  final Value<double?> asLeftTest2;
  final Value<double?> asLeftRead2;
  final Value<double?> asLeftDiff2;
  final Value<double?> asLeftTest3;
  final Value<double?> asLeftRead3;
  final Value<double?> asLeftDiff3;
  final Value<double?> asLeftTest4;
  final Value<double?> asLeftRead4;
  final Value<double?> asLeftDiff4;
  final Value<double?> asLeftTest5;
  final Value<double?> asLeftRead5;
  final Value<double?> asLeftDiff5;
  final Value<double?> asLeftTest6;
  final Value<double?> asLeftRead6;
  final Value<double?> asLeftDiff6;
  final Value<String?> notes;
  final Value<String?> weightTestUnit;
  final Value<DateTime> timestamp;
  const WeightTestsCompanion({
    this.id = const Value.absent(),
    this.serviceReportId = const Value.absent(),
    this.eccentricityType = const Value.absent(),
    this.eccentricityPoints = const Value.absent(),
    this.eccentricityDirections = const Value.absent(),
    this.eccentricity1 = const Value.absent(),
    this.eccentricity2 = const Value.absent(),
    this.eccentricity3 = const Value.absent(),
    this.eccentricity4 = const Value.absent(),
    this.eccentricity5 = const Value.absent(),
    this.eccentricity6 = const Value.absent(),
    this.eccentricity7 = const Value.absent(),
    this.eccentricity8 = const Value.absent(),
    this.eccentricity9 = const Value.absent(),
    this.eccentricity10 = const Value.absent(),
    this.eccentricityError = const Value.absent(),
    this.asFoundTest1 = const Value.absent(),
    this.asFoundRead1 = const Value.absent(),
    this.asFoundDiff1 = const Value.absent(),
    this.asFoundTest2 = const Value.absent(),
    this.asFoundRead2 = const Value.absent(),
    this.asFoundDiff2 = const Value.absent(),
    this.asFoundTest3 = const Value.absent(),
    this.asFoundRead3 = const Value.absent(),
    this.asFoundDiff3 = const Value.absent(),
    this.asFoundTest4 = const Value.absent(),
    this.asFoundRead4 = const Value.absent(),
    this.asFoundDiff4 = const Value.absent(),
    this.asFoundTest5 = const Value.absent(),
    this.asFoundRead5 = const Value.absent(),
    this.asFoundDiff5 = const Value.absent(),
    this.asFoundTest6 = const Value.absent(),
    this.asFoundRead6 = const Value.absent(),
    this.asFoundDiff6 = const Value.absent(),
    this.asLeftTest1 = const Value.absent(),
    this.asLeftRead1 = const Value.absent(),
    this.asLeftDiff1 = const Value.absent(),
    this.asLeftTest2 = const Value.absent(),
    this.asLeftRead2 = const Value.absent(),
    this.asLeftDiff2 = const Value.absent(),
    this.asLeftTest3 = const Value.absent(),
    this.asLeftRead3 = const Value.absent(),
    this.asLeftDiff3 = const Value.absent(),
    this.asLeftTest4 = const Value.absent(),
    this.asLeftRead4 = const Value.absent(),
    this.asLeftDiff4 = const Value.absent(),
    this.asLeftTest5 = const Value.absent(),
    this.asLeftRead5 = const Value.absent(),
    this.asLeftDiff5 = const Value.absent(),
    this.asLeftTest6 = const Value.absent(),
    this.asLeftRead6 = const Value.absent(),
    this.asLeftDiff6 = const Value.absent(),
    this.notes = const Value.absent(),
    this.weightTestUnit = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  WeightTestsCompanion.insert({
    this.id = const Value.absent(),
    required int serviceReportId,
    required String eccentricityType,
    this.eccentricityPoints = const Value.absent(),
    this.eccentricityDirections = const Value.absent(),
    this.eccentricity1 = const Value.absent(),
    this.eccentricity2 = const Value.absent(),
    this.eccentricity3 = const Value.absent(),
    this.eccentricity4 = const Value.absent(),
    this.eccentricity5 = const Value.absent(),
    this.eccentricity6 = const Value.absent(),
    this.eccentricity7 = const Value.absent(),
    this.eccentricity8 = const Value.absent(),
    this.eccentricity9 = const Value.absent(),
    this.eccentricity10 = const Value.absent(),
    this.eccentricityError = const Value.absent(),
    this.asFoundTest1 = const Value.absent(),
    this.asFoundRead1 = const Value.absent(),
    this.asFoundDiff1 = const Value.absent(),
    this.asFoundTest2 = const Value.absent(),
    this.asFoundRead2 = const Value.absent(),
    this.asFoundDiff2 = const Value.absent(),
    this.asFoundTest3 = const Value.absent(),
    this.asFoundRead3 = const Value.absent(),
    this.asFoundDiff3 = const Value.absent(),
    this.asFoundTest4 = const Value.absent(),
    this.asFoundRead4 = const Value.absent(),
    this.asFoundDiff4 = const Value.absent(),
    this.asFoundTest5 = const Value.absent(),
    this.asFoundRead5 = const Value.absent(),
    this.asFoundDiff5 = const Value.absent(),
    this.asFoundTest6 = const Value.absent(),
    this.asFoundRead6 = const Value.absent(),
    this.asFoundDiff6 = const Value.absent(),
    this.asLeftTest1 = const Value.absent(),
    this.asLeftRead1 = const Value.absent(),
    this.asLeftDiff1 = const Value.absent(),
    this.asLeftTest2 = const Value.absent(),
    this.asLeftRead2 = const Value.absent(),
    this.asLeftDiff2 = const Value.absent(),
    this.asLeftTest3 = const Value.absent(),
    this.asLeftRead3 = const Value.absent(),
    this.asLeftDiff3 = const Value.absent(),
    this.asLeftTest4 = const Value.absent(),
    this.asLeftRead4 = const Value.absent(),
    this.asLeftDiff4 = const Value.absent(),
    this.asLeftTest5 = const Value.absent(),
    this.asLeftRead5 = const Value.absent(),
    this.asLeftDiff5 = const Value.absent(),
    this.asLeftTest6 = const Value.absent(),
    this.asLeftRead6 = const Value.absent(),
    this.asLeftDiff6 = const Value.absent(),
    this.notes = const Value.absent(),
    this.weightTestUnit = const Value.absent(),
    this.timestamp = const Value.absent(),
  })  : serviceReportId = Value(serviceReportId),
        eccentricityType = Value(eccentricityType);
  static Insertable<WeightTest> custom({
    Expression<int>? id,
    Expression<int>? serviceReportId,
    Expression<String>? eccentricityType,
    Expression<int>? eccentricityPoints,
    Expression<String>? eccentricityDirections,
    Expression<double>? eccentricity1,
    Expression<double>? eccentricity2,
    Expression<double>? eccentricity3,
    Expression<double>? eccentricity4,
    Expression<double>? eccentricity5,
    Expression<double>? eccentricity6,
    Expression<double>? eccentricity7,
    Expression<double>? eccentricity8,
    Expression<double>? eccentricity9,
    Expression<double>? eccentricity10,
    Expression<String>? eccentricityError,
    Expression<double>? asFoundTest1,
    Expression<double>? asFoundRead1,
    Expression<double>? asFoundDiff1,
    Expression<double>? asFoundTest2,
    Expression<double>? asFoundRead2,
    Expression<double>? asFoundDiff2,
    Expression<double>? asFoundTest3,
    Expression<double>? asFoundRead3,
    Expression<double>? asFoundDiff3,
    Expression<double>? asFoundTest4,
    Expression<double>? asFoundRead4,
    Expression<double>? asFoundDiff4,
    Expression<double>? asFoundTest5,
    Expression<double>? asFoundRead5,
    Expression<double>? asFoundDiff5,
    Expression<double>? asFoundTest6,
    Expression<double>? asFoundRead6,
    Expression<double>? asFoundDiff6,
    Expression<double>? asLeftTest1,
    Expression<double>? asLeftRead1,
    Expression<double>? asLeftDiff1,
    Expression<double>? asLeftTest2,
    Expression<double>? asLeftRead2,
    Expression<double>? asLeftDiff2,
    Expression<double>? asLeftTest3,
    Expression<double>? asLeftRead3,
    Expression<double>? asLeftDiff3,
    Expression<double>? asLeftTest4,
    Expression<double>? asLeftRead4,
    Expression<double>? asLeftDiff4,
    Expression<double>? asLeftTest5,
    Expression<double>? asLeftRead5,
    Expression<double>? asLeftDiff5,
    Expression<double>? asLeftTest6,
    Expression<double>? asLeftRead6,
    Expression<double>? asLeftDiff6,
    Expression<String>? notes,
    Expression<String>? weightTestUnit,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceReportId != null) 'service_report_id': serviceReportId,
      if (eccentricityType != null) 'eccentricity_type': eccentricityType,
      if (eccentricityPoints != null) 'eccentricity_points': eccentricityPoints,
      if (eccentricityDirections != null)
        'eccentricity_directions': eccentricityDirections,
      if (eccentricity1 != null) 'eccentricity1': eccentricity1,
      if (eccentricity2 != null) 'eccentricity2': eccentricity2,
      if (eccentricity3 != null) 'eccentricity3': eccentricity3,
      if (eccentricity4 != null) 'eccentricity4': eccentricity4,
      if (eccentricity5 != null) 'eccentricity5': eccentricity5,
      if (eccentricity6 != null) 'eccentricity6': eccentricity6,
      if (eccentricity7 != null) 'eccentricity7': eccentricity7,
      if (eccentricity8 != null) 'eccentricity8': eccentricity8,
      if (eccentricity9 != null) 'eccentricity9': eccentricity9,
      if (eccentricity10 != null) 'eccentricity10': eccentricity10,
      if (eccentricityError != null) 'eccentricity_error': eccentricityError,
      if (asFoundTest1 != null) 'as_found_test1': asFoundTest1,
      if (asFoundRead1 != null) 'as_found_read1': asFoundRead1,
      if (asFoundDiff1 != null) 'as_found_diff1': asFoundDiff1,
      if (asFoundTest2 != null) 'as_found_test2': asFoundTest2,
      if (asFoundRead2 != null) 'as_found_read2': asFoundRead2,
      if (asFoundDiff2 != null) 'as_found_diff2': asFoundDiff2,
      if (asFoundTest3 != null) 'as_found_test3': asFoundTest3,
      if (asFoundRead3 != null) 'as_found_read3': asFoundRead3,
      if (asFoundDiff3 != null) 'as_found_diff3': asFoundDiff3,
      if (asFoundTest4 != null) 'as_found_test4': asFoundTest4,
      if (asFoundRead4 != null) 'as_found_read4': asFoundRead4,
      if (asFoundDiff4 != null) 'as_found_diff4': asFoundDiff4,
      if (asFoundTest5 != null) 'as_found_test5': asFoundTest5,
      if (asFoundRead5 != null) 'as_found_read5': asFoundRead5,
      if (asFoundDiff5 != null) 'as_found_diff5': asFoundDiff5,
      if (asFoundTest6 != null) 'as_found_test6': asFoundTest6,
      if (asFoundRead6 != null) 'as_found_read6': asFoundRead6,
      if (asFoundDiff6 != null) 'as_found_diff6': asFoundDiff6,
      if (asLeftTest1 != null) 'as_left_test1': asLeftTest1,
      if (asLeftRead1 != null) 'as_left_read1': asLeftRead1,
      if (asLeftDiff1 != null) 'as_left_diff1': asLeftDiff1,
      if (asLeftTest2 != null) 'as_left_test2': asLeftTest2,
      if (asLeftRead2 != null) 'as_left_read2': asLeftRead2,
      if (asLeftDiff2 != null) 'as_left_diff2': asLeftDiff2,
      if (asLeftTest3 != null) 'as_left_test3': asLeftTest3,
      if (asLeftRead3 != null) 'as_left_read3': asLeftRead3,
      if (asLeftDiff3 != null) 'as_left_diff3': asLeftDiff3,
      if (asLeftTest4 != null) 'as_left_test4': asLeftTest4,
      if (asLeftRead4 != null) 'as_left_read4': asLeftRead4,
      if (asLeftDiff4 != null) 'as_left_diff4': asLeftDiff4,
      if (asLeftTest5 != null) 'as_left_test5': asLeftTest5,
      if (asLeftRead5 != null) 'as_left_read5': asLeftRead5,
      if (asLeftDiff5 != null) 'as_left_diff5': asLeftDiff5,
      if (asLeftTest6 != null) 'as_left_test6': asLeftTest6,
      if (asLeftRead6 != null) 'as_left_read6': asLeftRead6,
      if (asLeftDiff6 != null) 'as_left_diff6': asLeftDiff6,
      if (notes != null) 'notes': notes,
      if (weightTestUnit != null) 'weight_test_unit': weightTestUnit,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  WeightTestsCompanion copyWith(
      {Value<int>? id,
      Value<int>? serviceReportId,
      Value<String>? eccentricityType,
      Value<int>? eccentricityPoints,
      Value<String?>? eccentricityDirections,
      Value<double?>? eccentricity1,
      Value<double?>? eccentricity2,
      Value<double?>? eccentricity3,
      Value<double?>? eccentricity4,
      Value<double?>? eccentricity5,
      Value<double?>? eccentricity6,
      Value<double?>? eccentricity7,
      Value<double?>? eccentricity8,
      Value<double?>? eccentricity9,
      Value<double?>? eccentricity10,
      Value<String?>? eccentricityError,
      Value<double?>? asFoundTest1,
      Value<double?>? asFoundRead1,
      Value<double?>? asFoundDiff1,
      Value<double?>? asFoundTest2,
      Value<double?>? asFoundRead2,
      Value<double?>? asFoundDiff2,
      Value<double?>? asFoundTest3,
      Value<double?>? asFoundRead3,
      Value<double?>? asFoundDiff3,
      Value<double?>? asFoundTest4,
      Value<double?>? asFoundRead4,
      Value<double?>? asFoundDiff4,
      Value<double?>? asFoundTest5,
      Value<double?>? asFoundRead5,
      Value<double?>? asFoundDiff5,
      Value<double?>? asFoundTest6,
      Value<double?>? asFoundRead6,
      Value<double?>? asFoundDiff6,
      Value<double?>? asLeftTest1,
      Value<double?>? asLeftRead1,
      Value<double?>? asLeftDiff1,
      Value<double?>? asLeftTest2,
      Value<double?>? asLeftRead2,
      Value<double?>? asLeftDiff2,
      Value<double?>? asLeftTest3,
      Value<double?>? asLeftRead3,
      Value<double?>? asLeftDiff3,
      Value<double?>? asLeftTest4,
      Value<double?>? asLeftRead4,
      Value<double?>? asLeftDiff4,
      Value<double?>? asLeftTest5,
      Value<double?>? asLeftRead5,
      Value<double?>? asLeftDiff5,
      Value<double?>? asLeftTest6,
      Value<double?>? asLeftRead6,
      Value<double?>? asLeftDiff6,
      Value<String?>? notes,
      Value<String?>? weightTestUnit,
      Value<DateTime>? timestamp}) {
    return WeightTestsCompanion(
      id: id ?? this.id,
      serviceReportId: serviceReportId ?? this.serviceReportId,
      eccentricityType: eccentricityType ?? this.eccentricityType,
      eccentricityPoints: eccentricityPoints ?? this.eccentricityPoints,
      eccentricityDirections:
          eccentricityDirections ?? this.eccentricityDirections,
      eccentricity1: eccentricity1 ?? this.eccentricity1,
      eccentricity2: eccentricity2 ?? this.eccentricity2,
      eccentricity3: eccentricity3 ?? this.eccentricity3,
      eccentricity4: eccentricity4 ?? this.eccentricity4,
      eccentricity5: eccentricity5 ?? this.eccentricity5,
      eccentricity6: eccentricity6 ?? this.eccentricity6,
      eccentricity7: eccentricity7 ?? this.eccentricity7,
      eccentricity8: eccentricity8 ?? this.eccentricity8,
      eccentricity9: eccentricity9 ?? this.eccentricity9,
      eccentricity10: eccentricity10 ?? this.eccentricity10,
      eccentricityError: eccentricityError ?? this.eccentricityError,
      asFoundTest1: asFoundTest1 ?? this.asFoundTest1,
      asFoundRead1: asFoundRead1 ?? this.asFoundRead1,
      asFoundDiff1: asFoundDiff1 ?? this.asFoundDiff1,
      asFoundTest2: asFoundTest2 ?? this.asFoundTest2,
      asFoundRead2: asFoundRead2 ?? this.asFoundRead2,
      asFoundDiff2: asFoundDiff2 ?? this.asFoundDiff2,
      asFoundTest3: asFoundTest3 ?? this.asFoundTest3,
      asFoundRead3: asFoundRead3 ?? this.asFoundRead3,
      asFoundDiff3: asFoundDiff3 ?? this.asFoundDiff3,
      asFoundTest4: asFoundTest4 ?? this.asFoundTest4,
      asFoundRead4: asFoundRead4 ?? this.asFoundRead4,
      asFoundDiff4: asFoundDiff4 ?? this.asFoundDiff4,
      asFoundTest5: asFoundTest5 ?? this.asFoundTest5,
      asFoundRead5: asFoundRead5 ?? this.asFoundRead5,
      asFoundDiff5: asFoundDiff5 ?? this.asFoundDiff5,
      asFoundTest6: asFoundTest6 ?? this.asFoundTest6,
      asFoundRead6: asFoundRead6 ?? this.asFoundRead6,
      asFoundDiff6: asFoundDiff6 ?? this.asFoundDiff6,
      asLeftTest1: asLeftTest1 ?? this.asLeftTest1,
      asLeftRead1: asLeftRead1 ?? this.asLeftRead1,
      asLeftDiff1: asLeftDiff1 ?? this.asLeftDiff1,
      asLeftTest2: asLeftTest2 ?? this.asLeftTest2,
      asLeftRead2: asLeftRead2 ?? this.asLeftRead2,
      asLeftDiff2: asLeftDiff2 ?? this.asLeftDiff2,
      asLeftTest3: asLeftTest3 ?? this.asLeftTest3,
      asLeftRead3: asLeftRead3 ?? this.asLeftRead3,
      asLeftDiff3: asLeftDiff3 ?? this.asLeftDiff3,
      asLeftTest4: asLeftTest4 ?? this.asLeftTest4,
      asLeftRead4: asLeftRead4 ?? this.asLeftRead4,
      asLeftDiff4: asLeftDiff4 ?? this.asLeftDiff4,
      asLeftTest5: asLeftTest5 ?? this.asLeftTest5,
      asLeftRead5: asLeftRead5 ?? this.asLeftRead5,
      asLeftDiff5: asLeftDiff5 ?? this.asLeftDiff5,
      asLeftTest6: asLeftTest6 ?? this.asLeftTest6,
      asLeftRead6: asLeftRead6 ?? this.asLeftRead6,
      asLeftDiff6: asLeftDiff6 ?? this.asLeftDiff6,
      notes: notes ?? this.notes,
      weightTestUnit: weightTestUnit ?? this.weightTestUnit,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serviceReportId.present) {
      map['service_report_id'] = Variable<int>(serviceReportId.value);
    }
    if (eccentricityType.present) {
      map['eccentricity_type'] = Variable<String>(eccentricityType.value);
    }
    if (eccentricityPoints.present) {
      map['eccentricity_points'] = Variable<int>(eccentricityPoints.value);
    }
    if (eccentricityDirections.present) {
      map['eccentricity_directions'] =
          Variable<String>(eccentricityDirections.value);
    }
    if (eccentricity1.present) {
      map['eccentricity1'] = Variable<double>(eccentricity1.value);
    }
    if (eccentricity2.present) {
      map['eccentricity2'] = Variable<double>(eccentricity2.value);
    }
    if (eccentricity3.present) {
      map['eccentricity3'] = Variable<double>(eccentricity3.value);
    }
    if (eccentricity4.present) {
      map['eccentricity4'] = Variable<double>(eccentricity4.value);
    }
    if (eccentricity5.present) {
      map['eccentricity5'] = Variable<double>(eccentricity5.value);
    }
    if (eccentricity6.present) {
      map['eccentricity6'] = Variable<double>(eccentricity6.value);
    }
    if (eccentricity7.present) {
      map['eccentricity7'] = Variable<double>(eccentricity7.value);
    }
    if (eccentricity8.present) {
      map['eccentricity8'] = Variable<double>(eccentricity8.value);
    }
    if (eccentricity9.present) {
      map['eccentricity9'] = Variable<double>(eccentricity9.value);
    }
    if (eccentricity10.present) {
      map['eccentricity10'] = Variable<double>(eccentricity10.value);
    }
    if (eccentricityError.present) {
      map['eccentricity_error'] = Variable<String>(eccentricityError.value);
    }
    if (asFoundTest1.present) {
      map['as_found_test1'] = Variable<double>(asFoundTest1.value);
    }
    if (asFoundRead1.present) {
      map['as_found_read1'] = Variable<double>(asFoundRead1.value);
    }
    if (asFoundDiff1.present) {
      map['as_found_diff1'] = Variable<double>(asFoundDiff1.value);
    }
    if (asFoundTest2.present) {
      map['as_found_test2'] = Variable<double>(asFoundTest2.value);
    }
    if (asFoundRead2.present) {
      map['as_found_read2'] = Variable<double>(asFoundRead2.value);
    }
    if (asFoundDiff2.present) {
      map['as_found_diff2'] = Variable<double>(asFoundDiff2.value);
    }
    if (asFoundTest3.present) {
      map['as_found_test3'] = Variable<double>(asFoundTest3.value);
    }
    if (asFoundRead3.present) {
      map['as_found_read3'] = Variable<double>(asFoundRead3.value);
    }
    if (asFoundDiff3.present) {
      map['as_found_diff3'] = Variable<double>(asFoundDiff3.value);
    }
    if (asFoundTest4.present) {
      map['as_found_test4'] = Variable<double>(asFoundTest4.value);
    }
    if (asFoundRead4.present) {
      map['as_found_read4'] = Variable<double>(asFoundRead4.value);
    }
    if (asFoundDiff4.present) {
      map['as_found_diff4'] = Variable<double>(asFoundDiff4.value);
    }
    if (asFoundTest5.present) {
      map['as_found_test5'] = Variable<double>(asFoundTest5.value);
    }
    if (asFoundRead5.present) {
      map['as_found_read5'] = Variable<double>(asFoundRead5.value);
    }
    if (asFoundDiff5.present) {
      map['as_found_diff5'] = Variable<double>(asFoundDiff5.value);
    }
    if (asFoundTest6.present) {
      map['as_found_test6'] = Variable<double>(asFoundTest6.value);
    }
    if (asFoundRead6.present) {
      map['as_found_read6'] = Variable<double>(asFoundRead6.value);
    }
    if (asFoundDiff6.present) {
      map['as_found_diff6'] = Variable<double>(asFoundDiff6.value);
    }
    if (asLeftTest1.present) {
      map['as_left_test1'] = Variable<double>(asLeftTest1.value);
    }
    if (asLeftRead1.present) {
      map['as_left_read1'] = Variable<double>(asLeftRead1.value);
    }
    if (asLeftDiff1.present) {
      map['as_left_diff1'] = Variable<double>(asLeftDiff1.value);
    }
    if (asLeftTest2.present) {
      map['as_left_test2'] = Variable<double>(asLeftTest2.value);
    }
    if (asLeftRead2.present) {
      map['as_left_read2'] = Variable<double>(asLeftRead2.value);
    }
    if (asLeftDiff2.present) {
      map['as_left_diff2'] = Variable<double>(asLeftDiff2.value);
    }
    if (asLeftTest3.present) {
      map['as_left_test3'] = Variable<double>(asLeftTest3.value);
    }
    if (asLeftRead3.present) {
      map['as_left_read3'] = Variable<double>(asLeftRead3.value);
    }
    if (asLeftDiff3.present) {
      map['as_left_diff3'] = Variable<double>(asLeftDiff3.value);
    }
    if (asLeftTest4.present) {
      map['as_left_test4'] = Variable<double>(asLeftTest4.value);
    }
    if (asLeftRead4.present) {
      map['as_left_read4'] = Variable<double>(asLeftRead4.value);
    }
    if (asLeftDiff4.present) {
      map['as_left_diff4'] = Variable<double>(asLeftDiff4.value);
    }
    if (asLeftTest5.present) {
      map['as_left_test5'] = Variable<double>(asLeftTest5.value);
    }
    if (asLeftRead5.present) {
      map['as_left_read5'] = Variable<double>(asLeftRead5.value);
    }
    if (asLeftDiff5.present) {
      map['as_left_diff5'] = Variable<double>(asLeftDiff5.value);
    }
    if (asLeftTest6.present) {
      map['as_left_test6'] = Variable<double>(asLeftTest6.value);
    }
    if (asLeftRead6.present) {
      map['as_left_read6'] = Variable<double>(asLeftRead6.value);
    }
    if (asLeftDiff6.present) {
      map['as_left_diff6'] = Variable<double>(asLeftDiff6.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (weightTestUnit.present) {
      map['weight_test_unit'] = Variable<String>(weightTestUnit.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightTestsCompanion(')
          ..write('id: $id, ')
          ..write('serviceReportId: $serviceReportId, ')
          ..write('eccentricityType: $eccentricityType, ')
          ..write('eccentricityPoints: $eccentricityPoints, ')
          ..write('eccentricityDirections: $eccentricityDirections, ')
          ..write('eccentricity1: $eccentricity1, ')
          ..write('eccentricity2: $eccentricity2, ')
          ..write('eccentricity3: $eccentricity3, ')
          ..write('eccentricity4: $eccentricity4, ')
          ..write('eccentricity5: $eccentricity5, ')
          ..write('eccentricity6: $eccentricity6, ')
          ..write('eccentricity7: $eccentricity7, ')
          ..write('eccentricity8: $eccentricity8, ')
          ..write('eccentricity9: $eccentricity9, ')
          ..write('eccentricity10: $eccentricity10, ')
          ..write('eccentricityError: $eccentricityError, ')
          ..write('asFoundTest1: $asFoundTest1, ')
          ..write('asFoundRead1: $asFoundRead1, ')
          ..write('asFoundDiff1: $asFoundDiff1, ')
          ..write('asFoundTest2: $asFoundTest2, ')
          ..write('asFoundRead2: $asFoundRead2, ')
          ..write('asFoundDiff2: $asFoundDiff2, ')
          ..write('asFoundTest3: $asFoundTest3, ')
          ..write('asFoundRead3: $asFoundRead3, ')
          ..write('asFoundDiff3: $asFoundDiff3, ')
          ..write('asFoundTest4: $asFoundTest4, ')
          ..write('asFoundRead4: $asFoundRead4, ')
          ..write('asFoundDiff4: $asFoundDiff4, ')
          ..write('asFoundTest5: $asFoundTest5, ')
          ..write('asFoundRead5: $asFoundRead5, ')
          ..write('asFoundDiff5: $asFoundDiff5, ')
          ..write('asFoundTest6: $asFoundTest6, ')
          ..write('asFoundRead6: $asFoundRead6, ')
          ..write('asFoundDiff6: $asFoundDiff6, ')
          ..write('asLeftTest1: $asLeftTest1, ')
          ..write('asLeftRead1: $asLeftRead1, ')
          ..write('asLeftDiff1: $asLeftDiff1, ')
          ..write('asLeftTest2: $asLeftTest2, ')
          ..write('asLeftRead2: $asLeftRead2, ')
          ..write('asLeftDiff2: $asLeftDiff2, ')
          ..write('asLeftTest3: $asLeftTest3, ')
          ..write('asLeftRead3: $asLeftRead3, ')
          ..write('asLeftDiff3: $asLeftDiff3, ')
          ..write('asLeftTest4: $asLeftTest4, ')
          ..write('asLeftRead4: $asLeftRead4, ')
          ..write('asLeftDiff4: $asLeftDiff4, ')
          ..write('asLeftTest5: $asLeftTest5, ')
          ..write('asLeftRead5: $asLeftRead5, ')
          ..write('asLeftDiff5: $asLeftDiff5, ')
          ..write('asLeftTest6: $asLeftTest6, ')
          ..write('asLeftRead6: $asLeftRead6, ')
          ..write('asLeftDiff6: $asLeftDiff6, ')
          ..write('notes: $notes, ')
          ..write('weightTestUnit: $weightTestUnit, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, AppUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uidNumberMeta =
      const VerificationMeta('uidNumber');
  @override
  late final GeneratedColumn<int> uidNumber = GeneratedColumn<int>(
      'uid_number', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _passwordHashMeta =
      const VerificationMeta('passwordHash');
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
      'password_hash', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isAdminMeta =
      const VerificationMeta('isAdmin');
  @override
  late final GeneratedColumn<bool> isAdmin = GeneratedColumn<bool>(
      'is_admin', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_admin" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, uidNumber, uid, email, displayName, passwordHash, isAdmin];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<AppUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uid_number')) {
      context.handle(_uidNumberMeta,
          uidNumber.isAcceptableOrUnknown(data['uid_number']!, _uidNumberMeta));
    }
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    }
    if (data.containsKey('password_hash')) {
      context.handle(
          _passwordHashMeta,
          passwordHash.isAcceptableOrUnknown(
              data['password_hash']!, _passwordHashMeta));
    }
    if (data.containsKey('is_admin')) {
      context.handle(_isAdminMeta,
          isAdmin.isAcceptableOrUnknown(data['is_admin']!, _isAdminMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppUser(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uidNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}uid_number']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name']),
      passwordHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password_hash']),
      isAdmin: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_admin'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class AppUser extends DataClass implements Insertable<AppUser> {
  final int id;
  final int? uidNumber;
  final String uid;
  final String? email;
  final String? displayName;
  final String? passwordHash;
  final bool isAdmin;
  const AppUser(
      {required this.id,
      this.uidNumber,
      required this.uid,
      this.email,
      this.displayName,
      this.passwordHash,
      required this.isAdmin});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || uidNumber != null) {
      map['uid_number'] = Variable<int>(uidNumber);
    }
    map['uid'] = Variable<String>(uid);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || passwordHash != null) {
      map['password_hash'] = Variable<String>(passwordHash);
    }
    map['is_admin'] = Variable<bool>(isAdmin);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      uidNumber: uidNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(uidNumber),
      uid: Value(uid),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      passwordHash: passwordHash == null && nullToAbsent
          ? const Value.absent()
          : Value(passwordHash),
      isAdmin: Value(isAdmin),
    );
  }

  factory AppUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppUser(
      id: serializer.fromJson<int>(json['id']),
      uidNumber: serializer.fromJson<int?>(json['uidNumber']),
      uid: serializer.fromJson<String>(json['uid']),
      email: serializer.fromJson<String?>(json['email']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      passwordHash: serializer.fromJson<String?>(json['passwordHash']),
      isAdmin: serializer.fromJson<bool>(json['isAdmin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uidNumber': serializer.toJson<int?>(uidNumber),
      'uid': serializer.toJson<String>(uid),
      'email': serializer.toJson<String?>(email),
      'displayName': serializer.toJson<String?>(displayName),
      'passwordHash': serializer.toJson<String?>(passwordHash),
      'isAdmin': serializer.toJson<bool>(isAdmin),
    };
  }

  AppUser copyWith(
          {int? id,
          Value<int?> uidNumber = const Value.absent(),
          String? uid,
          Value<String?> email = const Value.absent(),
          Value<String?> displayName = const Value.absent(),
          Value<String?> passwordHash = const Value.absent(),
          bool? isAdmin}) =>
      AppUser(
        id: id ?? this.id,
        uidNumber: uidNumber.present ? uidNumber.value : this.uidNumber,
        uid: uid ?? this.uid,
        email: email.present ? email.value : this.email,
        displayName: displayName.present ? displayName.value : this.displayName,
        passwordHash:
            passwordHash.present ? passwordHash.value : this.passwordHash,
        isAdmin: isAdmin ?? this.isAdmin,
      );
  AppUser copyWithCompanion(UsersCompanion data) {
    return AppUser(
      id: data.id.present ? data.id.value : this.id,
      uidNumber: data.uidNumber.present ? data.uidNumber.value : this.uidNumber,
      uid: data.uid.present ? data.uid.value : this.uid,
      email: data.email.present ? data.email.value : this.email,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      isAdmin: data.isAdmin.present ? data.isAdmin.value : this.isAdmin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppUser(')
          ..write('id: $id, ')
          ..write('uidNumber: $uidNumber, ')
          ..write('uid: $uid, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('isAdmin: $isAdmin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, uidNumber, uid, email, displayName, passwordHash, isAdmin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppUser &&
          other.id == this.id &&
          other.uidNumber == this.uidNumber &&
          other.uid == this.uid &&
          other.email == this.email &&
          other.displayName == this.displayName &&
          other.passwordHash == this.passwordHash &&
          other.isAdmin == this.isAdmin);
}

class UsersCompanion extends UpdateCompanion<AppUser> {
  final Value<int> id;
  final Value<int?> uidNumber;
  final Value<String> uid;
  final Value<String?> email;
  final Value<String?> displayName;
  final Value<String?> passwordHash;
  final Value<bool> isAdmin;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.uidNumber = const Value.absent(),
    this.uid = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.isAdmin = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.uidNumber = const Value.absent(),
    required String uid,
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.isAdmin = const Value.absent(),
  }) : uid = Value(uid);
  static Insertable<AppUser> custom({
    Expression<int>? id,
    Expression<int>? uidNumber,
    Expression<String>? uid,
    Expression<String>? email,
    Expression<String>? displayName,
    Expression<String>? passwordHash,
    Expression<bool>? isAdmin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uidNumber != null) 'uid_number': uidNumber,
      if (uid != null) 'uid': uid,
      if (email != null) 'email': email,
      if (displayName != null) 'display_name': displayName,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (isAdmin != null) 'is_admin': isAdmin,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<int?>? uidNumber,
      Value<String>? uid,
      Value<String?>? email,
      Value<String?>? displayName,
      Value<String?>? passwordHash,
      Value<bool>? isAdmin}) {
    return UsersCompanion(
      id: id ?? this.id,
      uidNumber: uidNumber ?? this.uidNumber,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      passwordHash: passwordHash ?? this.passwordHash,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uidNumber.present) {
      map['uid_number'] = Variable<int>(uidNumber.value);
    }
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (isAdmin.present) {
      map['is_admin'] = Variable<bool>(isAdmin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('uidNumber: $uidNumber, ')
          ..write('uid: $uid, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('isAdmin: $isAdmin')
          ..write(')'))
        .toString();
  }
}

class $InventoryItemsTable extends InventoryItems
    with TableInfo<$InventoryItemsTable, InventoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _partNumberMeta =
      const VerificationMeta('partNumber');
  @override
  late final GeneratedColumn<String> partNumber = GeneratedColumn<String>(
      'part_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _makeMeta = const VerificationMeta('make');
  @override
  late final GeneratedColumn<String> make = GeneratedColumn<String>(
      'make', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
      'model', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<String> serial = GeneratedColumn<String>(
      'serial', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _capacityMeta =
      const VerificationMeta('capacity');
  @override
  late final GeneratedColumn<String> capacity = GeneratedColumn<String>(
      'capacity', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isSoldMeta = const VerificationMeta('isSold');
  @override
  late final GeneratedColumn<bool> isSold = GeneratedColumn<bool>(
      'is_sold', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_sold" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES customers (id)'));
  static const VerificationMeta _workOrderIdMeta =
      const VerificationMeta('workOrderId');
  @override
  late final GeneratedColumn<int> workOrderId = GeneratedColumn<int>(
      'work_order_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES work_orders (id)'));
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastModifiedMeta =
      const VerificationMeta('lastModified');
  @override
  late final GeneratedColumn<DateTime> lastModified = GeneratedColumn<DateTime>(
      'last_modified', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
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
        partNumber,
        description,
        type,
        make,
        model,
        serial,
        capacity,
        quantity,
        price,
        location,
        barcode,
        isSold,
        customerId,
        workOrderId,
        uid,
        lastModified,
        synced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_items';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('part_number')) {
      context.handle(
          _partNumberMeta,
          partNumber.isAcceptableOrUnknown(
              data['part_number']!, _partNumberMeta));
    } else if (isInserting) {
      context.missing(_partNumberMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('make')) {
      context.handle(
          _makeMeta, make.isAcceptableOrUnknown(data['make']!, _makeMeta));
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    }
    if (data.containsKey('serial')) {
      context.handle(_serialMeta,
          serial.isAcceptableOrUnknown(data['serial']!, _serialMeta));
    }
    if (data.containsKey('capacity')) {
      context.handle(_capacityMeta,
          capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('is_sold')) {
      context.handle(_isSoldMeta,
          isSold.isAcceptableOrUnknown(data['is_sold']!, _isSoldMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    }
    if (data.containsKey('work_order_id')) {
      context.handle(
          _workOrderIdMeta,
          workOrderId.isAcceptableOrUnknown(
              data['work_order_id']!, _workOrderIdMeta));
    }
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    }
    if (data.containsKey('last_modified')) {
      context.handle(
          _lastModifiedMeta,
          lastModified.isAcceptableOrUnknown(
              data['last_modified']!, _lastModifiedMeta));
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
  InventoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      partNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}part_number'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      make: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}make']),
      model: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model']),
      serial: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serial']),
      capacity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}capacity']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      isSold: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sold'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id']),
      workOrderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}work_order_id']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      lastModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_modified'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $InventoryItemsTable createAlias(String alias) {
    return $InventoryItemsTable(attachedDatabase, alias);
  }
}

class InventoryItem extends DataClass implements Insertable<InventoryItem> {
  final int id;
  final String partNumber;
  final String description;
  final String? type;
  final String? make;
  final String? model;
  final String? serial;
  final String? capacity;
  final int quantity;
  final double? price;
  final String? location;
  final String? barcode;
  final bool isSold;
  final int? customerId;
  final int? workOrderId;
  final String? uid;
  final DateTime lastModified;
  final bool synced;
  const InventoryItem(
      {required this.id,
      required this.partNumber,
      required this.description,
      this.type,
      this.make,
      this.model,
      this.serial,
      this.capacity,
      required this.quantity,
      this.price,
      this.location,
      this.barcode,
      required this.isSold,
      this.customerId,
      this.workOrderId,
      this.uid,
      required this.lastModified,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['part_number'] = Variable<String>(partNumber);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || make != null) {
      map['make'] = Variable<String>(make);
    }
    if (!nullToAbsent || model != null) {
      map['model'] = Variable<String>(model);
    }
    if (!nullToAbsent || serial != null) {
      map['serial'] = Variable<String>(serial);
    }
    if (!nullToAbsent || capacity != null) {
      map['capacity'] = Variable<String>(capacity);
    }
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['is_sold'] = Variable<bool>(isSold);
    if (!nullToAbsent || customerId != null) {
      map['customer_id'] = Variable<int>(customerId);
    }
    if (!nullToAbsent || workOrderId != null) {
      map['work_order_id'] = Variable<int>(workOrderId);
    }
    if (!nullToAbsent || uid != null) {
      map['uid'] = Variable<String>(uid);
    }
    map['last_modified'] = Variable<DateTime>(lastModified);
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  InventoryItemsCompanion toCompanion(bool nullToAbsent) {
    return InventoryItemsCompanion(
      id: Value(id),
      partNumber: Value(partNumber),
      description: Value(description),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      make: make == null && nullToAbsent ? const Value.absent() : Value(make),
      model:
          model == null && nullToAbsent ? const Value.absent() : Value(model),
      serial:
          serial == null && nullToAbsent ? const Value.absent() : Value(serial),
      capacity: capacity == null && nullToAbsent
          ? const Value.absent()
          : Value(capacity),
      quantity: Value(quantity),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      isSold: Value(isSold),
      customerId: customerId == null && nullToAbsent
          ? const Value.absent()
          : Value(customerId),
      workOrderId: workOrderId == null && nullToAbsent
          ? const Value.absent()
          : Value(workOrderId),
      uid: uid == null && nullToAbsent ? const Value.absent() : Value(uid),
      lastModified: Value(lastModified),
      synced: Value(synced),
    );
  }

  factory InventoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryItem(
      id: serializer.fromJson<int>(json['id']),
      partNumber: serializer.fromJson<String>(json['partNumber']),
      description: serializer.fromJson<String>(json['description']),
      type: serializer.fromJson<String?>(json['type']),
      make: serializer.fromJson<String?>(json['make']),
      model: serializer.fromJson<String?>(json['model']),
      serial: serializer.fromJson<String?>(json['serial']),
      capacity: serializer.fromJson<String?>(json['capacity']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<double?>(json['price']),
      location: serializer.fromJson<String?>(json['location']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      isSold: serializer.fromJson<bool>(json['isSold']),
      customerId: serializer.fromJson<int?>(json['customerId']),
      workOrderId: serializer.fromJson<int?>(json['workOrderId']),
      uid: serializer.fromJson<String?>(json['uid']),
      lastModified: serializer.fromJson<DateTime>(json['lastModified']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'partNumber': serializer.toJson<String>(partNumber),
      'description': serializer.toJson<String>(description),
      'type': serializer.toJson<String?>(type),
      'make': serializer.toJson<String?>(make),
      'model': serializer.toJson<String?>(model),
      'serial': serializer.toJson<String?>(serial),
      'capacity': serializer.toJson<String?>(capacity),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<double?>(price),
      'location': serializer.toJson<String?>(location),
      'barcode': serializer.toJson<String?>(barcode),
      'isSold': serializer.toJson<bool>(isSold),
      'customerId': serializer.toJson<int?>(customerId),
      'workOrderId': serializer.toJson<int?>(workOrderId),
      'uid': serializer.toJson<String?>(uid),
      'lastModified': serializer.toJson<DateTime>(lastModified),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  InventoryItem copyWith(
          {int? id,
          String? partNumber,
          String? description,
          Value<String?> type = const Value.absent(),
          Value<String?> make = const Value.absent(),
          Value<String?> model = const Value.absent(),
          Value<String?> serial = const Value.absent(),
          Value<String?> capacity = const Value.absent(),
          int? quantity,
          Value<double?> price = const Value.absent(),
          Value<String?> location = const Value.absent(),
          Value<String?> barcode = const Value.absent(),
          bool? isSold,
          Value<int?> customerId = const Value.absent(),
          Value<int?> workOrderId = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          DateTime? lastModified,
          bool? synced}) =>
      InventoryItem(
        id: id ?? this.id,
        partNumber: partNumber ?? this.partNumber,
        description: description ?? this.description,
        type: type.present ? type.value : this.type,
        make: make.present ? make.value : this.make,
        model: model.present ? model.value : this.model,
        serial: serial.present ? serial.value : this.serial,
        capacity: capacity.present ? capacity.value : this.capacity,
        quantity: quantity ?? this.quantity,
        price: price.present ? price.value : this.price,
        location: location.present ? location.value : this.location,
        barcode: barcode.present ? barcode.value : this.barcode,
        isSold: isSold ?? this.isSold,
        customerId: customerId.present ? customerId.value : this.customerId,
        workOrderId: workOrderId.present ? workOrderId.value : this.workOrderId,
        uid: uid.present ? uid.value : this.uid,
        lastModified: lastModified ?? this.lastModified,
        synced: synced ?? this.synced,
      );
  InventoryItem copyWithCompanion(InventoryItemsCompanion data) {
    return InventoryItem(
      id: data.id.present ? data.id.value : this.id,
      partNumber:
          data.partNumber.present ? data.partNumber.value : this.partNumber,
      description:
          data.description.present ? data.description.value : this.description,
      type: data.type.present ? data.type.value : this.type,
      make: data.make.present ? data.make.value : this.make,
      model: data.model.present ? data.model.value : this.model,
      serial: data.serial.present ? data.serial.value : this.serial,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
      location: data.location.present ? data.location.value : this.location,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      isSold: data.isSold.present ? data.isSold.value : this.isSold,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      workOrderId:
          data.workOrderId.present ? data.workOrderId.value : this.workOrderId,
      uid: data.uid.present ? data.uid.value : this.uid,
      lastModified: data.lastModified.present
          ? data.lastModified.value
          : this.lastModified,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItem(')
          ..write('id: $id, ')
          ..write('partNumber: $partNumber, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('serial: $serial, ')
          ..write('capacity: $capacity, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('location: $location, ')
          ..write('barcode: $barcode, ')
          ..write('isSold: $isSold, ')
          ..write('customerId: $customerId, ')
          ..write('workOrderId: $workOrderId, ')
          ..write('uid: $uid, ')
          ..write('lastModified: $lastModified, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      partNumber,
      description,
      type,
      make,
      model,
      serial,
      capacity,
      quantity,
      price,
      location,
      barcode,
      isSold,
      customerId,
      workOrderId,
      uid,
      lastModified,
      synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryItem &&
          other.id == this.id &&
          other.partNumber == this.partNumber &&
          other.description == this.description &&
          other.type == this.type &&
          other.make == this.make &&
          other.model == this.model &&
          other.serial == this.serial &&
          other.capacity == this.capacity &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.location == this.location &&
          other.barcode == this.barcode &&
          other.isSold == this.isSold &&
          other.customerId == this.customerId &&
          other.workOrderId == this.workOrderId &&
          other.uid == this.uid &&
          other.lastModified == this.lastModified &&
          other.synced == this.synced);
}

class InventoryItemsCompanion extends UpdateCompanion<InventoryItem> {
  final Value<int> id;
  final Value<String> partNumber;
  final Value<String> description;
  final Value<String?> type;
  final Value<String?> make;
  final Value<String?> model;
  final Value<String?> serial;
  final Value<String?> capacity;
  final Value<int> quantity;
  final Value<double?> price;
  final Value<String?> location;
  final Value<String?> barcode;
  final Value<bool> isSold;
  final Value<int?> customerId;
  final Value<int?> workOrderId;
  final Value<String?> uid;
  final Value<DateTime> lastModified;
  final Value<bool> synced;
  const InventoryItemsCompanion({
    this.id = const Value.absent(),
    this.partNumber = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.make = const Value.absent(),
    this.model = const Value.absent(),
    this.serial = const Value.absent(),
    this.capacity = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.location = const Value.absent(),
    this.barcode = const Value.absent(),
    this.isSold = const Value.absent(),
    this.customerId = const Value.absent(),
    this.workOrderId = const Value.absent(),
    this.uid = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.synced = const Value.absent(),
  });
  InventoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String partNumber,
    required String description,
    this.type = const Value.absent(),
    this.make = const Value.absent(),
    this.model = const Value.absent(),
    this.serial = const Value.absent(),
    this.capacity = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.location = const Value.absent(),
    this.barcode = const Value.absent(),
    this.isSold = const Value.absent(),
    this.customerId = const Value.absent(),
    this.workOrderId = const Value.absent(),
    this.uid = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.synced = const Value.absent(),
  })  : partNumber = Value(partNumber),
        description = Value(description);
  static Insertable<InventoryItem> custom({
    Expression<int>? id,
    Expression<String>? partNumber,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? make,
    Expression<String>? model,
    Expression<String>? serial,
    Expression<String>? capacity,
    Expression<int>? quantity,
    Expression<double>? price,
    Expression<String>? location,
    Expression<String>? barcode,
    Expression<bool>? isSold,
    Expression<int>? customerId,
    Expression<int>? workOrderId,
    Expression<String>? uid,
    Expression<DateTime>? lastModified,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (partNumber != null) 'part_number': partNumber,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (make != null) 'make': make,
      if (model != null) 'model': model,
      if (serial != null) 'serial': serial,
      if (capacity != null) 'capacity': capacity,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (location != null) 'location': location,
      if (barcode != null) 'barcode': barcode,
      if (isSold != null) 'is_sold': isSold,
      if (customerId != null) 'customer_id': customerId,
      if (workOrderId != null) 'work_order_id': workOrderId,
      if (uid != null) 'uid': uid,
      if (lastModified != null) 'last_modified': lastModified,
      if (synced != null) 'synced': synced,
    });
  }

  InventoryItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? partNumber,
      Value<String>? description,
      Value<String?>? type,
      Value<String?>? make,
      Value<String?>? model,
      Value<String?>? serial,
      Value<String?>? capacity,
      Value<int>? quantity,
      Value<double?>? price,
      Value<String?>? location,
      Value<String?>? barcode,
      Value<bool>? isSold,
      Value<int?>? customerId,
      Value<int?>? workOrderId,
      Value<String?>? uid,
      Value<DateTime>? lastModified,
      Value<bool>? synced}) {
    return InventoryItemsCompanion(
      id: id ?? this.id,
      partNumber: partNumber ?? this.partNumber,
      description: description ?? this.description,
      type: type ?? this.type,
      make: make ?? this.make,
      model: model ?? this.model,
      serial: serial ?? this.serial,
      capacity: capacity ?? this.capacity,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      location: location ?? this.location,
      barcode: barcode ?? this.barcode,
      isSold: isSold ?? this.isSold,
      customerId: customerId ?? this.customerId,
      workOrderId: workOrderId ?? this.workOrderId,
      uid: uid ?? this.uid,
      lastModified: lastModified ?? this.lastModified,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (partNumber.present) {
      map['part_number'] = Variable<String>(partNumber.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (make.present) {
      map['make'] = Variable<String>(make.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (serial.present) {
      map['serial'] = Variable<String>(serial.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<String>(capacity.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (isSold.present) {
      map['is_sold'] = Variable<bool>(isSold.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (workOrderId.present) {
      map['work_order_id'] = Variable<int>(workOrderId.value);
    }
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<DateTime>(lastModified.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('partNumber: $partNumber, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('serial: $serial, ')
          ..write('capacity: $capacity, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('location: $location, ')
          ..write('barcode: $barcode, ')
          ..write('isSold: $isSold, ')
          ..write('customerId: $customerId, ')
          ..write('workOrderId: $workOrderId, ')
          ..write('uid: $uid, ')
          ..write('lastModified: $lastModified, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $InventoryTransactionsTable extends InventoryTransactions
    with TableInfo<$InventoryTransactionsTable, InventoryTransaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryTransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _inventoryItemIdMeta =
      const VerificationMeta('inventoryItemId');
  @override
  late final GeneratedColumn<int> inventoryItemId = GeneratedColumn<int>(
      'inventory_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES inventory_items (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('sold'));
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES customers (id)'));
  static const VerificationMeta _workOrderIdMeta =
      const VerificationMeta('workOrderId');
  @override
  late final GeneratedColumn<int> workOrderId = GeneratedColumn<int>(
      'work_order_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES work_orders (id)'));
  static const VerificationMeta _sourceLocationMeta =
      const VerificationMeta('sourceLocation');
  @override
  late final GeneratedColumn<String> sourceLocation = GeneratedColumn<String>(
      'source_location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _targetLocationMeta =
      const VerificationMeta('targetLocation');
  @override
  late final GeneratedColumn<String> targetLocation = GeneratedColumn<String>(
      'target_location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
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
        inventoryItemId,
        quantity,
        type,
        customerId,
        workOrderId,
        sourceLocation,
        targetLocation,
        userId,
        note,
        timestamp,
        synced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_transactions';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryTransaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('inventory_item_id')) {
      context.handle(
          _inventoryItemIdMeta,
          inventoryItemId.isAcceptableOrUnknown(
              data['inventory_item_id']!, _inventoryItemIdMeta));
    } else if (isInserting) {
      context.missing(_inventoryItemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    }
    if (data.containsKey('work_order_id')) {
      context.handle(
          _workOrderIdMeta,
          workOrderId.isAcceptableOrUnknown(
              data['work_order_id']!, _workOrderIdMeta));
    }
    if (data.containsKey('source_location')) {
      context.handle(
          _sourceLocationMeta,
          sourceLocation.isAcceptableOrUnknown(
              data['source_location']!, _sourceLocationMeta));
    }
    if (data.containsKey('target_location')) {
      context.handle(
          _targetLocationMeta,
          targetLocation.isAcceptableOrUnknown(
              data['target_location']!, _targetLocationMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
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
  InventoryTransaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryTransaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      inventoryItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}inventory_item_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id']),
      workOrderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}work_order_id']),
      sourceLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_location']),
      targetLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target_location']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $InventoryTransactionsTable createAlias(String alias) {
    return $InventoryTransactionsTable(attachedDatabase, alias);
  }
}

class InventoryTransaction extends DataClass
    implements Insertable<InventoryTransaction> {
  final int id;
  final int inventoryItemId;
  final int quantity;
  final String type;
  final int? customerId;
  final int? workOrderId;
  final String? sourceLocation;
  final String? targetLocation;
  final int userId;
  final String? note;
  final DateTime timestamp;
  final bool synced;
  const InventoryTransaction(
      {required this.id,
      required this.inventoryItemId,
      required this.quantity,
      required this.type,
      this.customerId,
      this.workOrderId,
      this.sourceLocation,
      this.targetLocation,
      required this.userId,
      this.note,
      required this.timestamp,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['inventory_item_id'] = Variable<int>(inventoryItemId);
    map['quantity'] = Variable<int>(quantity);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || customerId != null) {
      map['customer_id'] = Variable<int>(customerId);
    }
    if (!nullToAbsent || workOrderId != null) {
      map['work_order_id'] = Variable<int>(workOrderId);
    }
    if (!nullToAbsent || sourceLocation != null) {
      map['source_location'] = Variable<String>(sourceLocation);
    }
    if (!nullToAbsent || targetLocation != null) {
      map['target_location'] = Variable<String>(targetLocation);
    }
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  InventoryTransactionsCompanion toCompanion(bool nullToAbsent) {
    return InventoryTransactionsCompanion(
      id: Value(id),
      inventoryItemId: Value(inventoryItemId),
      quantity: Value(quantity),
      type: Value(type),
      customerId: customerId == null && nullToAbsent
          ? const Value.absent()
          : Value(customerId),
      workOrderId: workOrderId == null && nullToAbsent
          ? const Value.absent()
          : Value(workOrderId),
      sourceLocation: sourceLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceLocation),
      targetLocation: targetLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(targetLocation),
      userId: Value(userId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      timestamp: Value(timestamp),
      synced: Value(synced),
    );
  }

  factory InventoryTransaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryTransaction(
      id: serializer.fromJson<int>(json['id']),
      inventoryItemId: serializer.fromJson<int>(json['inventoryItemId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      type: serializer.fromJson<String>(json['type']),
      customerId: serializer.fromJson<int?>(json['customerId']),
      workOrderId: serializer.fromJson<int?>(json['workOrderId']),
      sourceLocation: serializer.fromJson<String?>(json['sourceLocation']),
      targetLocation: serializer.fromJson<String?>(json['targetLocation']),
      userId: serializer.fromJson<int>(json['userId']),
      note: serializer.fromJson<String?>(json['note']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'inventoryItemId': serializer.toJson<int>(inventoryItemId),
      'quantity': serializer.toJson<int>(quantity),
      'type': serializer.toJson<String>(type),
      'customerId': serializer.toJson<int?>(customerId),
      'workOrderId': serializer.toJson<int?>(workOrderId),
      'sourceLocation': serializer.toJson<String?>(sourceLocation),
      'targetLocation': serializer.toJson<String?>(targetLocation),
      'userId': serializer.toJson<int>(userId),
      'note': serializer.toJson<String?>(note),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  InventoryTransaction copyWith(
          {int? id,
          int? inventoryItemId,
          int? quantity,
          String? type,
          Value<int?> customerId = const Value.absent(),
          Value<int?> workOrderId = const Value.absent(),
          Value<String?> sourceLocation = const Value.absent(),
          Value<String?> targetLocation = const Value.absent(),
          int? userId,
          Value<String?> note = const Value.absent(),
          DateTime? timestamp,
          bool? synced}) =>
      InventoryTransaction(
        id: id ?? this.id,
        inventoryItemId: inventoryItemId ?? this.inventoryItemId,
        quantity: quantity ?? this.quantity,
        type: type ?? this.type,
        customerId: customerId.present ? customerId.value : this.customerId,
        workOrderId: workOrderId.present ? workOrderId.value : this.workOrderId,
        sourceLocation:
            sourceLocation.present ? sourceLocation.value : this.sourceLocation,
        targetLocation:
            targetLocation.present ? targetLocation.value : this.targetLocation,
        userId: userId ?? this.userId,
        note: note.present ? note.value : this.note,
        timestamp: timestamp ?? this.timestamp,
        synced: synced ?? this.synced,
      );
  InventoryTransaction copyWithCompanion(InventoryTransactionsCompanion data) {
    return InventoryTransaction(
      id: data.id.present ? data.id.value : this.id,
      inventoryItemId: data.inventoryItemId.present
          ? data.inventoryItemId.value
          : this.inventoryItemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      type: data.type.present ? data.type.value : this.type,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      workOrderId:
          data.workOrderId.present ? data.workOrderId.value : this.workOrderId,
      sourceLocation: data.sourceLocation.present
          ? data.sourceLocation.value
          : this.sourceLocation,
      targetLocation: data.targetLocation.present
          ? data.targetLocation.value
          : this.targetLocation,
      userId: data.userId.present ? data.userId.value : this.userId,
      note: data.note.present ? data.note.value : this.note,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryTransaction(')
          ..write('id: $id, ')
          ..write('inventoryItemId: $inventoryItemId, ')
          ..write('quantity: $quantity, ')
          ..write('type: $type, ')
          ..write('customerId: $customerId, ')
          ..write('workOrderId: $workOrderId, ')
          ..write('sourceLocation: $sourceLocation, ')
          ..write('targetLocation: $targetLocation, ')
          ..write('userId: $userId, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      inventoryItemId,
      quantity,
      type,
      customerId,
      workOrderId,
      sourceLocation,
      targetLocation,
      userId,
      note,
      timestamp,
      synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryTransaction &&
          other.id == this.id &&
          other.inventoryItemId == this.inventoryItemId &&
          other.quantity == this.quantity &&
          other.type == this.type &&
          other.customerId == this.customerId &&
          other.workOrderId == this.workOrderId &&
          other.sourceLocation == this.sourceLocation &&
          other.targetLocation == this.targetLocation &&
          other.userId == this.userId &&
          other.note == this.note &&
          other.timestamp == this.timestamp &&
          other.synced == this.synced);
}

class InventoryTransactionsCompanion
    extends UpdateCompanion<InventoryTransaction> {
  final Value<int> id;
  final Value<int> inventoryItemId;
  final Value<int> quantity;
  final Value<String> type;
  final Value<int?> customerId;
  final Value<int?> workOrderId;
  final Value<String?> sourceLocation;
  final Value<String?> targetLocation;
  final Value<int> userId;
  final Value<String?> note;
  final Value<DateTime> timestamp;
  final Value<bool> synced;
  const InventoryTransactionsCompanion({
    this.id = const Value.absent(),
    this.inventoryItemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.type = const Value.absent(),
    this.customerId = const Value.absent(),
    this.workOrderId = const Value.absent(),
    this.sourceLocation = const Value.absent(),
    this.targetLocation = const Value.absent(),
    this.userId = const Value.absent(),
    this.note = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.synced = const Value.absent(),
  });
  InventoryTransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int inventoryItemId,
    this.quantity = const Value.absent(),
    this.type = const Value.absent(),
    this.customerId = const Value.absent(),
    this.workOrderId = const Value.absent(),
    this.sourceLocation = const Value.absent(),
    this.targetLocation = const Value.absent(),
    required int userId,
    this.note = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.synced = const Value.absent(),
  })  : inventoryItemId = Value(inventoryItemId),
        userId = Value(userId);
  static Insertable<InventoryTransaction> custom({
    Expression<int>? id,
    Expression<int>? inventoryItemId,
    Expression<int>? quantity,
    Expression<String>? type,
    Expression<int>? customerId,
    Expression<int>? workOrderId,
    Expression<String>? sourceLocation,
    Expression<String>? targetLocation,
    Expression<int>? userId,
    Expression<String>? note,
    Expression<DateTime>? timestamp,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (inventoryItemId != null) 'inventory_item_id': inventoryItemId,
      if (quantity != null) 'quantity': quantity,
      if (type != null) 'type': type,
      if (customerId != null) 'customer_id': customerId,
      if (workOrderId != null) 'work_order_id': workOrderId,
      if (sourceLocation != null) 'source_location': sourceLocation,
      if (targetLocation != null) 'target_location': targetLocation,
      if (userId != null) 'user_id': userId,
      if (note != null) 'note': note,
      if (timestamp != null) 'timestamp': timestamp,
      if (synced != null) 'synced': synced,
    });
  }

  InventoryTransactionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? inventoryItemId,
      Value<int>? quantity,
      Value<String>? type,
      Value<int?>? customerId,
      Value<int?>? workOrderId,
      Value<String?>? sourceLocation,
      Value<String?>? targetLocation,
      Value<int>? userId,
      Value<String?>? note,
      Value<DateTime>? timestamp,
      Value<bool>? synced}) {
    return InventoryTransactionsCompanion(
      id: id ?? this.id,
      inventoryItemId: inventoryItemId ?? this.inventoryItemId,
      quantity: quantity ?? this.quantity,
      type: type ?? this.type,
      customerId: customerId ?? this.customerId,
      workOrderId: workOrderId ?? this.workOrderId,
      sourceLocation: sourceLocation ?? this.sourceLocation,
      targetLocation: targetLocation ?? this.targetLocation,
      userId: userId ?? this.userId,
      note: note ?? this.note,
      timestamp: timestamp ?? this.timestamp,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (inventoryItemId.present) {
      map['inventory_item_id'] = Variable<int>(inventoryItemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (workOrderId.present) {
      map['work_order_id'] = Variable<int>(workOrderId.value);
    }
    if (sourceLocation.present) {
      map['source_location'] = Variable<String>(sourceLocation.value);
    }
    if (targetLocation.present) {
      map['target_location'] = Variable<String>(targetLocation.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryTransactionsCompanion(')
          ..write('id: $id, ')
          ..write('inventoryItemId: $inventoryItemId, ')
          ..write('quantity: $quantity, ')
          ..write('type: $type, ')
          ..write('customerId: $customerId, ')
          ..write('workOrderId: $workOrderId, ')
          ..write('sourceLocation: $sourceLocation, ')
          ..write('targetLocation: $targetLocation, ')
          ..write('userId: $userId, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp, ')
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
  late final $WeightTestsTable weightTests = $WeightTestsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $InventoryItemsTable inventoryItems = $InventoryItemsTable(this);
  late final $InventoryTransactionsTable inventoryTransactions =
      $InventoryTransactionsTable(this);
  late final CustomerDao customerDao = CustomerDao(this as AppDatabase);
  late final ContactDao contactDao = ContactDao(this as AppDatabase);
  late final WorkOrderDao workOrderDao = WorkOrderDao(this as AppDatabase);
  late final ScaleDao scaleDao = ScaleDao(this as AppDatabase);
  late final ServiceReportDao serviceReportDao =
      ServiceReportDao(this as AppDatabase);
  late final WeightTestDao weightTestDao = WeightTestDao(this as AppDatabase);
  late final WorkOrderWithCustomerDao workOrderWithCustomerDao =
      WorkOrderWithCustomerDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final InventoryDao inventoryDao = InventoryDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        customers,
        contacts,
        workOrders,
        scales,
        serviceReports,
        weightTests,
        users,
        inventoryItems,
        inventoryTransactions
      ];
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

  static MultiTypedResultKey<$InventoryItemsTable, List<InventoryItem>>
      _inventoryItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.inventoryItems,
              aliasName: $_aliasNameGenerator(
                  db.customers.id, db.inventoryItems.customerId));

  $$InventoryItemsTableProcessedTableManager get inventoryItemsRefs {
    final manager = $$InventoryItemsTableTableManager($_db, $_db.inventoryItems)
        .filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_inventoryItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$InventoryTransactionsTable,
      List<InventoryTransaction>> _inventoryTransactionsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.inventoryTransactions,
          aliasName: $_aliasNameGenerator(
              db.customers.id, db.inventoryTransactions.customerId));

  $$InventoryTransactionsTableProcessedTableManager
      get inventoryTransactionsRefs {
    final manager = $$InventoryTransactionsTableTableManager(
            $_db, $_db.inventoryTransactions)
        .filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_inventoryTransactionsRefsTable($_db));
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

  Expression<bool> inventoryItemsRefs(
      Expression<bool> Function($$InventoryItemsTableFilterComposer f) f) {
    final $$InventoryItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.inventoryItems,
        getReferencedColumn: (t) => t.customerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryItemsTableFilterComposer(
              $db: $db,
              $table: $db.inventoryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> inventoryTransactionsRefs(
      Expression<bool> Function($$InventoryTransactionsTableFilterComposer f)
          f) {
    final $$InventoryTransactionsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactions,
            getReferencedColumn: (t) => t.customerId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableFilterComposer(
                  $db: $db,
                  $table: $db.inventoryTransactions,
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

  Expression<T> inventoryItemsRefs<T extends Object>(
      Expression<T> Function($$InventoryItemsTableAnnotationComposer a) f) {
    final $$InventoryItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.inventoryItems,
        getReferencedColumn: (t) => t.customerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.inventoryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> inventoryTransactionsRefs<T extends Object>(
      Expression<T> Function($$InventoryTransactionsTableAnnotationComposer a)
          f) {
    final $$InventoryTransactionsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactions,
            getReferencedColumn: (t) => t.customerId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryTransactions,
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
    PrefetchHooks Function(
        {bool contactsRefs,
        bool scalesRefs,
        bool inventoryItemsRefs,
        bool inventoryTransactionsRefs})> {
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
          prefetchHooksCallback: (
              {contactsRefs = false,
              scalesRefs = false,
              inventoryItemsRefs = false,
              inventoryTransactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (contactsRefs) db.contacts,
                if (scalesRefs) db.scales,
                if (inventoryItemsRefs) db.inventoryItems,
                if (inventoryTransactionsRefs) db.inventoryTransactions
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
                        typedResults: items),
                  if (inventoryItemsRefs)
                    await $_getPrefetchedData<Customer, $CustomersTable,
                            InventoryItem>(
                        currentTable: table,
                        referencedTable: $$CustomersTableReferences
                            ._inventoryItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CustomersTableReferences(db, table, p0)
                                .inventoryItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.customerId == item.id),
                        typedResults: items),
                  if (inventoryTransactionsRefs)
                    await $_getPrefetchedData<Customer, $CustomersTable,
                            InventoryTransaction>(
                        currentTable: table,
                        referencedTable: $$CustomersTableReferences
                            ._inventoryTransactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CustomersTableReferences(db, table, p0)
                                .inventoryTransactionsRefs,
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
    PrefetchHooks Function(
        {bool contactsRefs,
        bool scalesRefs,
        bool inventoryItemsRefs,
        bool inventoryTransactionsRefs})>;
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

  static MultiTypedResultKey<$InventoryItemsTable, List<InventoryItem>>
      _inventoryItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.inventoryItems,
              aliasName: $_aliasNameGenerator(
                  db.workOrders.id, db.inventoryItems.workOrderId));

  $$InventoryItemsTableProcessedTableManager get inventoryItemsRefs {
    final manager = $$InventoryItemsTableTableManager($_db, $_db.inventoryItems)
        .filter((f) => f.workOrderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_inventoryItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$InventoryTransactionsTable,
      List<InventoryTransaction>> _inventoryTransactionsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.inventoryTransactions,
          aliasName: $_aliasNameGenerator(
              db.workOrders.id, db.inventoryTransactions.workOrderId));

  $$InventoryTransactionsTableProcessedTableManager
      get inventoryTransactionsRefs {
    final manager = $$InventoryTransactionsTableTableManager(
            $_db, $_db.inventoryTransactions)
        .filter((f) => f.workOrderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_inventoryTransactionsRefsTable($_db));
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

  Expression<bool> inventoryItemsRefs(
      Expression<bool> Function($$InventoryItemsTableFilterComposer f) f) {
    final $$InventoryItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.inventoryItems,
        getReferencedColumn: (t) => t.workOrderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryItemsTableFilterComposer(
              $db: $db,
              $table: $db.inventoryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> inventoryTransactionsRefs(
      Expression<bool> Function($$InventoryTransactionsTableFilterComposer f)
          f) {
    final $$InventoryTransactionsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactions,
            getReferencedColumn: (t) => t.workOrderId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableFilterComposer(
                  $db: $db,
                  $table: $db.inventoryTransactions,
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

  Expression<T> inventoryItemsRefs<T extends Object>(
      Expression<T> Function($$InventoryItemsTableAnnotationComposer a) f) {
    final $$InventoryItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.inventoryItems,
        getReferencedColumn: (t) => t.workOrderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.inventoryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> inventoryTransactionsRefs<T extends Object>(
      Expression<T> Function($$InventoryTransactionsTableAnnotationComposer a)
          f) {
    final $$InventoryTransactionsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactions,
            getReferencedColumn: (t) => t.workOrderId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryTransactions,
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
    PrefetchHooks Function(
        {bool serviceReportsRefs,
        bool inventoryItemsRefs,
        bool inventoryTransactionsRefs})> {
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
          prefetchHooksCallback: (
              {serviceReportsRefs = false,
              inventoryItemsRefs = false,
              inventoryTransactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (serviceReportsRefs) db.serviceReports,
                if (inventoryItemsRefs) db.inventoryItems,
                if (inventoryTransactionsRefs) db.inventoryTransactions
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
                        typedResults: items),
                  if (inventoryItemsRefs)
                    await $_getPrefetchedData<WorkOrder, $WorkOrdersTable,
                            InventoryItem>(
                        currentTable: table,
                        referencedTable: $$WorkOrdersTableReferences
                            ._inventoryItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkOrdersTableReferences(db, table, p0)
                                .inventoryItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workOrderId == item.id),
                        typedResults: items),
                  if (inventoryTransactionsRefs)
                    await $_getPrefetchedData<WorkOrder, $WorkOrdersTable, InventoryTransaction>(
                        currentTable: table,
                        referencedTable: $$WorkOrdersTableReferences
                            ._inventoryTransactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkOrdersTableReferences(db, table, p0)
                                .inventoryTransactionsRefs,
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
    PrefetchHooks Function(
        {bool serviceReportsRefs,
        bool inventoryItemsRefs,
        bool inventoryTransactionsRefs})>;
typedef $$ScalesTableCreateCompanionBuilder = ScalesCompanion Function({
  Value<int> id,
  required int customerId,
  required bool configuration,
  required String scaleType,
  required String scaleSubtype,
  Value<String?> customTypeDescription,
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
  Value<bool> legalForTrade,
  Value<DateTime?> inspectionExpiry,
  Value<String?> sealStatus,
  Value<String?> inspectionResult,
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
  Value<String> scaleSubtype,
  Value<String?> customTypeDescription,
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
  Value<bool> legalForTrade,
  Value<DateTime?> inspectionExpiry,
  Value<String?> sealStatus,
  Value<String?> inspectionResult,
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

  ColumnFilters<String> get scaleSubtype => $composableBuilder(
      column: $table.scaleSubtype, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customTypeDescription => $composableBuilder(
      column: $table.customTypeDescription,
      builder: (column) => ColumnFilters(column));

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

  ColumnFilters<bool> get legalForTrade => $composableBuilder(
      column: $table.legalForTrade, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get inspectionExpiry => $composableBuilder(
      column: $table.inspectionExpiry,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sealStatus => $composableBuilder(
      column: $table.sealStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get inspectionResult => $composableBuilder(
      column: $table.inspectionResult,
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

  ColumnOrderings<String> get scaleSubtype => $composableBuilder(
      column: $table.scaleSubtype,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customTypeDescription => $composableBuilder(
      column: $table.customTypeDescription,
      builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<bool> get legalForTrade => $composableBuilder(
      column: $table.legalForTrade,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get inspectionExpiry => $composableBuilder(
      column: $table.inspectionExpiry,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sealStatus => $composableBuilder(
      column: $table.sealStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get inspectionResult => $composableBuilder(
      column: $table.inspectionResult,
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

  GeneratedColumn<String> get scaleSubtype => $composableBuilder(
      column: $table.scaleSubtype, builder: (column) => column);

  GeneratedColumn<String> get customTypeDescription => $composableBuilder(
      column: $table.customTypeDescription, builder: (column) => column);

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

  GeneratedColumn<bool> get legalForTrade => $composableBuilder(
      column: $table.legalForTrade, builder: (column) => column);

  GeneratedColumn<DateTime> get inspectionExpiry => $composableBuilder(
      column: $table.inspectionExpiry, builder: (column) => column);

  GeneratedColumn<String> get sealStatus => $composableBuilder(
      column: $table.sealStatus, builder: (column) => column);

  GeneratedColumn<String> get inspectionResult => $composableBuilder(
      column: $table.inspectionResult, builder: (column) => column);

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
            Value<String> scaleSubtype = const Value.absent(),
            Value<String?> customTypeDescription = const Value.absent(),
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
            Value<bool> legalForTrade = const Value.absent(),
            Value<DateTime?> inspectionExpiry = const Value.absent(),
            Value<String?> sealStatus = const Value.absent(),
            Value<String?> inspectionResult = const Value.absent(),
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
            scaleSubtype: scaleSubtype,
            customTypeDescription: customTypeDescription,
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
            legalForTrade: legalForTrade,
            inspectionExpiry: inspectionExpiry,
            sealStatus: sealStatus,
            inspectionResult: inspectionResult,
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
            required String scaleSubtype,
            Value<String?> customTypeDescription = const Value.absent(),
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
            Value<bool> legalForTrade = const Value.absent(),
            Value<DateTime?> inspectionExpiry = const Value.absent(),
            Value<String?> sealStatus = const Value.absent(),
            Value<String?> inspectionResult = const Value.absent(),
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
            scaleSubtype: scaleSubtype,
            customTypeDescription: customTypeDescription,
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
            legalForTrade: legalForTrade,
            inspectionExpiry: inspectionExpiry,
            sealStatus: sealStatus,
            inspectionResult: inspectionResult,
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

  static MultiTypedResultKey<$WeightTestsTable, List<WeightTest>>
      _weightTestsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.weightTests,
              aliasName: $_aliasNameGenerator(
                  db.serviceReports.id, db.weightTests.serviceReportId));

  $$WeightTestsTableProcessedTableManager get weightTestsRefs {
    final manager = $$WeightTestsTableTableManager($_db, $_db.weightTests)
        .filter(
            (f) => f.serviceReportId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_weightTestsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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

  Expression<bool> weightTestsRefs(
      Expression<bool> Function($$WeightTestsTableFilterComposer f) f) {
    final $$WeightTestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.weightTests,
        getReferencedColumn: (t) => t.serviceReportId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WeightTestsTableFilterComposer(
              $db: $db,
              $table: $db.weightTests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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

  Expression<T> weightTestsRefs<T extends Object>(
      Expression<T> Function($$WeightTestsTableAnnotationComposer a) f) {
    final $$WeightTestsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.weightTests,
        getReferencedColumn: (t) => t.serviceReportId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WeightTestsTableAnnotationComposer(
              $db: $db,
              $table: $db.weightTests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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
    PrefetchHooks Function(
        {bool workOrderId, bool scaleId, bool weightTestsRefs})> {
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
          prefetchHooksCallback: (
              {workOrderId = false, scaleId = false, weightTestsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (weightTestsRefs) db.weightTests],
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
                return [
                  if (weightTestsRefs)
                    await $_getPrefetchedData<ServiceReport,
                            $ServiceReportsTable, WeightTest>(
                        currentTable: table,
                        referencedTable: $$ServiceReportsTableReferences
                            ._weightTestsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ServiceReportsTableReferences(db, table, p0)
                                .weightTestsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.serviceReportId == item.id),
                        typedResults: items)
                ];
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
    PrefetchHooks Function(
        {bool workOrderId, bool scaleId, bool weightTestsRefs})>;
typedef $$WeightTestsTableCreateCompanionBuilder = WeightTestsCompanion
    Function({
  Value<int> id,
  required int serviceReportId,
  required String eccentricityType,
  Value<int> eccentricityPoints,
  Value<String?> eccentricityDirections,
  Value<double?> eccentricity1,
  Value<double?> eccentricity2,
  Value<double?> eccentricity3,
  Value<double?> eccentricity4,
  Value<double?> eccentricity5,
  Value<double?> eccentricity6,
  Value<double?> eccentricity7,
  Value<double?> eccentricity8,
  Value<double?> eccentricity9,
  Value<double?> eccentricity10,
  Value<String?> eccentricityError,
  Value<double?> asFoundTest1,
  Value<double?> asFoundRead1,
  Value<double?> asFoundDiff1,
  Value<double?> asFoundTest2,
  Value<double?> asFoundRead2,
  Value<double?> asFoundDiff2,
  Value<double?> asFoundTest3,
  Value<double?> asFoundRead3,
  Value<double?> asFoundDiff3,
  Value<double?> asFoundTest4,
  Value<double?> asFoundRead4,
  Value<double?> asFoundDiff4,
  Value<double?> asFoundTest5,
  Value<double?> asFoundRead5,
  Value<double?> asFoundDiff5,
  Value<double?> asFoundTest6,
  Value<double?> asFoundRead6,
  Value<double?> asFoundDiff6,
  Value<double?> asLeftTest1,
  Value<double?> asLeftRead1,
  Value<double?> asLeftDiff1,
  Value<double?> asLeftTest2,
  Value<double?> asLeftRead2,
  Value<double?> asLeftDiff2,
  Value<double?> asLeftTest3,
  Value<double?> asLeftRead3,
  Value<double?> asLeftDiff3,
  Value<double?> asLeftTest4,
  Value<double?> asLeftRead4,
  Value<double?> asLeftDiff4,
  Value<double?> asLeftTest5,
  Value<double?> asLeftRead5,
  Value<double?> asLeftDiff5,
  Value<double?> asLeftTest6,
  Value<double?> asLeftRead6,
  Value<double?> asLeftDiff6,
  Value<String?> notes,
  Value<String?> weightTestUnit,
  Value<DateTime> timestamp,
});
typedef $$WeightTestsTableUpdateCompanionBuilder = WeightTestsCompanion
    Function({
  Value<int> id,
  Value<int> serviceReportId,
  Value<String> eccentricityType,
  Value<int> eccentricityPoints,
  Value<String?> eccentricityDirections,
  Value<double?> eccentricity1,
  Value<double?> eccentricity2,
  Value<double?> eccentricity3,
  Value<double?> eccentricity4,
  Value<double?> eccentricity5,
  Value<double?> eccentricity6,
  Value<double?> eccentricity7,
  Value<double?> eccentricity8,
  Value<double?> eccentricity9,
  Value<double?> eccentricity10,
  Value<String?> eccentricityError,
  Value<double?> asFoundTest1,
  Value<double?> asFoundRead1,
  Value<double?> asFoundDiff1,
  Value<double?> asFoundTest2,
  Value<double?> asFoundRead2,
  Value<double?> asFoundDiff2,
  Value<double?> asFoundTest3,
  Value<double?> asFoundRead3,
  Value<double?> asFoundDiff3,
  Value<double?> asFoundTest4,
  Value<double?> asFoundRead4,
  Value<double?> asFoundDiff4,
  Value<double?> asFoundTest5,
  Value<double?> asFoundRead5,
  Value<double?> asFoundDiff5,
  Value<double?> asFoundTest6,
  Value<double?> asFoundRead6,
  Value<double?> asFoundDiff6,
  Value<double?> asLeftTest1,
  Value<double?> asLeftRead1,
  Value<double?> asLeftDiff1,
  Value<double?> asLeftTest2,
  Value<double?> asLeftRead2,
  Value<double?> asLeftDiff2,
  Value<double?> asLeftTest3,
  Value<double?> asLeftRead3,
  Value<double?> asLeftDiff3,
  Value<double?> asLeftTest4,
  Value<double?> asLeftRead4,
  Value<double?> asLeftDiff4,
  Value<double?> asLeftTest5,
  Value<double?> asLeftRead5,
  Value<double?> asLeftDiff5,
  Value<double?> asLeftTest6,
  Value<double?> asLeftRead6,
  Value<double?> asLeftDiff6,
  Value<String?> notes,
  Value<String?> weightTestUnit,
  Value<DateTime> timestamp,
});

final class $$WeightTestsTableReferences
    extends BaseReferences<_$AppDatabase, $WeightTestsTable, WeightTest> {
  $$WeightTestsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ServiceReportsTable _serviceReportIdTable(_$AppDatabase db) =>
      db.serviceReports.createAlias($_aliasNameGenerator(
          db.weightTests.serviceReportId, db.serviceReports.id));

  $$ServiceReportsTableProcessedTableManager get serviceReportId {
    final $_column = $_itemColumn<int>('service_report_id')!;

    final manager = $$ServiceReportsTableTableManager($_db, $_db.serviceReports)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_serviceReportIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WeightTestsTableFilterComposer
    extends Composer<_$AppDatabase, $WeightTestsTable> {
  $$WeightTestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eccentricityType => $composableBuilder(
      column: $table.eccentricityType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get eccentricityPoints => $composableBuilder(
      column: $table.eccentricityPoints,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eccentricityDirections => $composableBuilder(
      column: $table.eccentricityDirections,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eccentricity1 => $composableBuilder(
      column: $table.eccentricity1, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eccentricity2 => $composableBuilder(
      column: $table.eccentricity2, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eccentricity3 => $composableBuilder(
      column: $table.eccentricity3, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eccentricity4 => $composableBuilder(
      column: $table.eccentricity4, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eccentricity5 => $composableBuilder(
      column: $table.eccentricity5, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eccentricity6 => $composableBuilder(
      column: $table.eccentricity6, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eccentricity7 => $composableBuilder(
      column: $table.eccentricity7, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eccentricity8 => $composableBuilder(
      column: $table.eccentricity8, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eccentricity9 => $composableBuilder(
      column: $table.eccentricity9, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eccentricity10 => $composableBuilder(
      column: $table.eccentricity10,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eccentricityError => $composableBuilder(
      column: $table.eccentricityError,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundTest1 => $composableBuilder(
      column: $table.asFoundTest1, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundRead1 => $composableBuilder(
      column: $table.asFoundRead1, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundDiff1 => $composableBuilder(
      column: $table.asFoundDiff1, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundTest2 => $composableBuilder(
      column: $table.asFoundTest2, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundRead2 => $composableBuilder(
      column: $table.asFoundRead2, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundDiff2 => $composableBuilder(
      column: $table.asFoundDiff2, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundTest3 => $composableBuilder(
      column: $table.asFoundTest3, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundRead3 => $composableBuilder(
      column: $table.asFoundRead3, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundDiff3 => $composableBuilder(
      column: $table.asFoundDiff3, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundTest4 => $composableBuilder(
      column: $table.asFoundTest4, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundRead4 => $composableBuilder(
      column: $table.asFoundRead4, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundDiff4 => $composableBuilder(
      column: $table.asFoundDiff4, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundTest5 => $composableBuilder(
      column: $table.asFoundTest5, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundRead5 => $composableBuilder(
      column: $table.asFoundRead5, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundDiff5 => $composableBuilder(
      column: $table.asFoundDiff5, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundTest6 => $composableBuilder(
      column: $table.asFoundTest6, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundRead6 => $composableBuilder(
      column: $table.asFoundRead6, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asFoundDiff6 => $composableBuilder(
      column: $table.asFoundDiff6, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftTest1 => $composableBuilder(
      column: $table.asLeftTest1, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftRead1 => $composableBuilder(
      column: $table.asLeftRead1, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftDiff1 => $composableBuilder(
      column: $table.asLeftDiff1, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftTest2 => $composableBuilder(
      column: $table.asLeftTest2, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftRead2 => $composableBuilder(
      column: $table.asLeftRead2, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftDiff2 => $composableBuilder(
      column: $table.asLeftDiff2, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftTest3 => $composableBuilder(
      column: $table.asLeftTest3, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftRead3 => $composableBuilder(
      column: $table.asLeftRead3, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftDiff3 => $composableBuilder(
      column: $table.asLeftDiff3, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftTest4 => $composableBuilder(
      column: $table.asLeftTest4, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftRead4 => $composableBuilder(
      column: $table.asLeftRead4, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftDiff4 => $composableBuilder(
      column: $table.asLeftDiff4, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftTest5 => $composableBuilder(
      column: $table.asLeftTest5, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftRead5 => $composableBuilder(
      column: $table.asLeftRead5, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftDiff5 => $composableBuilder(
      column: $table.asLeftDiff5, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftTest6 => $composableBuilder(
      column: $table.asLeftTest6, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftRead6 => $composableBuilder(
      column: $table.asLeftRead6, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asLeftDiff6 => $composableBuilder(
      column: $table.asLeftDiff6, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weightTestUnit => $composableBuilder(
      column: $table.weightTestUnit,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  $$ServiceReportsTableFilterComposer get serviceReportId {
    final $$ServiceReportsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.serviceReportId,
        referencedTable: $db.serviceReports,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$WeightTestsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeightTestsTable> {
  $$WeightTestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eccentricityType => $composableBuilder(
      column: $table.eccentricityType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get eccentricityPoints => $composableBuilder(
      column: $table.eccentricityPoints,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eccentricityDirections => $composableBuilder(
      column: $table.eccentricityDirections,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eccentricity1 => $composableBuilder(
      column: $table.eccentricity1,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eccentricity2 => $composableBuilder(
      column: $table.eccentricity2,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eccentricity3 => $composableBuilder(
      column: $table.eccentricity3,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eccentricity4 => $composableBuilder(
      column: $table.eccentricity4,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eccentricity5 => $composableBuilder(
      column: $table.eccentricity5,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eccentricity6 => $composableBuilder(
      column: $table.eccentricity6,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eccentricity7 => $composableBuilder(
      column: $table.eccentricity7,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eccentricity8 => $composableBuilder(
      column: $table.eccentricity8,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eccentricity9 => $composableBuilder(
      column: $table.eccentricity9,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eccentricity10 => $composableBuilder(
      column: $table.eccentricity10,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eccentricityError => $composableBuilder(
      column: $table.eccentricityError,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundTest1 => $composableBuilder(
      column: $table.asFoundTest1,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundRead1 => $composableBuilder(
      column: $table.asFoundRead1,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundDiff1 => $composableBuilder(
      column: $table.asFoundDiff1,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundTest2 => $composableBuilder(
      column: $table.asFoundTest2,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundRead2 => $composableBuilder(
      column: $table.asFoundRead2,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundDiff2 => $composableBuilder(
      column: $table.asFoundDiff2,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundTest3 => $composableBuilder(
      column: $table.asFoundTest3,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundRead3 => $composableBuilder(
      column: $table.asFoundRead3,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundDiff3 => $composableBuilder(
      column: $table.asFoundDiff3,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundTest4 => $composableBuilder(
      column: $table.asFoundTest4,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundRead4 => $composableBuilder(
      column: $table.asFoundRead4,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundDiff4 => $composableBuilder(
      column: $table.asFoundDiff4,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundTest5 => $composableBuilder(
      column: $table.asFoundTest5,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundRead5 => $composableBuilder(
      column: $table.asFoundRead5,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundDiff5 => $composableBuilder(
      column: $table.asFoundDiff5,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundTest6 => $composableBuilder(
      column: $table.asFoundTest6,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundRead6 => $composableBuilder(
      column: $table.asFoundRead6,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asFoundDiff6 => $composableBuilder(
      column: $table.asFoundDiff6,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftTest1 => $composableBuilder(
      column: $table.asLeftTest1, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftRead1 => $composableBuilder(
      column: $table.asLeftRead1, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftDiff1 => $composableBuilder(
      column: $table.asLeftDiff1, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftTest2 => $composableBuilder(
      column: $table.asLeftTest2, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftRead2 => $composableBuilder(
      column: $table.asLeftRead2, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftDiff2 => $composableBuilder(
      column: $table.asLeftDiff2, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftTest3 => $composableBuilder(
      column: $table.asLeftTest3, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftRead3 => $composableBuilder(
      column: $table.asLeftRead3, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftDiff3 => $composableBuilder(
      column: $table.asLeftDiff3, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftTest4 => $composableBuilder(
      column: $table.asLeftTest4, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftRead4 => $composableBuilder(
      column: $table.asLeftRead4, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftDiff4 => $composableBuilder(
      column: $table.asLeftDiff4, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftTest5 => $composableBuilder(
      column: $table.asLeftTest5, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftRead5 => $composableBuilder(
      column: $table.asLeftRead5, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftDiff5 => $composableBuilder(
      column: $table.asLeftDiff5, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftTest6 => $composableBuilder(
      column: $table.asLeftTest6, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftRead6 => $composableBuilder(
      column: $table.asLeftRead6, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asLeftDiff6 => $composableBuilder(
      column: $table.asLeftDiff6, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weightTestUnit => $composableBuilder(
      column: $table.weightTestUnit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  $$ServiceReportsTableOrderingComposer get serviceReportId {
    final $$ServiceReportsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.serviceReportId,
        referencedTable: $db.serviceReports,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ServiceReportsTableOrderingComposer(
              $db: $db,
              $table: $db.serviceReports,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WeightTestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeightTestsTable> {
  $$WeightTestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get eccentricityType => $composableBuilder(
      column: $table.eccentricityType, builder: (column) => column);

  GeneratedColumn<int> get eccentricityPoints => $composableBuilder(
      column: $table.eccentricityPoints, builder: (column) => column);

  GeneratedColumn<String> get eccentricityDirections => $composableBuilder(
      column: $table.eccentricityDirections, builder: (column) => column);

  GeneratedColumn<double> get eccentricity1 => $composableBuilder(
      column: $table.eccentricity1, builder: (column) => column);

  GeneratedColumn<double> get eccentricity2 => $composableBuilder(
      column: $table.eccentricity2, builder: (column) => column);

  GeneratedColumn<double> get eccentricity3 => $composableBuilder(
      column: $table.eccentricity3, builder: (column) => column);

  GeneratedColumn<double> get eccentricity4 => $composableBuilder(
      column: $table.eccentricity4, builder: (column) => column);

  GeneratedColumn<double> get eccentricity5 => $composableBuilder(
      column: $table.eccentricity5, builder: (column) => column);

  GeneratedColumn<double> get eccentricity6 => $composableBuilder(
      column: $table.eccentricity6, builder: (column) => column);

  GeneratedColumn<double> get eccentricity7 => $composableBuilder(
      column: $table.eccentricity7, builder: (column) => column);

  GeneratedColumn<double> get eccentricity8 => $composableBuilder(
      column: $table.eccentricity8, builder: (column) => column);

  GeneratedColumn<double> get eccentricity9 => $composableBuilder(
      column: $table.eccentricity9, builder: (column) => column);

  GeneratedColumn<double> get eccentricity10 => $composableBuilder(
      column: $table.eccentricity10, builder: (column) => column);

  GeneratedColumn<String> get eccentricityError => $composableBuilder(
      column: $table.eccentricityError, builder: (column) => column);

  GeneratedColumn<double> get asFoundTest1 => $composableBuilder(
      column: $table.asFoundTest1, builder: (column) => column);

  GeneratedColumn<double> get asFoundRead1 => $composableBuilder(
      column: $table.asFoundRead1, builder: (column) => column);

  GeneratedColumn<double> get asFoundDiff1 => $composableBuilder(
      column: $table.asFoundDiff1, builder: (column) => column);

  GeneratedColumn<double> get asFoundTest2 => $composableBuilder(
      column: $table.asFoundTest2, builder: (column) => column);

  GeneratedColumn<double> get asFoundRead2 => $composableBuilder(
      column: $table.asFoundRead2, builder: (column) => column);

  GeneratedColumn<double> get asFoundDiff2 => $composableBuilder(
      column: $table.asFoundDiff2, builder: (column) => column);

  GeneratedColumn<double> get asFoundTest3 => $composableBuilder(
      column: $table.asFoundTest3, builder: (column) => column);

  GeneratedColumn<double> get asFoundRead3 => $composableBuilder(
      column: $table.asFoundRead3, builder: (column) => column);

  GeneratedColumn<double> get asFoundDiff3 => $composableBuilder(
      column: $table.asFoundDiff3, builder: (column) => column);

  GeneratedColumn<double> get asFoundTest4 => $composableBuilder(
      column: $table.asFoundTest4, builder: (column) => column);

  GeneratedColumn<double> get asFoundRead4 => $composableBuilder(
      column: $table.asFoundRead4, builder: (column) => column);

  GeneratedColumn<double> get asFoundDiff4 => $composableBuilder(
      column: $table.asFoundDiff4, builder: (column) => column);

  GeneratedColumn<double> get asFoundTest5 => $composableBuilder(
      column: $table.asFoundTest5, builder: (column) => column);

  GeneratedColumn<double> get asFoundRead5 => $composableBuilder(
      column: $table.asFoundRead5, builder: (column) => column);

  GeneratedColumn<double> get asFoundDiff5 => $composableBuilder(
      column: $table.asFoundDiff5, builder: (column) => column);

  GeneratedColumn<double> get asFoundTest6 => $composableBuilder(
      column: $table.asFoundTest6, builder: (column) => column);

  GeneratedColumn<double> get asFoundRead6 => $composableBuilder(
      column: $table.asFoundRead6, builder: (column) => column);

  GeneratedColumn<double> get asFoundDiff6 => $composableBuilder(
      column: $table.asFoundDiff6, builder: (column) => column);

  GeneratedColumn<double> get asLeftTest1 => $composableBuilder(
      column: $table.asLeftTest1, builder: (column) => column);

  GeneratedColumn<double> get asLeftRead1 => $composableBuilder(
      column: $table.asLeftRead1, builder: (column) => column);

  GeneratedColumn<double> get asLeftDiff1 => $composableBuilder(
      column: $table.asLeftDiff1, builder: (column) => column);

  GeneratedColumn<double> get asLeftTest2 => $composableBuilder(
      column: $table.asLeftTest2, builder: (column) => column);

  GeneratedColumn<double> get asLeftRead2 => $composableBuilder(
      column: $table.asLeftRead2, builder: (column) => column);

  GeneratedColumn<double> get asLeftDiff2 => $composableBuilder(
      column: $table.asLeftDiff2, builder: (column) => column);

  GeneratedColumn<double> get asLeftTest3 => $composableBuilder(
      column: $table.asLeftTest3, builder: (column) => column);

  GeneratedColumn<double> get asLeftRead3 => $composableBuilder(
      column: $table.asLeftRead3, builder: (column) => column);

  GeneratedColumn<double> get asLeftDiff3 => $composableBuilder(
      column: $table.asLeftDiff3, builder: (column) => column);

  GeneratedColumn<double> get asLeftTest4 => $composableBuilder(
      column: $table.asLeftTest4, builder: (column) => column);

  GeneratedColumn<double> get asLeftRead4 => $composableBuilder(
      column: $table.asLeftRead4, builder: (column) => column);

  GeneratedColumn<double> get asLeftDiff4 => $composableBuilder(
      column: $table.asLeftDiff4, builder: (column) => column);

  GeneratedColumn<double> get asLeftTest5 => $composableBuilder(
      column: $table.asLeftTest5, builder: (column) => column);

  GeneratedColumn<double> get asLeftRead5 => $composableBuilder(
      column: $table.asLeftRead5, builder: (column) => column);

  GeneratedColumn<double> get asLeftDiff5 => $composableBuilder(
      column: $table.asLeftDiff5, builder: (column) => column);

  GeneratedColumn<double> get asLeftTest6 => $composableBuilder(
      column: $table.asLeftTest6, builder: (column) => column);

  GeneratedColumn<double> get asLeftRead6 => $composableBuilder(
      column: $table.asLeftRead6, builder: (column) => column);

  GeneratedColumn<double> get asLeftDiff6 => $composableBuilder(
      column: $table.asLeftDiff6, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get weightTestUnit => $composableBuilder(
      column: $table.weightTestUnit, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$ServiceReportsTableAnnotationComposer get serviceReportId {
    final $$ServiceReportsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.serviceReportId,
        referencedTable: $db.serviceReports,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$WeightTestsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WeightTestsTable,
    WeightTest,
    $$WeightTestsTableFilterComposer,
    $$WeightTestsTableOrderingComposer,
    $$WeightTestsTableAnnotationComposer,
    $$WeightTestsTableCreateCompanionBuilder,
    $$WeightTestsTableUpdateCompanionBuilder,
    (WeightTest, $$WeightTestsTableReferences),
    WeightTest,
    PrefetchHooks Function({bool serviceReportId})> {
  $$WeightTestsTableTableManager(_$AppDatabase db, $WeightTestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeightTestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeightTestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeightTestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> serviceReportId = const Value.absent(),
            Value<String> eccentricityType = const Value.absent(),
            Value<int> eccentricityPoints = const Value.absent(),
            Value<String?> eccentricityDirections = const Value.absent(),
            Value<double?> eccentricity1 = const Value.absent(),
            Value<double?> eccentricity2 = const Value.absent(),
            Value<double?> eccentricity3 = const Value.absent(),
            Value<double?> eccentricity4 = const Value.absent(),
            Value<double?> eccentricity5 = const Value.absent(),
            Value<double?> eccentricity6 = const Value.absent(),
            Value<double?> eccentricity7 = const Value.absent(),
            Value<double?> eccentricity8 = const Value.absent(),
            Value<double?> eccentricity9 = const Value.absent(),
            Value<double?> eccentricity10 = const Value.absent(),
            Value<String?> eccentricityError = const Value.absent(),
            Value<double?> asFoundTest1 = const Value.absent(),
            Value<double?> asFoundRead1 = const Value.absent(),
            Value<double?> asFoundDiff1 = const Value.absent(),
            Value<double?> asFoundTest2 = const Value.absent(),
            Value<double?> asFoundRead2 = const Value.absent(),
            Value<double?> asFoundDiff2 = const Value.absent(),
            Value<double?> asFoundTest3 = const Value.absent(),
            Value<double?> asFoundRead3 = const Value.absent(),
            Value<double?> asFoundDiff3 = const Value.absent(),
            Value<double?> asFoundTest4 = const Value.absent(),
            Value<double?> asFoundRead4 = const Value.absent(),
            Value<double?> asFoundDiff4 = const Value.absent(),
            Value<double?> asFoundTest5 = const Value.absent(),
            Value<double?> asFoundRead5 = const Value.absent(),
            Value<double?> asFoundDiff5 = const Value.absent(),
            Value<double?> asFoundTest6 = const Value.absent(),
            Value<double?> asFoundRead6 = const Value.absent(),
            Value<double?> asFoundDiff6 = const Value.absent(),
            Value<double?> asLeftTest1 = const Value.absent(),
            Value<double?> asLeftRead1 = const Value.absent(),
            Value<double?> asLeftDiff1 = const Value.absent(),
            Value<double?> asLeftTest2 = const Value.absent(),
            Value<double?> asLeftRead2 = const Value.absent(),
            Value<double?> asLeftDiff2 = const Value.absent(),
            Value<double?> asLeftTest3 = const Value.absent(),
            Value<double?> asLeftRead3 = const Value.absent(),
            Value<double?> asLeftDiff3 = const Value.absent(),
            Value<double?> asLeftTest4 = const Value.absent(),
            Value<double?> asLeftRead4 = const Value.absent(),
            Value<double?> asLeftDiff4 = const Value.absent(),
            Value<double?> asLeftTest5 = const Value.absent(),
            Value<double?> asLeftRead5 = const Value.absent(),
            Value<double?> asLeftDiff5 = const Value.absent(),
            Value<double?> asLeftTest6 = const Value.absent(),
            Value<double?> asLeftRead6 = const Value.absent(),
            Value<double?> asLeftDiff6 = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> weightTestUnit = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              WeightTestsCompanion(
            id: id,
            serviceReportId: serviceReportId,
            eccentricityType: eccentricityType,
            eccentricityPoints: eccentricityPoints,
            eccentricityDirections: eccentricityDirections,
            eccentricity1: eccentricity1,
            eccentricity2: eccentricity2,
            eccentricity3: eccentricity3,
            eccentricity4: eccentricity4,
            eccentricity5: eccentricity5,
            eccentricity6: eccentricity6,
            eccentricity7: eccentricity7,
            eccentricity8: eccentricity8,
            eccentricity9: eccentricity9,
            eccentricity10: eccentricity10,
            eccentricityError: eccentricityError,
            asFoundTest1: asFoundTest1,
            asFoundRead1: asFoundRead1,
            asFoundDiff1: asFoundDiff1,
            asFoundTest2: asFoundTest2,
            asFoundRead2: asFoundRead2,
            asFoundDiff2: asFoundDiff2,
            asFoundTest3: asFoundTest3,
            asFoundRead3: asFoundRead3,
            asFoundDiff3: asFoundDiff3,
            asFoundTest4: asFoundTest4,
            asFoundRead4: asFoundRead4,
            asFoundDiff4: asFoundDiff4,
            asFoundTest5: asFoundTest5,
            asFoundRead5: asFoundRead5,
            asFoundDiff5: asFoundDiff5,
            asFoundTest6: asFoundTest6,
            asFoundRead6: asFoundRead6,
            asFoundDiff6: asFoundDiff6,
            asLeftTest1: asLeftTest1,
            asLeftRead1: asLeftRead1,
            asLeftDiff1: asLeftDiff1,
            asLeftTest2: asLeftTest2,
            asLeftRead2: asLeftRead2,
            asLeftDiff2: asLeftDiff2,
            asLeftTest3: asLeftTest3,
            asLeftRead3: asLeftRead3,
            asLeftDiff3: asLeftDiff3,
            asLeftTest4: asLeftTest4,
            asLeftRead4: asLeftRead4,
            asLeftDiff4: asLeftDiff4,
            asLeftTest5: asLeftTest5,
            asLeftRead5: asLeftRead5,
            asLeftDiff5: asLeftDiff5,
            asLeftTest6: asLeftTest6,
            asLeftRead6: asLeftRead6,
            asLeftDiff6: asLeftDiff6,
            notes: notes,
            weightTestUnit: weightTestUnit,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int serviceReportId,
            required String eccentricityType,
            Value<int> eccentricityPoints = const Value.absent(),
            Value<String?> eccentricityDirections = const Value.absent(),
            Value<double?> eccentricity1 = const Value.absent(),
            Value<double?> eccentricity2 = const Value.absent(),
            Value<double?> eccentricity3 = const Value.absent(),
            Value<double?> eccentricity4 = const Value.absent(),
            Value<double?> eccentricity5 = const Value.absent(),
            Value<double?> eccentricity6 = const Value.absent(),
            Value<double?> eccentricity7 = const Value.absent(),
            Value<double?> eccentricity8 = const Value.absent(),
            Value<double?> eccentricity9 = const Value.absent(),
            Value<double?> eccentricity10 = const Value.absent(),
            Value<String?> eccentricityError = const Value.absent(),
            Value<double?> asFoundTest1 = const Value.absent(),
            Value<double?> asFoundRead1 = const Value.absent(),
            Value<double?> asFoundDiff1 = const Value.absent(),
            Value<double?> asFoundTest2 = const Value.absent(),
            Value<double?> asFoundRead2 = const Value.absent(),
            Value<double?> asFoundDiff2 = const Value.absent(),
            Value<double?> asFoundTest3 = const Value.absent(),
            Value<double?> asFoundRead3 = const Value.absent(),
            Value<double?> asFoundDiff3 = const Value.absent(),
            Value<double?> asFoundTest4 = const Value.absent(),
            Value<double?> asFoundRead4 = const Value.absent(),
            Value<double?> asFoundDiff4 = const Value.absent(),
            Value<double?> asFoundTest5 = const Value.absent(),
            Value<double?> asFoundRead5 = const Value.absent(),
            Value<double?> asFoundDiff5 = const Value.absent(),
            Value<double?> asFoundTest6 = const Value.absent(),
            Value<double?> asFoundRead6 = const Value.absent(),
            Value<double?> asFoundDiff6 = const Value.absent(),
            Value<double?> asLeftTest1 = const Value.absent(),
            Value<double?> asLeftRead1 = const Value.absent(),
            Value<double?> asLeftDiff1 = const Value.absent(),
            Value<double?> asLeftTest2 = const Value.absent(),
            Value<double?> asLeftRead2 = const Value.absent(),
            Value<double?> asLeftDiff2 = const Value.absent(),
            Value<double?> asLeftTest3 = const Value.absent(),
            Value<double?> asLeftRead3 = const Value.absent(),
            Value<double?> asLeftDiff3 = const Value.absent(),
            Value<double?> asLeftTest4 = const Value.absent(),
            Value<double?> asLeftRead4 = const Value.absent(),
            Value<double?> asLeftDiff4 = const Value.absent(),
            Value<double?> asLeftTest5 = const Value.absent(),
            Value<double?> asLeftRead5 = const Value.absent(),
            Value<double?> asLeftDiff5 = const Value.absent(),
            Value<double?> asLeftTest6 = const Value.absent(),
            Value<double?> asLeftRead6 = const Value.absent(),
            Value<double?> asLeftDiff6 = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> weightTestUnit = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              WeightTestsCompanion.insert(
            id: id,
            serviceReportId: serviceReportId,
            eccentricityType: eccentricityType,
            eccentricityPoints: eccentricityPoints,
            eccentricityDirections: eccentricityDirections,
            eccentricity1: eccentricity1,
            eccentricity2: eccentricity2,
            eccentricity3: eccentricity3,
            eccentricity4: eccentricity4,
            eccentricity5: eccentricity5,
            eccentricity6: eccentricity6,
            eccentricity7: eccentricity7,
            eccentricity8: eccentricity8,
            eccentricity9: eccentricity9,
            eccentricity10: eccentricity10,
            eccentricityError: eccentricityError,
            asFoundTest1: asFoundTest1,
            asFoundRead1: asFoundRead1,
            asFoundDiff1: asFoundDiff1,
            asFoundTest2: asFoundTest2,
            asFoundRead2: asFoundRead2,
            asFoundDiff2: asFoundDiff2,
            asFoundTest3: asFoundTest3,
            asFoundRead3: asFoundRead3,
            asFoundDiff3: asFoundDiff3,
            asFoundTest4: asFoundTest4,
            asFoundRead4: asFoundRead4,
            asFoundDiff4: asFoundDiff4,
            asFoundTest5: asFoundTest5,
            asFoundRead5: asFoundRead5,
            asFoundDiff5: asFoundDiff5,
            asFoundTest6: asFoundTest6,
            asFoundRead6: asFoundRead6,
            asFoundDiff6: asFoundDiff6,
            asLeftTest1: asLeftTest1,
            asLeftRead1: asLeftRead1,
            asLeftDiff1: asLeftDiff1,
            asLeftTest2: asLeftTest2,
            asLeftRead2: asLeftRead2,
            asLeftDiff2: asLeftDiff2,
            asLeftTest3: asLeftTest3,
            asLeftRead3: asLeftRead3,
            asLeftDiff3: asLeftDiff3,
            asLeftTest4: asLeftTest4,
            asLeftRead4: asLeftRead4,
            asLeftDiff4: asLeftDiff4,
            asLeftTest5: asLeftTest5,
            asLeftRead5: asLeftRead5,
            asLeftDiff5: asLeftDiff5,
            asLeftTest6: asLeftTest6,
            asLeftRead6: asLeftRead6,
            asLeftDiff6: asLeftDiff6,
            notes: notes,
            weightTestUnit: weightTestUnit,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WeightTestsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({serviceReportId = false}) {
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
                if (serviceReportId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.serviceReportId,
                    referencedTable:
                        $$WeightTestsTableReferences._serviceReportIdTable(db),
                    referencedColumn: $$WeightTestsTableReferences
                        ._serviceReportIdTable(db)
                        .id,
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

typedef $$WeightTestsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WeightTestsTable,
    WeightTest,
    $$WeightTestsTableFilterComposer,
    $$WeightTestsTableOrderingComposer,
    $$WeightTestsTableAnnotationComposer,
    $$WeightTestsTableCreateCompanionBuilder,
    $$WeightTestsTableUpdateCompanionBuilder,
    (WeightTest, $$WeightTestsTableReferences),
    WeightTest,
    PrefetchHooks Function({bool serviceReportId})>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<int?> uidNumber,
  required String uid,
  Value<String?> email,
  Value<String?> displayName,
  Value<String?> passwordHash,
  Value<bool> isAdmin,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<int?> uidNumber,
  Value<String> uid,
  Value<String?> email,
  Value<String?> displayName,
  Value<String?> passwordHash,
  Value<bool> isAdmin,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, AppUser> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InventoryTransactionsTable,
      List<InventoryTransaction>> _inventoryTransactionsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.inventoryTransactions,
          aliasName: $_aliasNameGenerator(
              db.users.id, db.inventoryTransactions.userId));

  $$InventoryTransactionsTableProcessedTableManager
      get inventoryTransactionsRefs {
    final manager = $$InventoryTransactionsTableTableManager(
            $_db, $_db.inventoryTransactions)
        .filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_inventoryTransactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get uidNumber => $composableBuilder(
      column: $table.uidNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAdmin => $composableBuilder(
      column: $table.isAdmin, builder: (column) => ColumnFilters(column));

  Expression<bool> inventoryTransactionsRefs(
      Expression<bool> Function($$InventoryTransactionsTableFilterComposer f)
          f) {
    final $$InventoryTransactionsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactions,
            getReferencedColumn: (t) => t.userId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableFilterComposer(
                  $db: $db,
                  $table: $db.inventoryTransactions,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get uidNumber => $composableBuilder(
      column: $table.uidNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAdmin => $composableBuilder(
      column: $table.isAdmin, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get uidNumber =>
      $composableBuilder(column: $table.uidNumber, builder: (column) => column);

  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => column);

  GeneratedColumn<bool> get isAdmin =>
      $composableBuilder(column: $table.isAdmin, builder: (column) => column);

  Expression<T> inventoryTransactionsRefs<T extends Object>(
      Expression<T> Function($$InventoryTransactionsTableAnnotationComposer a)
          f) {
    final $$InventoryTransactionsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactions,
            getReferencedColumn: (t) => t.userId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryTransactions,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    AppUser,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (AppUser, $$UsersTableReferences),
    AppUser,
    PrefetchHooks Function({bool inventoryTransactionsRefs})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> uidNumber = const Value.absent(),
            Value<String> uid = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> displayName = const Value.absent(),
            Value<String?> passwordHash = const Value.absent(),
            Value<bool> isAdmin = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            uidNumber: uidNumber,
            uid: uid,
            email: email,
            displayName: displayName,
            passwordHash: passwordHash,
            isAdmin: isAdmin,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> uidNumber = const Value.absent(),
            required String uid,
            Value<String?> email = const Value.absent(),
            Value<String?> displayName = const Value.absent(),
            Value<String?> passwordHash = const Value.absent(),
            Value<bool> isAdmin = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            uidNumber: uidNumber,
            uid: uid,
            email: email,
            displayName: displayName,
            passwordHash: passwordHash,
            isAdmin: isAdmin,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({inventoryTransactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (inventoryTransactionsRefs) db.inventoryTransactions
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (inventoryTransactionsRefs)
                    await $_getPrefetchedData<AppUser, $UsersTable,
                            InventoryTransaction>(
                        currentTable: table,
                        referencedTable: $$UsersTableReferences
                            ._inventoryTransactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .inventoryTransactionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    AppUser,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (AppUser, $$UsersTableReferences),
    AppUser,
    PrefetchHooks Function({bool inventoryTransactionsRefs})>;
typedef $$InventoryItemsTableCreateCompanionBuilder = InventoryItemsCompanion
    Function({
  Value<int> id,
  required String partNumber,
  required String description,
  Value<String?> type,
  Value<String?> make,
  Value<String?> model,
  Value<String?> serial,
  Value<String?> capacity,
  Value<int> quantity,
  Value<double?> price,
  Value<String?> location,
  Value<String?> barcode,
  Value<bool> isSold,
  Value<int?> customerId,
  Value<int?> workOrderId,
  Value<String?> uid,
  Value<DateTime> lastModified,
  Value<bool> synced,
});
typedef $$InventoryItemsTableUpdateCompanionBuilder = InventoryItemsCompanion
    Function({
  Value<int> id,
  Value<String> partNumber,
  Value<String> description,
  Value<String?> type,
  Value<String?> make,
  Value<String?> model,
  Value<String?> serial,
  Value<String?> capacity,
  Value<int> quantity,
  Value<double?> price,
  Value<String?> location,
  Value<String?> barcode,
  Value<bool> isSold,
  Value<int?> customerId,
  Value<int?> workOrderId,
  Value<String?> uid,
  Value<DateTime> lastModified,
  Value<bool> synced,
});

final class $$InventoryItemsTableReferences
    extends BaseReferences<_$AppDatabase, $InventoryItemsTable, InventoryItem> {
  $$InventoryItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias(
          $_aliasNameGenerator(db.inventoryItems.customerId, db.customers.id));

  $$CustomersTableProcessedTableManager? get customerId {
    final $_column = $_itemColumn<int>('customer_id');
    if ($_column == null) return null;
    final manager = $$CustomersTableTableManager($_db, $_db.customers)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $WorkOrdersTable _workOrderIdTable(_$AppDatabase db) =>
      db.workOrders.createAlias($_aliasNameGenerator(
          db.inventoryItems.workOrderId, db.workOrders.id));

  $$WorkOrdersTableProcessedTableManager? get workOrderId {
    final $_column = $_itemColumn<int>('work_order_id');
    if ($_column == null) return null;
    final manager = $$WorkOrdersTableTableManager($_db, $_db.workOrders)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workOrderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$InventoryTransactionsTable,
      List<InventoryTransaction>> _inventoryTransactionsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.inventoryTransactions,
          aliasName: $_aliasNameGenerator(
              db.inventoryItems.id, db.inventoryTransactions.inventoryItemId));

  $$InventoryTransactionsTableProcessedTableManager
      get inventoryTransactionsRefs {
    final manager = $$InventoryTransactionsTableTableManager(
            $_db, $_db.inventoryTransactions)
        .filter(
            (f) => f.inventoryItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_inventoryTransactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$InventoryItemsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get partNumber => $composableBuilder(
      column: $table.partNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get make => $composableBuilder(
      column: $table.make, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get serial => $composableBuilder(
      column: $table.serial, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get capacity => $composableBuilder(
      column: $table.capacity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSold => $composableBuilder(
      column: $table.isSold, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => ColumnFilters(column));

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

  Expression<bool> inventoryTransactionsRefs(
      Expression<bool> Function($$InventoryTransactionsTableFilterComposer f)
          f) {
    final $$InventoryTransactionsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactions,
            getReferencedColumn: (t) => t.inventoryItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableFilterComposer(
                  $db: $db,
                  $table: $db.inventoryTransactions,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$InventoryItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get partNumber => $composableBuilder(
      column: $table.partNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get make => $composableBuilder(
      column: $table.make, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get serial => $composableBuilder(
      column: $table.serial, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get capacity => $composableBuilder(
      column: $table.capacity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSold => $composableBuilder(
      column: $table.isSold, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified,
      builder: (column) => ColumnOrderings(column));

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
}

class $$InventoryItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get partNumber => $composableBuilder(
      column: $table.partNumber, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get make =>
      $composableBuilder(column: $table.make, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<bool> get isSold =>
      $composableBuilder(column: $table.isSold, builder: (column) => column);

  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => column);

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

  Expression<T> inventoryTransactionsRefs<T extends Object>(
      Expression<T> Function($$InventoryTransactionsTableAnnotationComposer a)
          f) {
    final $$InventoryTransactionsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactions,
            getReferencedColumn: (t) => t.inventoryItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryTransactions,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$InventoryItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryItemsTable,
    InventoryItem,
    $$InventoryItemsTableFilterComposer,
    $$InventoryItemsTableOrderingComposer,
    $$InventoryItemsTableAnnotationComposer,
    $$InventoryItemsTableCreateCompanionBuilder,
    $$InventoryItemsTableUpdateCompanionBuilder,
    (InventoryItem, $$InventoryItemsTableReferences),
    InventoryItem,
    PrefetchHooks Function(
        {bool customerId, bool workOrderId, bool inventoryTransactionsRefs})> {
  $$InventoryItemsTableTableManager(
      _$AppDatabase db, $InventoryItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> partNumber = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String?> make = const Value.absent(),
            Value<String?> model = const Value.absent(),
            Value<String?> serial = const Value.absent(),
            Value<String?> capacity = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<bool> isSold = const Value.absent(),
            Value<int?> customerId = const Value.absent(),
            Value<int?> workOrderId = const Value.absent(),
            Value<String?> uid = const Value.absent(),
            Value<DateTime> lastModified = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              InventoryItemsCompanion(
            id: id,
            partNumber: partNumber,
            description: description,
            type: type,
            make: make,
            model: model,
            serial: serial,
            capacity: capacity,
            quantity: quantity,
            price: price,
            location: location,
            barcode: barcode,
            isSold: isSold,
            customerId: customerId,
            workOrderId: workOrderId,
            uid: uid,
            lastModified: lastModified,
            synced: synced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String partNumber,
            required String description,
            Value<String?> type = const Value.absent(),
            Value<String?> make = const Value.absent(),
            Value<String?> model = const Value.absent(),
            Value<String?> serial = const Value.absent(),
            Value<String?> capacity = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<bool> isSold = const Value.absent(),
            Value<int?> customerId = const Value.absent(),
            Value<int?> workOrderId = const Value.absent(),
            Value<String?> uid = const Value.absent(),
            Value<DateTime> lastModified = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              InventoryItemsCompanion.insert(
            id: id,
            partNumber: partNumber,
            description: description,
            type: type,
            make: make,
            model: model,
            serial: serial,
            capacity: capacity,
            quantity: quantity,
            price: price,
            location: location,
            barcode: barcode,
            isSold: isSold,
            customerId: customerId,
            workOrderId: workOrderId,
            uid: uid,
            lastModified: lastModified,
            synced: synced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$InventoryItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {customerId = false,
              workOrderId = false,
              inventoryTransactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (inventoryTransactionsRefs) db.inventoryTransactions
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
                        $$InventoryItemsTableReferences._customerIdTable(db),
                    referencedColumn:
                        $$InventoryItemsTableReferences._customerIdTable(db).id,
                  ) as T;
                }
                if (workOrderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workOrderId,
                    referencedTable:
                        $$InventoryItemsTableReferences._workOrderIdTable(db),
                    referencedColumn: $$InventoryItemsTableReferences
                        ._workOrderIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (inventoryTransactionsRefs)
                    await $_getPrefetchedData<InventoryItem,
                            $InventoryItemsTable, InventoryTransaction>(
                        currentTable: table,
                        referencedTable: $$InventoryItemsTableReferences
                            ._inventoryTransactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$InventoryItemsTableReferences(db, table, p0)
                                .inventoryTransactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.inventoryItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$InventoryItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InventoryItemsTable,
    InventoryItem,
    $$InventoryItemsTableFilterComposer,
    $$InventoryItemsTableOrderingComposer,
    $$InventoryItemsTableAnnotationComposer,
    $$InventoryItemsTableCreateCompanionBuilder,
    $$InventoryItemsTableUpdateCompanionBuilder,
    (InventoryItem, $$InventoryItemsTableReferences),
    InventoryItem,
    PrefetchHooks Function(
        {bool customerId, bool workOrderId, bool inventoryTransactionsRefs})>;
typedef $$InventoryTransactionsTableCreateCompanionBuilder
    = InventoryTransactionsCompanion Function({
  Value<int> id,
  required int inventoryItemId,
  Value<int> quantity,
  Value<String> type,
  Value<int?> customerId,
  Value<int?> workOrderId,
  Value<String?> sourceLocation,
  Value<String?> targetLocation,
  required int userId,
  Value<String?> note,
  Value<DateTime> timestamp,
  Value<bool> synced,
});
typedef $$InventoryTransactionsTableUpdateCompanionBuilder
    = InventoryTransactionsCompanion Function({
  Value<int> id,
  Value<int> inventoryItemId,
  Value<int> quantity,
  Value<String> type,
  Value<int?> customerId,
  Value<int?> workOrderId,
  Value<String?> sourceLocation,
  Value<String?> targetLocation,
  Value<int> userId,
  Value<String?> note,
  Value<DateTime> timestamp,
  Value<bool> synced,
});

final class $$InventoryTransactionsTableReferences extends BaseReferences<
    _$AppDatabase, $InventoryTransactionsTable, InventoryTransaction> {
  $$InventoryTransactionsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $InventoryItemsTable _inventoryItemIdTable(_$AppDatabase db) =>
      db.inventoryItems.createAlias($_aliasNameGenerator(
          db.inventoryTransactions.inventoryItemId, db.inventoryItems.id));

  $$InventoryItemsTableProcessedTableManager get inventoryItemId {
    final $_column = $_itemColumn<int>('inventory_item_id')!;

    final manager = $$InventoryItemsTableTableManager($_db, $_db.inventoryItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_inventoryItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias($_aliasNameGenerator(
          db.inventoryTransactions.customerId, db.customers.id));

  $$CustomersTableProcessedTableManager? get customerId {
    final $_column = $_itemColumn<int>('customer_id');
    if ($_column == null) return null;
    final manager = $$CustomersTableTableManager($_db, $_db.customers)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $WorkOrdersTable _workOrderIdTable(_$AppDatabase db) =>
      db.workOrders.createAlias($_aliasNameGenerator(
          db.inventoryTransactions.workOrderId, db.workOrders.id));

  $$WorkOrdersTableProcessedTableManager? get workOrderId {
    final $_column = $_itemColumn<int>('work_order_id');
    if ($_column == null) return null;
    final manager = $$WorkOrdersTableTableManager($_db, $_db.workOrders)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workOrderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.inventoryTransactions.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$InventoryTransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryTransactionsTable> {
  $$InventoryTransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceLocation => $composableBuilder(
      column: $table.sourceLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetLocation => $composableBuilder(
      column: $table.targetLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  $$InventoryItemsTableFilterComposer get inventoryItemId {
    final $$InventoryItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.inventoryItemId,
        referencedTable: $db.inventoryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryItemsTableFilterComposer(
              $db: $db,
              $table: $db.inventoryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

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

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InventoryTransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryTransactionsTable> {
  $$InventoryTransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceLocation => $composableBuilder(
      column: $table.sourceLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetLocation => $composableBuilder(
      column: $table.targetLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  $$InventoryItemsTableOrderingComposer get inventoryItemId {
    final $$InventoryItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.inventoryItemId,
        referencedTable: $db.inventoryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryItemsTableOrderingComposer(
              $db: $db,
              $table: $db.inventoryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

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

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InventoryTransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryTransactionsTable> {
  $$InventoryTransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get sourceLocation => $composableBuilder(
      column: $table.sourceLocation, builder: (column) => column);

  GeneratedColumn<String> get targetLocation => $composableBuilder(
      column: $table.targetLocation, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  $$InventoryItemsTableAnnotationComposer get inventoryItemId {
    final $$InventoryItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.inventoryItemId,
        referencedTable: $db.inventoryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.inventoryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

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

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InventoryTransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryTransactionsTable,
    InventoryTransaction,
    $$InventoryTransactionsTableFilterComposer,
    $$InventoryTransactionsTableOrderingComposer,
    $$InventoryTransactionsTableAnnotationComposer,
    $$InventoryTransactionsTableCreateCompanionBuilder,
    $$InventoryTransactionsTableUpdateCompanionBuilder,
    (InventoryTransaction, $$InventoryTransactionsTableReferences),
    InventoryTransaction,
    PrefetchHooks Function(
        {bool inventoryItemId,
        bool customerId,
        bool workOrderId,
        bool userId})> {
  $$InventoryTransactionsTableTableManager(
      _$AppDatabase db, $InventoryTransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryTransactionsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryTransactionsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryTransactionsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> inventoryItemId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int?> customerId = const Value.absent(),
            Value<int?> workOrderId = const Value.absent(),
            Value<String?> sourceLocation = const Value.absent(),
            Value<String?> targetLocation = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              InventoryTransactionsCompanion(
            id: id,
            inventoryItemId: inventoryItemId,
            quantity: quantity,
            type: type,
            customerId: customerId,
            workOrderId: workOrderId,
            sourceLocation: sourceLocation,
            targetLocation: targetLocation,
            userId: userId,
            note: note,
            timestamp: timestamp,
            synced: synced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int inventoryItemId,
            Value<int> quantity = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int?> customerId = const Value.absent(),
            Value<int?> workOrderId = const Value.absent(),
            Value<String?> sourceLocation = const Value.absent(),
            Value<String?> targetLocation = const Value.absent(),
            required int userId,
            Value<String?> note = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              InventoryTransactionsCompanion.insert(
            id: id,
            inventoryItemId: inventoryItemId,
            quantity: quantity,
            type: type,
            customerId: customerId,
            workOrderId: workOrderId,
            sourceLocation: sourceLocation,
            targetLocation: targetLocation,
            userId: userId,
            note: note,
            timestamp: timestamp,
            synced: synced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$InventoryTransactionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {inventoryItemId = false,
              customerId = false,
              workOrderId = false,
              userId = false}) {
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
                if (inventoryItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.inventoryItemId,
                    referencedTable: $$InventoryTransactionsTableReferences
                        ._inventoryItemIdTable(db),
                    referencedColumn: $$InventoryTransactionsTableReferences
                        ._inventoryItemIdTable(db)
                        .id,
                  ) as T;
                }
                if (customerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.customerId,
                    referencedTable: $$InventoryTransactionsTableReferences
                        ._customerIdTable(db),
                    referencedColumn: $$InventoryTransactionsTableReferences
                        ._customerIdTable(db)
                        .id,
                  ) as T;
                }
                if (workOrderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workOrderId,
                    referencedTable: $$InventoryTransactionsTableReferences
                        ._workOrderIdTable(db),
                    referencedColumn: $$InventoryTransactionsTableReferences
                        ._workOrderIdTable(db)
                        .id,
                  ) as T;
                }
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$InventoryTransactionsTableReferences._userIdTable(db),
                    referencedColumn: $$InventoryTransactionsTableReferences
                        ._userIdTable(db)
                        .id,
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

typedef $$InventoryTransactionsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $InventoryTransactionsTable,
        InventoryTransaction,
        $$InventoryTransactionsTableFilterComposer,
        $$InventoryTransactionsTableOrderingComposer,
        $$InventoryTransactionsTableAnnotationComposer,
        $$InventoryTransactionsTableCreateCompanionBuilder,
        $$InventoryTransactionsTableUpdateCompanionBuilder,
        (InventoryTransaction, $$InventoryTransactionsTableReferences),
        InventoryTransaction,
        PrefetchHooks Function(
            {bool inventoryItemId,
            bool customerId,
            bool workOrderId,
            bool userId})>;

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
  $$WeightTestsTableTableManager get weightTests =>
      $$WeightTestsTableTableManager(_db, _db.weightTests);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$InventoryItemsTableTableManager get inventoryItems =>
      $$InventoryItemsTableTableManager(_db, _db.inventoryItems);
  $$InventoryTransactionsTableTableManager get inventoryTransactions =>
      $$InventoryTransactionsTableTableManager(_db, _db.inventoryTransactions);
}
