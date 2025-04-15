// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CustomersTable extends Customers
    with drift.TableInfo<$CustomersTable, Customer> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _nameMeta =
      const drift.VerificationMeta('name');
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _billingAddressMeta =
      const drift.VerificationMeta('billingAddress');
  @override
  late final drift.GeneratedColumn<String> billingAddress =
      drift.GeneratedColumn<String>('billing_address', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _cityMeta =
      const drift.VerificationMeta('city');
  @override
  late final drift.GeneratedColumn<String> city = drift.GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _provinceMeta =
      const drift.VerificationMeta('province');
  @override
  late final drift.GeneratedColumn<String> province =
      drift.GeneratedColumn<String>('province', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _postalMeta =
      const drift.VerificationMeta('postal');
  @override
  late final drift.GeneratedColumn<String> postal =
      drift.GeneratedColumn<String>('postal', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _deactivateMeta =
      const drift.VerificationMeta('deactivate');
  @override
  late final drift.GeneratedColumn<bool> deactivate =
      drift.GeneratedColumn<bool>('deactivate', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("deactivate" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _auditFlagMeta =
      const drift.VerificationMeta('auditFlag');
  @override
  late final drift.GeneratedColumn<bool> auditFlag =
      drift.GeneratedColumn<bool>('audit_flag', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("audit_flag" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _syncedMeta =
      const drift.VerificationMeta('synced');
  @override
  late final drift.GeneratedColumn<bool> synced = drift.GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        name,
        billingAddress,
        city,
        province,
        postal,
        deactivate,
        auditFlag,
        synced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<Customer> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('billing_address')) {
      context.handle(
          _billingAddressMeta,
          billingAddress.isAcceptableOrUnknown(
              data['billing_address']!, _billingAddressMeta));
    } else if (isInserting) {
      context.missing(_billingAddressMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('province')) {
      context.handle(_provinceMeta,
          province.isAcceptableOrUnknown(data['province']!, _provinceMeta));
    } else if (isInserting) {
      context.missing(_provinceMeta);
    }
    if (data.containsKey('postal')) {
      context.handle(_postalMeta,
          postal.isAcceptableOrUnknown(data['postal']!, _postalMeta));
    } else if (isInserting) {
      context.missing(_postalMeta);
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
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      billingAddress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}billing_address'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      province: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}province'])!,
      postal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal'])!,
      deactivate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deactivate'])!,
      auditFlag: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}audit_flag'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends drift.DataClass implements drift.Insertable<Customer> {
  final int id;
  final String name;
  final String billingAddress;
  final String city;
  final String province;
  final String postal;
  final bool deactivate;
  final bool auditFlag;
  final bool synced;
  const Customer(
      {required this.id,
      required this.name,
      required this.billingAddress,
      required this.city,
      required this.province,
      required this.postal,
      required this.deactivate,
      required this.auditFlag,
      required this.synced});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['name'] = drift.Variable<String>(name);
    map['billing_address'] = drift.Variable<String>(billingAddress);
    map['city'] = drift.Variable<String>(city);
    map['province'] = drift.Variable<String>(province);
    map['postal'] = drift.Variable<String>(postal);
    map['deactivate'] = drift.Variable<bool>(deactivate);
    map['audit_flag'] = drift.Variable<bool>(auditFlag);
    map['synced'] = drift.Variable<bool>(synced);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      billingAddress: drift.Value(billingAddress),
      city: drift.Value(city),
      province: drift.Value(province),
      postal: drift.Value(postal),
      deactivate: drift.Value(deactivate),
      auditFlag: drift.Value(auditFlag),
      synced: drift.Value(synced),
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      billingAddress: serializer.fromJson<String>(json['billingAddress']),
      city: serializer.fromJson<String>(json['city']),
      province: serializer.fromJson<String>(json['province']),
      postal: serializer.fromJson<String>(json['postal']),
      deactivate: serializer.fromJson<bool>(json['deactivate']),
      auditFlag: serializer.fromJson<bool>(json['auditFlag']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'billingAddress': serializer.toJson<String>(billingAddress),
      'city': serializer.toJson<String>(city),
      'province': serializer.toJson<String>(province),
      'postal': serializer.toJson<String>(postal),
      'deactivate': serializer.toJson<bool>(deactivate),
      'auditFlag': serializer.toJson<bool>(auditFlag),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  Customer copyWith(
          {int? id,
          String? name,
          String? billingAddress,
          String? city,
          String? province,
          String? postal,
          bool? deactivate,
          bool? auditFlag,
          bool? synced}) =>
      Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        billingAddress: billingAddress ?? this.billingAddress,
        city: city ?? this.city,
        province: province ?? this.province,
        postal: postal ?? this.postal,
        deactivate: deactivate ?? this.deactivate,
        auditFlag: auditFlag ?? this.auditFlag,
        synced: synced ?? this.synced,
      );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      billingAddress: data.billingAddress.present
          ? data.billingAddress.value
          : this.billingAddress,
      city: data.city.present ? data.city.value : this.city,
      province: data.province.present ? data.province.value : this.province,
      postal: data.postal.present ? data.postal.value : this.postal,
      deactivate:
          data.deactivate.present ? data.deactivate.value : this.deactivate,
      auditFlag: data.auditFlag.present ? data.auditFlag.value : this.auditFlag,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('city: $city, ')
          ..write('province: $province, ')
          ..write('postal: $postal, ')
          ..write('deactivate: $deactivate, ')
          ..write('auditFlag: $auditFlag, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, billingAddress, city, province,
      postal, deactivate, auditFlag, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.name == this.name &&
          other.billingAddress == this.billingAddress &&
          other.city == this.city &&
          other.province == this.province &&
          other.postal == this.postal &&
          other.deactivate == this.deactivate &&
          other.auditFlag == this.auditFlag &&
          other.synced == this.synced);
}

class CustomersCompanion extends drift.UpdateCompanion<Customer> {
  final drift.Value<int> id;
  final drift.Value<String> name;
  final drift.Value<String> billingAddress;
  final drift.Value<String> city;
  final drift.Value<String> province;
  final drift.Value<String> postal;
  final drift.Value<bool> deactivate;
  final drift.Value<bool> auditFlag;
  final drift.Value<bool> synced;
  const CustomersCompanion({
    this.id = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.billingAddress = const drift.Value.absent(),
    this.city = const drift.Value.absent(),
    this.province = const drift.Value.absent(),
    this.postal = const drift.Value.absent(),
    this.deactivate = const drift.Value.absent(),
    this.auditFlag = const drift.Value.absent(),
    this.synced = const drift.Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const drift.Value.absent(),
    required String name,
    required String billingAddress,
    required String city,
    required String province,
    required String postal,
    this.deactivate = const drift.Value.absent(),
    this.auditFlag = const drift.Value.absent(),
    this.synced = const drift.Value.absent(),
  })  : name = drift.Value(name),
        billingAddress = drift.Value(billingAddress),
        city = drift.Value(city),
        province = drift.Value(province),
        postal = drift.Value(postal);
  static drift.Insertable<Customer> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? name,
    drift.Expression<String>? billingAddress,
    drift.Expression<String>? city,
    drift.Expression<String>? province,
    drift.Expression<String>? postal,
    drift.Expression<bool>? deactivate,
    drift.Expression<bool>? auditFlag,
    drift.Expression<bool>? synced,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (billingAddress != null) 'billing_address': billingAddress,
      if (city != null) 'city': city,
      if (province != null) 'province': province,
      if (postal != null) 'postal': postal,
      if (deactivate != null) 'deactivate': deactivate,
      if (auditFlag != null) 'audit_flag': auditFlag,
      if (synced != null) 'synced': synced,
    });
  }

  CustomersCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? name,
      drift.Value<String>? billingAddress,
      drift.Value<String>? city,
      drift.Value<String>? province,
      drift.Value<String>? postal,
      drift.Value<bool>? deactivate,
      drift.Value<bool>? auditFlag,
      drift.Value<bool>? synced}) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      billingAddress: billingAddress ?? this.billingAddress,
      city: city ?? this.city,
      province: province ?? this.province,
      postal: postal ?? this.postal,
      deactivate: deactivate ?? this.deactivate,
      auditFlag: auditFlag ?? this.auditFlag,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (billingAddress.present) {
      map['billing_address'] = drift.Variable<String>(billingAddress.value);
    }
    if (city.present) {
      map['city'] = drift.Variable<String>(city.value);
    }
    if (province.present) {
      map['province'] = drift.Variable<String>(province.value);
    }
    if (postal.present) {
      map['postal'] = drift.Variable<String>(postal.value);
    }
    if (deactivate.present) {
      map['deactivate'] = drift.Variable<bool>(deactivate.value);
    }
    if (auditFlag.present) {
      map['audit_flag'] = drift.Variable<bool>(auditFlag.value);
    }
    if (synced.present) {
      map['synced'] = drift.Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('city: $city, ')
          ..write('province: $province, ')
          ..write('postal: $postal, ')
          ..write('deactivate: $deactivate, ')
          ..write('auditFlag: $auditFlag, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $ContactsTable extends Contacts
    with drift.TableInfo<$ContactsTable, Contact> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _customerIdMeta =
      const drift.VerificationMeta('customerId');
  @override
  late final drift.GeneratedColumn<int> customerId = drift.GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES customers (id)'));
  static const drift.VerificationMeta _nameMeta =
      const drift.VerificationMeta('name');
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _phoneMeta =
      const drift.VerificationMeta('phone');
  @override
  late final drift.GeneratedColumn<String> phone =
      drift.GeneratedColumn<String>('phone', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _emailMeta =
      const drift.VerificationMeta('email');
  @override
  late final drift.GeneratedColumn<String> email =
      drift.GeneratedColumn<String>('email', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _noteMeta =
      const drift.VerificationMeta('note');
  @override
  late final drift.GeneratedColumn<String> note = drift.GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _isMainMeta =
      const drift.VerificationMeta('isMain');
  @override
  late final drift.GeneratedColumn<bool> isMain = drift.GeneratedColumn<bool>(
      'is_main', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_main" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _deactivateMeta =
      const drift.VerificationMeta('deactivate');
  @override
  late final drift.GeneratedColumn<bool> deactivate =
      drift.GeneratedColumn<bool>('deactivate', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("deactivate" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _auditFlagMeta =
      const drift.VerificationMeta('auditFlag');
  @override
  late final drift.GeneratedColumn<bool> auditFlag =
      drift.GeneratedColumn<bool>('audit_flag', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("audit_flag" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _syncedMeta =
      const drift.VerificationMeta('synced');
  @override
  late final drift.GeneratedColumn<bool> synced = drift.GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        customerId,
        name,
        phone,
        email,
        note,
        isMain,
        deactivate,
        auditFlag,
        synced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contacts';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<Contact> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
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
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
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
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      isMain: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_main'])!,
      deactivate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deactivate'])!,
      auditFlag: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}audit_flag'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $ContactsTable createAlias(String alias) {
    return $ContactsTable(attachedDatabase, alias);
  }
}

class Contact extends drift.DataClass implements drift.Insertable<Contact> {
  final int id;
  final int customerId;
  final String name;
  final String? phone;
  final String? email;
  final String? note;
  final bool isMain;
  final bool deactivate;
  final bool auditFlag;
  final bool synced;
  const Contact(
      {required this.id,
      required this.customerId,
      required this.name,
      this.phone,
      this.email,
      this.note,
      required this.isMain,
      required this.deactivate,
      required this.auditFlag,
      required this.synced});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['customer_id'] = drift.Variable<int>(customerId);
    map['name'] = drift.Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = drift.Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = drift.Variable<String>(email);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = drift.Variable<String>(note);
    }
    map['is_main'] = drift.Variable<bool>(isMain);
    map['deactivate'] = drift.Variable<bool>(deactivate);
    map['audit_flag'] = drift.Variable<bool>(auditFlag);
    map['synced'] = drift.Variable<bool>(synced);
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      id: drift.Value(id),
      customerId: drift.Value(customerId),
      name: drift.Value(name),
      phone: phone == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(phone),
      email: email == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(email),
      note: note == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(note),
      isMain: drift.Value(isMain),
      deactivate: drift.Value(deactivate),
      auditFlag: drift.Value(auditFlag),
      synced: drift.Value(synced),
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Contact(
      id: serializer.fromJson<int>(json['id']),
      customerId: serializer.fromJson<int>(json['customerId']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      note: serializer.fromJson<String?>(json['note']),
      isMain: serializer.fromJson<bool>(json['isMain']),
      deactivate: serializer.fromJson<bool>(json['deactivate']),
      auditFlag: serializer.fromJson<bool>(json['auditFlag']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerId': serializer.toJson<int>(customerId),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'note': serializer.toJson<String?>(note),
      'isMain': serializer.toJson<bool>(isMain),
      'deactivate': serializer.toJson<bool>(deactivate),
      'auditFlag': serializer.toJson<bool>(auditFlag),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  Contact copyWith(
          {int? id,
          int? customerId,
          String? name,
          drift.Value<String?> phone = const drift.Value.absent(),
          drift.Value<String?> email = const drift.Value.absent(),
          drift.Value<String?> note = const drift.Value.absent(),
          bool? isMain,
          bool? deactivate,
          bool? auditFlag,
          bool? synced}) =>
      Contact(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        note: note.present ? note.value : this.note,
        isMain: isMain ?? this.isMain,
        deactivate: deactivate ?? this.deactivate,
        auditFlag: auditFlag ?? this.auditFlag,
        synced: synced ?? this.synced,
      );
  Contact copyWithCompanion(ContactsCompanion data) {
    return Contact(
      id: data.id.present ? data.id.value : this.id,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      note: data.note.present ? data.note.value : this.note,
      isMain: data.isMain.present ? data.isMain.value : this.isMain,
      deactivate:
          data.deactivate.present ? data.deactivate.value : this.deactivate,
      auditFlag: data.auditFlag.present ? data.auditFlag.value : this.auditFlag,
      synced: data.synced.present ? data.synced.value : this.synced,
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
          ..write('note: $note, ')
          ..write('isMain: $isMain, ')
          ..write('deactivate: $deactivate, ')
          ..write('auditFlag: $auditFlag, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, customerId, name, phone, email, note,
      isMain, deactivate, auditFlag, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Contact &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.note == this.note &&
          other.isMain == this.isMain &&
          other.deactivate == this.deactivate &&
          other.auditFlag == this.auditFlag &&
          other.synced == this.synced);
}

class ContactsCompanion extends drift.UpdateCompanion<Contact> {
  final drift.Value<int> id;
  final drift.Value<int> customerId;
  final drift.Value<String> name;
  final drift.Value<String?> phone;
  final drift.Value<String?> email;
  final drift.Value<String?> note;
  final drift.Value<bool> isMain;
  final drift.Value<bool> deactivate;
  final drift.Value<bool> auditFlag;
  final drift.Value<bool> synced;
  const ContactsCompanion({
    this.id = const drift.Value.absent(),
    this.customerId = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.phone = const drift.Value.absent(),
    this.email = const drift.Value.absent(),
    this.note = const drift.Value.absent(),
    this.isMain = const drift.Value.absent(),
    this.deactivate = const drift.Value.absent(),
    this.auditFlag = const drift.Value.absent(),
    this.synced = const drift.Value.absent(),
  });
  ContactsCompanion.insert({
    this.id = const drift.Value.absent(),
    required int customerId,
    required String name,
    this.phone = const drift.Value.absent(),
    this.email = const drift.Value.absent(),
    this.note = const drift.Value.absent(),
    this.isMain = const drift.Value.absent(),
    this.deactivate = const drift.Value.absent(),
    this.auditFlag = const drift.Value.absent(),
    this.synced = const drift.Value.absent(),
  })  : customerId = drift.Value(customerId),
        name = drift.Value(name);
  static drift.Insertable<Contact> custom({
    drift.Expression<int>? id,
    drift.Expression<int>? customerId,
    drift.Expression<String>? name,
    drift.Expression<String>? phone,
    drift.Expression<String>? email,
    drift.Expression<String>? note,
    drift.Expression<bool>? isMain,
    drift.Expression<bool>? deactivate,
    drift.Expression<bool>? auditFlag,
    drift.Expression<bool>? synced,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (note != null) 'note': note,
      if (isMain != null) 'is_main': isMain,
      if (deactivate != null) 'deactivate': deactivate,
      if (auditFlag != null) 'audit_flag': auditFlag,
      if (synced != null) 'synced': synced,
    });
  }

  ContactsCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<int>? customerId,
      drift.Value<String>? name,
      drift.Value<String?>? phone,
      drift.Value<String?>? email,
      drift.Value<String?>? note,
      drift.Value<bool>? isMain,
      drift.Value<bool>? deactivate,
      drift.Value<bool>? auditFlag,
      drift.Value<bool>? synced}) {
    return ContactsCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      note: note ?? this.note,
      isMain: isMain ?? this.isMain,
      deactivate: deactivate ?? this.deactivate,
      auditFlag: auditFlag ?? this.auditFlag,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = drift.Variable<int>(customerId.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = drift.Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = drift.Variable<String>(email.value);
    }
    if (note.present) {
      map['note'] = drift.Variable<String>(note.value);
    }
    if (isMain.present) {
      map['is_main'] = drift.Variable<bool>(isMain.value);
    }
    if (deactivate.present) {
      map['deactivate'] = drift.Variable<bool>(deactivate.value);
    }
    if (auditFlag.present) {
      map['audit_flag'] = drift.Variable<bool>(auditFlag.value);
    }
    if (synced.present) {
      map['synced'] = drift.Variable<bool>(synced.value);
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
          ..write('note: $note, ')
          ..write('isMain: $isMain, ')
          ..write('deactivate: $deactivate, ')
          ..write('auditFlag: $auditFlag, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $ScalesTable extends Scales with drift.TableInfo<$ScalesTable, Scale> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScalesTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _customerIdMeta =
      const drift.VerificationMeta('customerId');
  @override
  late final drift.GeneratedColumn<int> customerId = drift.GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES customers (id)'));
  static const drift.VerificationMeta _configurationMeta =
      const drift.VerificationMeta('configuration');
  @override
  late final drift.GeneratedColumn<bool> configuration =
      drift.GeneratedColumn<bool>('configuration', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("configuration" IN (0, 1))'));
  static const drift.VerificationMeta _scaleTypeMeta =
      const drift.VerificationMeta('scaleType');
  @override
  late final drift.GeneratedColumn<String> scaleType =
      drift.GeneratedColumn<String>('scale_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _indicatorMakeMeta =
      const drift.VerificationMeta('indicatorMake');
  @override
  late final drift.GeneratedColumn<String> indicatorMake =
      drift.GeneratedColumn<String>('indicator_make', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _indicatorModelMeta =
      const drift.VerificationMeta('indicatorModel');
  @override
  late final drift.GeneratedColumn<String> indicatorModel =
      drift.GeneratedColumn<String>('indicator_model', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _indicatorSerialMeta =
      const drift.VerificationMeta('indicatorSerial');
  @override
  late final drift.GeneratedColumn<String> indicatorSerial =
      drift.GeneratedColumn<String>('indicator_serial', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _approvalPrefixMeta =
      const drift.VerificationMeta('approvalPrefix');
  @override
  late final drift.GeneratedColumn<String> approvalPrefix =
      drift.GeneratedColumn<String>('approval_prefix', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _approvalNumberMeta =
      const drift.VerificationMeta('approvalNumber');
  @override
  late final drift.GeneratedColumn<String> approvalNumber =
      drift.GeneratedColumn<String>('approval_number', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _baseMakeMeta =
      const drift.VerificationMeta('baseMake');
  @override
  late final drift.GeneratedColumn<String> baseMake =
      drift.GeneratedColumn<String>('base_make', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _baseModelMeta =
      const drift.VerificationMeta('baseModel');
  @override
  late final drift.GeneratedColumn<String> baseModel =
      drift.GeneratedColumn<String>('base_model', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _baseSerialMeta =
      const drift.VerificationMeta('baseSerial');
  @override
  late final drift.GeneratedColumn<String> baseSerial =
      drift.GeneratedColumn<String>('base_serial', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _baseApprovalPrefixMeta =
      const drift.VerificationMeta('baseApprovalPrefix');
  @override
  late final drift.GeneratedColumn<String> baseApprovalPrefix =
      drift.GeneratedColumn<String>('base_approval_prefix', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _baseApprovalNumberMeta =
      const drift.VerificationMeta('baseApprovalNumber');
  @override
  late final drift.GeneratedColumn<String> baseApprovalNumber =
      drift.GeneratedColumn<String>('base_approval_number', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _capacityMeta =
      const drift.VerificationMeta('capacity');
  @override
  late final drift.GeneratedColumn<double> capacity =
      drift.GeneratedColumn<double>('capacity', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const drift.VerificationMeta _capacityUnitMeta =
      const drift.VerificationMeta('capacityUnit');
  @override
  late final drift.GeneratedColumn<String> capacityUnit =
      drift.GeneratedColumn<String>('capacity_unit', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _divisionMeta =
      const drift.VerificationMeta('division');
  @override
  late final drift.GeneratedColumn<double> division =
      drift.GeneratedColumn<double>('division', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const drift.VerificationMeta _numberOfLoadCellsMeta =
      const drift.VerificationMeta('numberOfLoadCells');
  @override
  late final drift.GeneratedColumn<int> numberOfLoadCells =
      drift.GeneratedColumn<int>('number_of_load_cells', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _numberOfSectionsMeta =
      const drift.VerificationMeta('numberOfSections');
  @override
  late final drift.GeneratedColumn<int> numberOfSections =
      drift.GeneratedColumn<int>('number_of_sections', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _loadCellModelMeta =
      const drift.VerificationMeta('loadCellModel');
  @override
  late final drift.GeneratedColumn<String> loadCellModel =
      drift.GeneratedColumn<String>('load_cell_model', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _loadCellCapacityMeta =
      const drift.VerificationMeta('loadCellCapacity');
  @override
  late final drift.GeneratedColumn<double> loadCellCapacity =
      drift.GeneratedColumn<double>('load_cell_capacity', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const drift.VerificationMeta _loadCellCapacityUnitMeta =
      const drift.VerificationMeta('loadCellCapacityUnit');
  @override
  late final drift.GeneratedColumn<String> loadCellCapacityUnit =
      drift.GeneratedColumn<String>(
          'load_cell_capacity_unit', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _notesMeta =
      const drift.VerificationMeta('notes');
  @override
  late final drift.GeneratedColumn<String> notes =
      drift.GeneratedColumn<String>('notes', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _deactivateMeta =
      const drift.VerificationMeta('deactivate');
  @override
  late final drift.GeneratedColumn<bool> deactivate =
      drift.GeneratedColumn<bool>('deactivate', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("deactivate" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _auditFlagMeta =
      const drift.VerificationMeta('auditFlag');
  @override
  late final drift.GeneratedColumn<bool> auditFlag =
      drift.GeneratedColumn<bool>('audit_flag', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("audit_flag" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _syncedMeta =
      const drift.VerificationMeta('synced');
  @override
  late final drift.GeneratedColumn<bool> synced = drift.GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  @override
  List<drift.GeneratedColumn> get $columns => [
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
  drift.VerificationContext validateIntegrity(drift.Insertable<Scale> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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

class Scale extends drift.DataClass implements drift.Insertable<Scale> {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['customer_id'] = drift.Variable<int>(customerId);
    map['configuration'] = drift.Variable<bool>(configuration);
    map['scale_type'] = drift.Variable<String>(scaleType);
    map['indicator_make'] = drift.Variable<String>(indicatorMake);
    map['indicator_model'] = drift.Variable<String>(indicatorModel);
    map['indicator_serial'] = drift.Variable<String>(indicatorSerial);
    map['approval_prefix'] = drift.Variable<String>(approvalPrefix);
    map['approval_number'] = drift.Variable<String>(approvalNumber);
    if (!nullToAbsent || baseMake != null) {
      map['base_make'] = drift.Variable<String>(baseMake);
    }
    if (!nullToAbsent || baseModel != null) {
      map['base_model'] = drift.Variable<String>(baseModel);
    }
    if (!nullToAbsent || baseSerial != null) {
      map['base_serial'] = drift.Variable<String>(baseSerial);
    }
    if (!nullToAbsent || baseApprovalPrefix != null) {
      map['base_approval_prefix'] = drift.Variable<String>(baseApprovalPrefix);
    }
    if (!nullToAbsent || baseApprovalNumber != null) {
      map['base_approval_number'] = drift.Variable<String>(baseApprovalNumber);
    }
    map['capacity'] = drift.Variable<double>(capacity);
    map['capacity_unit'] = drift.Variable<String>(capacityUnit);
    map['division'] = drift.Variable<double>(division);
    map['number_of_load_cells'] = drift.Variable<int>(numberOfLoadCells);
    map['number_of_sections'] = drift.Variable<int>(numberOfSections);
    map['load_cell_model'] = drift.Variable<String>(loadCellModel);
    map['load_cell_capacity'] = drift.Variable<double>(loadCellCapacity);
    map['load_cell_capacity_unit'] =
        drift.Variable<String>(loadCellCapacityUnit);
    if (!nullToAbsent || notes != null) {
      map['notes'] = drift.Variable<String>(notes);
    }
    map['deactivate'] = drift.Variable<bool>(deactivate);
    map['audit_flag'] = drift.Variable<bool>(auditFlag);
    map['synced'] = drift.Variable<bool>(synced);
    return map;
  }

  ScalesCompanion toCompanion(bool nullToAbsent) {
    return ScalesCompanion(
      id: drift.Value(id),
      customerId: drift.Value(customerId),
      configuration: drift.Value(configuration),
      scaleType: drift.Value(scaleType),
      indicatorMake: drift.Value(indicatorMake),
      indicatorModel: drift.Value(indicatorModel),
      indicatorSerial: drift.Value(indicatorSerial),
      approvalPrefix: drift.Value(approvalPrefix),
      approvalNumber: drift.Value(approvalNumber),
      baseMake: baseMake == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(baseMake),
      baseModel: baseModel == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(baseModel),
      baseSerial: baseSerial == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(baseSerial),
      baseApprovalPrefix: baseApprovalPrefix == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(baseApprovalPrefix),
      baseApprovalNumber: baseApprovalNumber == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(baseApprovalNumber),
      capacity: drift.Value(capacity),
      capacityUnit: drift.Value(capacityUnit),
      division: drift.Value(division),
      numberOfLoadCells: drift.Value(numberOfLoadCells),
      numberOfSections: drift.Value(numberOfSections),
      loadCellModel: drift.Value(loadCellModel),
      loadCellCapacity: drift.Value(loadCellCapacity),
      loadCellCapacityUnit: drift.Value(loadCellCapacityUnit),
      notes: notes == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(notes),
      deactivate: drift.Value(deactivate),
      auditFlag: drift.Value(auditFlag),
      synced: drift.Value(synced),
    );
  }

  factory Scale.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
          drift.Value<String?> baseMake = const drift.Value.absent(),
          drift.Value<String?> baseModel = const drift.Value.absent(),
          drift.Value<String?> baseSerial = const drift.Value.absent(),
          drift.Value<String?> baseApprovalPrefix = const drift.Value.absent(),
          drift.Value<String?> baseApprovalNumber = const drift.Value.absent(),
          double? capacity,
          String? capacityUnit,
          double? division,
          int? numberOfLoadCells,
          int? numberOfSections,
          String? loadCellModel,
          double? loadCellCapacity,
          String? loadCellCapacityUnit,
          drift.Value<String?> notes = const drift.Value.absent(),
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

class ScalesCompanion extends drift.UpdateCompanion<Scale> {
  final drift.Value<int> id;
  final drift.Value<int> customerId;
  final drift.Value<bool> configuration;
  final drift.Value<String> scaleType;
  final drift.Value<String> indicatorMake;
  final drift.Value<String> indicatorModel;
  final drift.Value<String> indicatorSerial;
  final drift.Value<String> approvalPrefix;
  final drift.Value<String> approvalNumber;
  final drift.Value<String?> baseMake;
  final drift.Value<String?> baseModel;
  final drift.Value<String?> baseSerial;
  final drift.Value<String?> baseApprovalPrefix;
  final drift.Value<String?> baseApprovalNumber;
  final drift.Value<double> capacity;
  final drift.Value<String> capacityUnit;
  final drift.Value<double> division;
  final drift.Value<int> numberOfLoadCells;
  final drift.Value<int> numberOfSections;
  final drift.Value<String> loadCellModel;
  final drift.Value<double> loadCellCapacity;
  final drift.Value<String> loadCellCapacityUnit;
  final drift.Value<String?> notes;
  final drift.Value<bool> deactivate;
  final drift.Value<bool> auditFlag;
  final drift.Value<bool> synced;
  const ScalesCompanion({
    this.id = const drift.Value.absent(),
    this.customerId = const drift.Value.absent(),
    this.configuration = const drift.Value.absent(),
    this.scaleType = const drift.Value.absent(),
    this.indicatorMake = const drift.Value.absent(),
    this.indicatorModel = const drift.Value.absent(),
    this.indicatorSerial = const drift.Value.absent(),
    this.approvalPrefix = const drift.Value.absent(),
    this.approvalNumber = const drift.Value.absent(),
    this.baseMake = const drift.Value.absent(),
    this.baseModel = const drift.Value.absent(),
    this.baseSerial = const drift.Value.absent(),
    this.baseApprovalPrefix = const drift.Value.absent(),
    this.baseApprovalNumber = const drift.Value.absent(),
    this.capacity = const drift.Value.absent(),
    this.capacityUnit = const drift.Value.absent(),
    this.division = const drift.Value.absent(),
    this.numberOfLoadCells = const drift.Value.absent(),
    this.numberOfSections = const drift.Value.absent(),
    this.loadCellModel = const drift.Value.absent(),
    this.loadCellCapacity = const drift.Value.absent(),
    this.loadCellCapacityUnit = const drift.Value.absent(),
    this.notes = const drift.Value.absent(),
    this.deactivate = const drift.Value.absent(),
    this.auditFlag = const drift.Value.absent(),
    this.synced = const drift.Value.absent(),
  });
  ScalesCompanion.insert({
    this.id = const drift.Value.absent(),
    required int customerId,
    required bool configuration,
    required String scaleType,
    required String indicatorMake,
    required String indicatorModel,
    required String indicatorSerial,
    required String approvalPrefix,
    required String approvalNumber,
    this.baseMake = const drift.Value.absent(),
    this.baseModel = const drift.Value.absent(),
    this.baseSerial = const drift.Value.absent(),
    this.baseApprovalPrefix = const drift.Value.absent(),
    this.baseApprovalNumber = const drift.Value.absent(),
    required double capacity,
    required String capacityUnit,
    required double division,
    required int numberOfLoadCells,
    required int numberOfSections,
    required String loadCellModel,
    required double loadCellCapacity,
    required String loadCellCapacityUnit,
    this.notes = const drift.Value.absent(),
    this.deactivate = const drift.Value.absent(),
    this.auditFlag = const drift.Value.absent(),
    this.synced = const drift.Value.absent(),
  })  : customerId = drift.Value(customerId),
        configuration = drift.Value(configuration),
        scaleType = drift.Value(scaleType),
        indicatorMake = drift.Value(indicatorMake),
        indicatorModel = drift.Value(indicatorModel),
        indicatorSerial = drift.Value(indicatorSerial),
        approvalPrefix = drift.Value(approvalPrefix),
        approvalNumber = drift.Value(approvalNumber),
        capacity = drift.Value(capacity),
        capacityUnit = drift.Value(capacityUnit),
        division = drift.Value(division),
        numberOfLoadCells = drift.Value(numberOfLoadCells),
        numberOfSections = drift.Value(numberOfSections),
        loadCellModel = drift.Value(loadCellModel),
        loadCellCapacity = drift.Value(loadCellCapacity),
        loadCellCapacityUnit = drift.Value(loadCellCapacityUnit);
  static drift.Insertable<Scale> custom({
    drift.Expression<int>? id,
    drift.Expression<int>? customerId,
    drift.Expression<bool>? configuration,
    drift.Expression<String>? scaleType,
    drift.Expression<String>? indicatorMake,
    drift.Expression<String>? indicatorModel,
    drift.Expression<String>? indicatorSerial,
    drift.Expression<String>? approvalPrefix,
    drift.Expression<String>? approvalNumber,
    drift.Expression<String>? baseMake,
    drift.Expression<String>? baseModel,
    drift.Expression<String>? baseSerial,
    drift.Expression<String>? baseApprovalPrefix,
    drift.Expression<String>? baseApprovalNumber,
    drift.Expression<double>? capacity,
    drift.Expression<String>? capacityUnit,
    drift.Expression<double>? division,
    drift.Expression<int>? numberOfLoadCells,
    drift.Expression<int>? numberOfSections,
    drift.Expression<String>? loadCellModel,
    drift.Expression<double>? loadCellCapacity,
    drift.Expression<String>? loadCellCapacityUnit,
    drift.Expression<String>? notes,
    drift.Expression<bool>? deactivate,
    drift.Expression<bool>? auditFlag,
    drift.Expression<bool>? synced,
  }) {
    return drift.RawValuesInsertable({
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
      {drift.Value<int>? id,
      drift.Value<int>? customerId,
      drift.Value<bool>? configuration,
      drift.Value<String>? scaleType,
      drift.Value<String>? indicatorMake,
      drift.Value<String>? indicatorModel,
      drift.Value<String>? indicatorSerial,
      drift.Value<String>? approvalPrefix,
      drift.Value<String>? approvalNumber,
      drift.Value<String?>? baseMake,
      drift.Value<String?>? baseModel,
      drift.Value<String?>? baseSerial,
      drift.Value<String?>? baseApprovalPrefix,
      drift.Value<String?>? baseApprovalNumber,
      drift.Value<double>? capacity,
      drift.Value<String>? capacityUnit,
      drift.Value<double>? division,
      drift.Value<int>? numberOfLoadCells,
      drift.Value<int>? numberOfSections,
      drift.Value<String>? loadCellModel,
      drift.Value<double>? loadCellCapacity,
      drift.Value<String>? loadCellCapacityUnit,
      drift.Value<String?>? notes,
      drift.Value<bool>? deactivate,
      drift.Value<bool>? auditFlag,
      drift.Value<bool>? synced}) {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = drift.Variable<int>(customerId.value);
    }
    if (configuration.present) {
      map['configuration'] = drift.Variable<bool>(configuration.value);
    }
    if (scaleType.present) {
      map['scale_type'] = drift.Variable<String>(scaleType.value);
    }
    if (indicatorMake.present) {
      map['indicator_make'] = drift.Variable<String>(indicatorMake.value);
    }
    if (indicatorModel.present) {
      map['indicator_model'] = drift.Variable<String>(indicatorModel.value);
    }
    if (indicatorSerial.present) {
      map['indicator_serial'] = drift.Variable<String>(indicatorSerial.value);
    }
    if (approvalPrefix.present) {
      map['approval_prefix'] = drift.Variable<String>(approvalPrefix.value);
    }
    if (approvalNumber.present) {
      map['approval_number'] = drift.Variable<String>(approvalNumber.value);
    }
    if (baseMake.present) {
      map['base_make'] = drift.Variable<String>(baseMake.value);
    }
    if (baseModel.present) {
      map['base_model'] = drift.Variable<String>(baseModel.value);
    }
    if (baseSerial.present) {
      map['base_serial'] = drift.Variable<String>(baseSerial.value);
    }
    if (baseApprovalPrefix.present) {
      map['base_approval_prefix'] =
          drift.Variable<String>(baseApprovalPrefix.value);
    }
    if (baseApprovalNumber.present) {
      map['base_approval_number'] =
          drift.Variable<String>(baseApprovalNumber.value);
    }
    if (capacity.present) {
      map['capacity'] = drift.Variable<double>(capacity.value);
    }
    if (capacityUnit.present) {
      map['capacity_unit'] = drift.Variable<String>(capacityUnit.value);
    }
    if (division.present) {
      map['division'] = drift.Variable<double>(division.value);
    }
    if (numberOfLoadCells.present) {
      map['number_of_load_cells'] =
          drift.Variable<int>(numberOfLoadCells.value);
    }
    if (numberOfSections.present) {
      map['number_of_sections'] = drift.Variable<int>(numberOfSections.value);
    }
    if (loadCellModel.present) {
      map['load_cell_model'] = drift.Variable<String>(loadCellModel.value);
    }
    if (loadCellCapacity.present) {
      map['load_cell_capacity'] =
          drift.Variable<double>(loadCellCapacity.value);
    }
    if (loadCellCapacityUnit.present) {
      map['load_cell_capacity_unit'] =
          drift.Variable<String>(loadCellCapacityUnit.value);
    }
    if (notes.present) {
      map['notes'] = drift.Variable<String>(notes.value);
    }
    if (deactivate.present) {
      map['deactivate'] = drift.Variable<bool>(deactivate.value);
    }
    if (auditFlag.present) {
      map['audit_flag'] = drift.Variable<bool>(auditFlag.value);
    }
    if (synced.present) {
      map['synced'] = drift.Variable<bool>(synced.value);
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

class $WorkOrdersTable extends WorkOrders
    with drift.TableInfo<$WorkOrdersTable, WorkOrder> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkOrdersTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _customerIdMeta =
      const drift.VerificationMeta('customerId');
  @override
  late final drift.GeneratedColumn<int> customerId = drift.GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES customers (id)'));
  static const drift.VerificationMeta _workOrderNumberMeta =
      const drift.VerificationMeta('workOrderNumber');
  @override
  late final drift.GeneratedColumn<String> workOrderNumber =
      drift.GeneratedColumn<String>('work_order_number', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _businessNameMeta =
      const drift.VerificationMeta('businessName');
  @override
  late final drift.GeneratedColumn<String> businessName =
      drift.GeneratedColumn<String>('business_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _billingAddressMeta =
      const drift.VerificationMeta('billingAddress');
  @override
  late final drift.GeneratedColumn<String> billingAddress =
      drift.GeneratedColumn<String>('billing_address', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _cityMeta =
      const drift.VerificationMeta('city');
  @override
  late final drift.GeneratedColumn<String> city = drift.GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _provinceMeta =
      const drift.VerificationMeta('province');
  @override
  late final drift.GeneratedColumn<String> province =
      drift.GeneratedColumn<String>('province', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _postalMeta =
      const drift.VerificationMeta('postal');
  @override
  late final drift.GeneratedColumn<String> postal =
      drift.GeneratedColumn<String>('postal', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _mainContactNameMeta =
      const drift.VerificationMeta('mainContactName');
  @override
  late final drift.GeneratedColumn<String> mainContactName =
      drift.GeneratedColumn<String>('main_contact_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _mainContactPhoneMeta =
      const drift.VerificationMeta('mainContactPhone');
  @override
  late final drift.GeneratedColumn<String> mainContactPhone =
      drift.GeneratedColumn<String>('main_contact_phone', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _mainContactEmailMeta =
      const drift.VerificationMeta('mainContactEmail');
  @override
  late final drift.GeneratedColumn<String> mainContactEmail =
      drift.GeneratedColumn<String>('main_contact_email', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _mainContactNoteMeta =
      const drift.VerificationMeta('mainContactNote');
  @override
  late final drift.GeneratedColumn<String> mainContactNote =
      drift.GeneratedColumn<String>('main_contact_note', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _gpsLocationMeta =
      const drift.VerificationMeta('gpsLocation');
  @override
  late final drift.GeneratedColumn<String> gpsLocation =
      drift.GeneratedColumn<String>('gps_location', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _customerNotesMeta =
      const drift.VerificationMeta('customerNotes');
  @override
  late final drift.GeneratedColumn<String> customerNotes =
      drift.GeneratedColumn<String>('customer_notes', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _deactivateMeta =
      const drift.VerificationMeta('deactivate');
  @override
  late final drift.GeneratedColumn<bool> deactivate =
      drift.GeneratedColumn<bool>('deactivate', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("deactivate" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _syncedMeta =
      const drift.VerificationMeta('synced');
  @override
  late final drift.GeneratedColumn<bool> synced = drift.GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        customerId,
        workOrderNumber,
        businessName,
        billingAddress,
        city,
        province,
        postal,
        mainContactName,
        mainContactPhone,
        mainContactEmail,
        mainContactNote,
        gpsLocation,
        customerNotes,
        deactivate,
        synced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_orders';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<WorkOrder> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
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
    if (data.containsKey('business_name')) {
      context.handle(
          _businessNameMeta,
          businessName.isAcceptableOrUnknown(
              data['business_name']!, _businessNameMeta));
    } else if (isInserting) {
      context.missing(_businessNameMeta);
    }
    if (data.containsKey('billing_address')) {
      context.handle(
          _billingAddressMeta,
          billingAddress.isAcceptableOrUnknown(
              data['billing_address']!, _billingAddressMeta));
    } else if (isInserting) {
      context.missing(_billingAddressMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('province')) {
      context.handle(_provinceMeta,
          province.isAcceptableOrUnknown(data['province']!, _provinceMeta));
    } else if (isInserting) {
      context.missing(_provinceMeta);
    }
    if (data.containsKey('postal')) {
      context.handle(_postalMeta,
          postal.isAcceptableOrUnknown(data['postal']!, _postalMeta));
    } else if (isInserting) {
      context.missing(_postalMeta);
    }
    if (data.containsKey('main_contact_name')) {
      context.handle(
          _mainContactNameMeta,
          mainContactName.isAcceptableOrUnknown(
              data['main_contact_name']!, _mainContactNameMeta));
    } else if (isInserting) {
      context.missing(_mainContactNameMeta);
    }
    if (data.containsKey('main_contact_phone')) {
      context.handle(
          _mainContactPhoneMeta,
          mainContactPhone.isAcceptableOrUnknown(
              data['main_contact_phone']!, _mainContactPhoneMeta));
    }
    if (data.containsKey('main_contact_email')) {
      context.handle(
          _mainContactEmailMeta,
          mainContactEmail.isAcceptableOrUnknown(
              data['main_contact_email']!, _mainContactEmailMeta));
    }
    if (data.containsKey('main_contact_note')) {
      context.handle(
          _mainContactNoteMeta,
          mainContactNote.isAcceptableOrUnknown(
              data['main_contact_note']!, _mainContactNoteMeta));
    }
    if (data.containsKey('gps_location')) {
      context.handle(
          _gpsLocationMeta,
          gpsLocation.isAcceptableOrUnknown(
              data['gps_location']!, _gpsLocationMeta));
    }
    if (data.containsKey('customer_notes')) {
      context.handle(
          _customerNotesMeta,
          customerNotes.isAcceptableOrUnknown(
              data['customer_notes']!, _customerNotesMeta));
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
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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
      businessName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}business_name'])!,
      billingAddress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}billing_address'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      province: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}province'])!,
      postal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal'])!,
      mainContactName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}main_contact_name'])!,
      mainContactPhone: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}main_contact_phone']),
      mainContactEmail: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}main_contact_email']),
      mainContactNote: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}main_contact_note']),
      gpsLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gps_location']),
      customerNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_notes']),
      deactivate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deactivate'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $WorkOrdersTable createAlias(String alias) {
    return $WorkOrdersTable(attachedDatabase, alias);
  }
}

class WorkOrder extends drift.DataClass implements drift.Insertable<WorkOrder> {
  final int id;
  final int customerId;
  final String workOrderNumber;
  final String businessName;
  final String billingAddress;
  final String city;
  final String province;
  final String postal;
  final String mainContactName;
  final String? mainContactPhone;
  final String? mainContactEmail;
  final String? mainContactNote;
  final String? gpsLocation;
  final String? customerNotes;
  final bool deactivate;
  final bool synced;
  const WorkOrder(
      {required this.id,
      required this.customerId,
      required this.workOrderNumber,
      required this.businessName,
      required this.billingAddress,
      required this.city,
      required this.province,
      required this.postal,
      required this.mainContactName,
      this.mainContactPhone,
      this.mainContactEmail,
      this.mainContactNote,
      this.gpsLocation,
      this.customerNotes,
      required this.deactivate,
      required this.synced});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['customer_id'] = drift.Variable<int>(customerId);
    map['work_order_number'] = drift.Variable<String>(workOrderNumber);
    map['business_name'] = drift.Variable<String>(businessName);
    map['billing_address'] = drift.Variable<String>(billingAddress);
    map['city'] = drift.Variable<String>(city);
    map['province'] = drift.Variable<String>(province);
    map['postal'] = drift.Variable<String>(postal);
    map['main_contact_name'] = drift.Variable<String>(mainContactName);
    if (!nullToAbsent || mainContactPhone != null) {
      map['main_contact_phone'] = drift.Variable<String>(mainContactPhone);
    }
    if (!nullToAbsent || mainContactEmail != null) {
      map['main_contact_email'] = drift.Variable<String>(mainContactEmail);
    }
    if (!nullToAbsent || mainContactNote != null) {
      map['main_contact_note'] = drift.Variable<String>(mainContactNote);
    }
    if (!nullToAbsent || gpsLocation != null) {
      map['gps_location'] = drift.Variable<String>(gpsLocation);
    }
    if (!nullToAbsent || customerNotes != null) {
      map['customer_notes'] = drift.Variable<String>(customerNotes);
    }
    map['deactivate'] = drift.Variable<bool>(deactivate);
    map['synced'] = drift.Variable<bool>(synced);
    return map;
  }

  WorkOrdersCompanion toCompanion(bool nullToAbsent) {
    return WorkOrdersCompanion(
      id: drift.Value(id),
      customerId: drift.Value(customerId),
      workOrderNumber: drift.Value(workOrderNumber),
      businessName: drift.Value(businessName),
      billingAddress: drift.Value(billingAddress),
      city: drift.Value(city),
      province: drift.Value(province),
      postal: drift.Value(postal),
      mainContactName: drift.Value(mainContactName),
      mainContactPhone: mainContactPhone == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(mainContactPhone),
      mainContactEmail: mainContactEmail == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(mainContactEmail),
      mainContactNote: mainContactNote == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(mainContactNote),
      gpsLocation: gpsLocation == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(gpsLocation),
      customerNotes: customerNotes == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(customerNotes),
      deactivate: drift.Value(deactivate),
      synced: drift.Value(synced),
    );
  }

  factory WorkOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return WorkOrder(
      id: serializer.fromJson<int>(json['id']),
      customerId: serializer.fromJson<int>(json['customerId']),
      workOrderNumber: serializer.fromJson<String>(json['workOrderNumber']),
      businessName: serializer.fromJson<String>(json['businessName']),
      billingAddress: serializer.fromJson<String>(json['billingAddress']),
      city: serializer.fromJson<String>(json['city']),
      province: serializer.fromJson<String>(json['province']),
      postal: serializer.fromJson<String>(json['postal']),
      mainContactName: serializer.fromJson<String>(json['mainContactName']),
      mainContactPhone: serializer.fromJson<String?>(json['mainContactPhone']),
      mainContactEmail: serializer.fromJson<String?>(json['mainContactEmail']),
      mainContactNote: serializer.fromJson<String?>(json['mainContactNote']),
      gpsLocation: serializer.fromJson<String?>(json['gpsLocation']),
      customerNotes: serializer.fromJson<String?>(json['customerNotes']),
      deactivate: serializer.fromJson<bool>(json['deactivate']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerId': serializer.toJson<int>(customerId),
      'workOrderNumber': serializer.toJson<String>(workOrderNumber),
      'businessName': serializer.toJson<String>(businessName),
      'billingAddress': serializer.toJson<String>(billingAddress),
      'city': serializer.toJson<String>(city),
      'province': serializer.toJson<String>(province),
      'postal': serializer.toJson<String>(postal),
      'mainContactName': serializer.toJson<String>(mainContactName),
      'mainContactPhone': serializer.toJson<String?>(mainContactPhone),
      'mainContactEmail': serializer.toJson<String?>(mainContactEmail),
      'mainContactNote': serializer.toJson<String?>(mainContactNote),
      'gpsLocation': serializer.toJson<String?>(gpsLocation),
      'customerNotes': serializer.toJson<String?>(customerNotes),
      'deactivate': serializer.toJson<bool>(deactivate),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  WorkOrder copyWith(
          {int? id,
          int? customerId,
          String? workOrderNumber,
          String? businessName,
          String? billingAddress,
          String? city,
          String? province,
          String? postal,
          String? mainContactName,
          drift.Value<String?> mainContactPhone = const drift.Value.absent(),
          drift.Value<String?> mainContactEmail = const drift.Value.absent(),
          drift.Value<String?> mainContactNote = const drift.Value.absent(),
          drift.Value<String?> gpsLocation = const drift.Value.absent(),
          drift.Value<String?> customerNotes = const drift.Value.absent(),
          bool? deactivate,
          bool? synced}) =>
      WorkOrder(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        workOrderNumber: workOrderNumber ?? this.workOrderNumber,
        businessName: businessName ?? this.businessName,
        billingAddress: billingAddress ?? this.billingAddress,
        city: city ?? this.city,
        province: province ?? this.province,
        postal: postal ?? this.postal,
        mainContactName: mainContactName ?? this.mainContactName,
        mainContactPhone: mainContactPhone.present
            ? mainContactPhone.value
            : this.mainContactPhone,
        mainContactEmail: mainContactEmail.present
            ? mainContactEmail.value
            : this.mainContactEmail,
        mainContactNote: mainContactNote.present
            ? mainContactNote.value
            : this.mainContactNote,
        gpsLocation: gpsLocation.present ? gpsLocation.value : this.gpsLocation,
        customerNotes:
            customerNotes.present ? customerNotes.value : this.customerNotes,
        deactivate: deactivate ?? this.deactivate,
        synced: synced ?? this.synced,
      );
  WorkOrder copyWithCompanion(WorkOrdersCompanion data) {
    return WorkOrder(
      id: data.id.present ? data.id.value : this.id,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      workOrderNumber: data.workOrderNumber.present
          ? data.workOrderNumber.value
          : this.workOrderNumber,
      businessName: data.businessName.present
          ? data.businessName.value
          : this.businessName,
      billingAddress: data.billingAddress.present
          ? data.billingAddress.value
          : this.billingAddress,
      city: data.city.present ? data.city.value : this.city,
      province: data.province.present ? data.province.value : this.province,
      postal: data.postal.present ? data.postal.value : this.postal,
      mainContactName: data.mainContactName.present
          ? data.mainContactName.value
          : this.mainContactName,
      mainContactPhone: data.mainContactPhone.present
          ? data.mainContactPhone.value
          : this.mainContactPhone,
      mainContactEmail: data.mainContactEmail.present
          ? data.mainContactEmail.value
          : this.mainContactEmail,
      mainContactNote: data.mainContactNote.present
          ? data.mainContactNote.value
          : this.mainContactNote,
      gpsLocation:
          data.gpsLocation.present ? data.gpsLocation.value : this.gpsLocation,
      customerNotes: data.customerNotes.present
          ? data.customerNotes.value
          : this.customerNotes,
      deactivate:
          data.deactivate.present ? data.deactivate.value : this.deactivate,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkOrder(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('workOrderNumber: $workOrderNumber, ')
          ..write('businessName: $businessName, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('city: $city, ')
          ..write('province: $province, ')
          ..write('postal: $postal, ')
          ..write('mainContactName: $mainContactName, ')
          ..write('mainContactPhone: $mainContactPhone, ')
          ..write('mainContactEmail: $mainContactEmail, ')
          ..write('mainContactNote: $mainContactNote, ')
          ..write('gpsLocation: $gpsLocation, ')
          ..write('customerNotes: $customerNotes, ')
          ..write('deactivate: $deactivate, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      customerId,
      workOrderNumber,
      businessName,
      billingAddress,
      city,
      province,
      postal,
      mainContactName,
      mainContactPhone,
      mainContactEmail,
      mainContactNote,
      gpsLocation,
      customerNotes,
      deactivate,
      synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkOrder &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.workOrderNumber == this.workOrderNumber &&
          other.businessName == this.businessName &&
          other.billingAddress == this.billingAddress &&
          other.city == this.city &&
          other.province == this.province &&
          other.postal == this.postal &&
          other.mainContactName == this.mainContactName &&
          other.mainContactPhone == this.mainContactPhone &&
          other.mainContactEmail == this.mainContactEmail &&
          other.mainContactNote == this.mainContactNote &&
          other.gpsLocation == this.gpsLocation &&
          other.customerNotes == this.customerNotes &&
          other.deactivate == this.deactivate &&
          other.synced == this.synced);
}

class WorkOrdersCompanion extends drift.UpdateCompanion<WorkOrder> {
  final drift.Value<int> id;
  final drift.Value<int> customerId;
  final drift.Value<String> workOrderNumber;
  final drift.Value<String> businessName;
  final drift.Value<String> billingAddress;
  final drift.Value<String> city;
  final drift.Value<String> province;
  final drift.Value<String> postal;
  final drift.Value<String> mainContactName;
  final drift.Value<String?> mainContactPhone;
  final drift.Value<String?> mainContactEmail;
  final drift.Value<String?> mainContactNote;
  final drift.Value<String?> gpsLocation;
  final drift.Value<String?> customerNotes;
  final drift.Value<bool> deactivate;
  final drift.Value<bool> synced;
  const WorkOrdersCompanion({
    this.id = const drift.Value.absent(),
    this.customerId = const drift.Value.absent(),
    this.workOrderNumber = const drift.Value.absent(),
    this.businessName = const drift.Value.absent(),
    this.billingAddress = const drift.Value.absent(),
    this.city = const drift.Value.absent(),
    this.province = const drift.Value.absent(),
    this.postal = const drift.Value.absent(),
    this.mainContactName = const drift.Value.absent(),
    this.mainContactPhone = const drift.Value.absent(),
    this.mainContactEmail = const drift.Value.absent(),
    this.mainContactNote = const drift.Value.absent(),
    this.gpsLocation = const drift.Value.absent(),
    this.customerNotes = const drift.Value.absent(),
    this.deactivate = const drift.Value.absent(),
    this.synced = const drift.Value.absent(),
  });
  WorkOrdersCompanion.insert({
    this.id = const drift.Value.absent(),
    required int customerId,
    required String workOrderNumber,
    required String businessName,
    required String billingAddress,
    required String city,
    required String province,
    required String postal,
    required String mainContactName,
    this.mainContactPhone = const drift.Value.absent(),
    this.mainContactEmail = const drift.Value.absent(),
    this.mainContactNote = const drift.Value.absent(),
    this.gpsLocation = const drift.Value.absent(),
    this.customerNotes = const drift.Value.absent(),
    this.deactivate = const drift.Value.absent(),
    this.synced = const drift.Value.absent(),
  })  : customerId = drift.Value(customerId),
        workOrderNumber = drift.Value(workOrderNumber),
        businessName = drift.Value(businessName),
        billingAddress = drift.Value(billingAddress),
        city = drift.Value(city),
        province = drift.Value(province),
        postal = drift.Value(postal),
        mainContactName = drift.Value(mainContactName);
  static drift.Insertable<WorkOrder> custom({
    drift.Expression<int>? id,
    drift.Expression<int>? customerId,
    drift.Expression<String>? workOrderNumber,
    drift.Expression<String>? businessName,
    drift.Expression<String>? billingAddress,
    drift.Expression<String>? city,
    drift.Expression<String>? province,
    drift.Expression<String>? postal,
    drift.Expression<String>? mainContactName,
    drift.Expression<String>? mainContactPhone,
    drift.Expression<String>? mainContactEmail,
    drift.Expression<String>? mainContactNote,
    drift.Expression<String>? gpsLocation,
    drift.Expression<String>? customerNotes,
    drift.Expression<bool>? deactivate,
    drift.Expression<bool>? synced,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (workOrderNumber != null) 'work_order_number': workOrderNumber,
      if (businessName != null) 'business_name': businessName,
      if (billingAddress != null) 'billing_address': billingAddress,
      if (city != null) 'city': city,
      if (province != null) 'province': province,
      if (postal != null) 'postal': postal,
      if (mainContactName != null) 'main_contact_name': mainContactName,
      if (mainContactPhone != null) 'main_contact_phone': mainContactPhone,
      if (mainContactEmail != null) 'main_contact_email': mainContactEmail,
      if (mainContactNote != null) 'main_contact_note': mainContactNote,
      if (gpsLocation != null) 'gps_location': gpsLocation,
      if (customerNotes != null) 'customer_notes': customerNotes,
      if (deactivate != null) 'deactivate': deactivate,
      if (synced != null) 'synced': synced,
    });
  }

  WorkOrdersCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<int>? customerId,
      drift.Value<String>? workOrderNumber,
      drift.Value<String>? businessName,
      drift.Value<String>? billingAddress,
      drift.Value<String>? city,
      drift.Value<String>? province,
      drift.Value<String>? postal,
      drift.Value<String>? mainContactName,
      drift.Value<String?>? mainContactPhone,
      drift.Value<String?>? mainContactEmail,
      drift.Value<String?>? mainContactNote,
      drift.Value<String?>? gpsLocation,
      drift.Value<String?>? customerNotes,
      drift.Value<bool>? deactivate,
      drift.Value<bool>? synced}) {
    return WorkOrdersCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      workOrderNumber: workOrderNumber ?? this.workOrderNumber,
      businessName: businessName ?? this.businessName,
      billingAddress: billingAddress ?? this.billingAddress,
      city: city ?? this.city,
      province: province ?? this.province,
      postal: postal ?? this.postal,
      mainContactName: mainContactName ?? this.mainContactName,
      mainContactPhone: mainContactPhone ?? this.mainContactPhone,
      mainContactEmail: mainContactEmail ?? this.mainContactEmail,
      mainContactNote: mainContactNote ?? this.mainContactNote,
      gpsLocation: gpsLocation ?? this.gpsLocation,
      customerNotes: customerNotes ?? this.customerNotes,
      deactivate: deactivate ?? this.deactivate,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = drift.Variable<int>(customerId.value);
    }
    if (workOrderNumber.present) {
      map['work_order_number'] = drift.Variable<String>(workOrderNumber.value);
    }
    if (businessName.present) {
      map['business_name'] = drift.Variable<String>(businessName.value);
    }
    if (billingAddress.present) {
      map['billing_address'] = drift.Variable<String>(billingAddress.value);
    }
    if (city.present) {
      map['city'] = drift.Variable<String>(city.value);
    }
    if (province.present) {
      map['province'] = drift.Variable<String>(province.value);
    }
    if (postal.present) {
      map['postal'] = drift.Variable<String>(postal.value);
    }
    if (mainContactName.present) {
      map['main_contact_name'] = drift.Variable<String>(mainContactName.value);
    }
    if (mainContactPhone.present) {
      map['main_contact_phone'] =
          drift.Variable<String>(mainContactPhone.value);
    }
    if (mainContactEmail.present) {
      map['main_contact_email'] =
          drift.Variable<String>(mainContactEmail.value);
    }
    if (mainContactNote.present) {
      map['main_contact_note'] = drift.Variable<String>(mainContactNote.value);
    }
    if (gpsLocation.present) {
      map['gps_location'] = drift.Variable<String>(gpsLocation.value);
    }
    if (customerNotes.present) {
      map['customer_notes'] = drift.Variable<String>(customerNotes.value);
    }
    if (deactivate.present) {
      map['deactivate'] = drift.Variable<bool>(deactivate.value);
    }
    if (synced.present) {
      map['synced'] = drift.Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkOrdersCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('workOrderNumber: $workOrderNumber, ')
          ..write('businessName: $businessName, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('city: $city, ')
          ..write('province: $province, ')
          ..write('postal: $postal, ')
          ..write('mainContactName: $mainContactName, ')
          ..write('mainContactPhone: $mainContactPhone, ')
          ..write('mainContactEmail: $mainContactEmail, ')
          ..write('mainContactNote: $mainContactNote, ')
          ..write('gpsLocation: $gpsLocation, ')
          ..write('customerNotes: $customerNotes, ')
          ..write('deactivate: $deactivate, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $ServiceReportsTable extends ServiceReports
    with drift.TableInfo<$ServiceReportsTable, ServiceReport> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceReportsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _workOrderIdMeta =
      const drift.VerificationMeta('workOrderId');
  @override
  late final drift.GeneratedColumn<int> workOrderId =
      drift.GeneratedColumn<int>('work_order_id', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES work_orders (id)'));
  static const drift.VerificationMeta _scaleIdMeta =
      const drift.VerificationMeta('scaleId');
  @override
  late final drift.GeneratedColumn<int> scaleId = drift.GeneratedColumn<int>(
      'scale_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES scales (id)'));
  static const drift.VerificationMeta _reportTypeMeta =
      const drift.VerificationMeta('reportType');
  @override
  late final drift.GeneratedColumn<String> reportType =
      drift.GeneratedColumn<String>('report_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _notesMeta =
      const drift.VerificationMeta('notes');
  @override
  late final drift.GeneratedColumn<String> notes =
      drift.GeneratedColumn<String>('notes', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  static const drift.VerificationMeta _completeMeta =
      const drift.VerificationMeta('complete');
  @override
  late final drift.GeneratedColumn<bool> complete = drift.GeneratedColumn<bool>(
      'complete', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("complete" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _syncedMeta =
      const drift.VerificationMeta('synced');
  @override
  late final drift.GeneratedColumn<bool> synced = drift.GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  @override
  List<drift.GeneratedColumn> get $columns => [
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
  drift.VerificationContext validateIntegrity(
      drift.Insertable<ServiceReport> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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

class ServiceReport extends drift.DataClass
    implements drift.Insertable<ServiceReport> {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['work_order_id'] = drift.Variable<int>(workOrderId);
    map['scale_id'] = drift.Variable<int>(scaleId);
    map['report_type'] = drift.Variable<String>(reportType);
    if (!nullToAbsent || notes != null) {
      map['notes'] = drift.Variable<String>(notes);
    }
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    map['complete'] = drift.Variable<bool>(complete);
    map['synced'] = drift.Variable<bool>(synced);
    return map;
  }

  ServiceReportsCompanion toCompanion(bool nullToAbsent) {
    return ServiceReportsCompanion(
      id: drift.Value(id),
      workOrderId: drift.Value(workOrderId),
      scaleId: drift.Value(scaleId),
      reportType: drift.Value(reportType),
      notes: notes == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(notes),
      createdAt: drift.Value(createdAt),
      complete: drift.Value(complete),
      synced: drift.Value(synced),
    );
  }

  factory ServiceReport.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
          drift.Value<String?> notes = const drift.Value.absent(),
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

class ServiceReportsCompanion extends drift.UpdateCompanion<ServiceReport> {
  final drift.Value<int> id;
  final drift.Value<int> workOrderId;
  final drift.Value<int> scaleId;
  final drift.Value<String> reportType;
  final drift.Value<String?> notes;
  final drift.Value<DateTime> createdAt;
  final drift.Value<bool> complete;
  final drift.Value<bool> synced;
  const ServiceReportsCompanion({
    this.id = const drift.Value.absent(),
    this.workOrderId = const drift.Value.absent(),
    this.scaleId = const drift.Value.absent(),
    this.reportType = const drift.Value.absent(),
    this.notes = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.complete = const drift.Value.absent(),
    this.synced = const drift.Value.absent(),
  });
  ServiceReportsCompanion.insert({
    this.id = const drift.Value.absent(),
    required int workOrderId,
    required int scaleId,
    required String reportType,
    this.notes = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.complete = const drift.Value.absent(),
    this.synced = const drift.Value.absent(),
  })  : workOrderId = drift.Value(workOrderId),
        scaleId = drift.Value(scaleId),
        reportType = drift.Value(reportType);
  static drift.Insertable<ServiceReport> custom({
    drift.Expression<int>? id,
    drift.Expression<int>? workOrderId,
    drift.Expression<int>? scaleId,
    drift.Expression<String>? reportType,
    drift.Expression<String>? notes,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<bool>? complete,
    drift.Expression<bool>? synced,
  }) {
    return drift.RawValuesInsertable({
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
      {drift.Value<int>? id,
      drift.Value<int>? workOrderId,
      drift.Value<int>? scaleId,
      drift.Value<String>? reportType,
      drift.Value<String?>? notes,
      drift.Value<DateTime>? createdAt,
      drift.Value<bool>? complete,
      drift.Value<bool>? synced}) {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (workOrderId.present) {
      map['work_order_id'] = drift.Variable<int>(workOrderId.value);
    }
    if (scaleId.present) {
      map['scale_id'] = drift.Variable<int>(scaleId.value);
    }
    if (reportType.present) {
      map['report_type'] = drift.Variable<String>(reportType.value);
    }
    if (notes.present) {
      map['notes'] = drift.Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (complete.present) {
      map['complete'] = drift.Variable<bool>(complete.value);
    }
    if (synced.present) {
      map['synced'] = drift.Variable<bool>(synced.value);
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

abstract class _$AppDatabase extends drift.GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $ContactsTable contacts = $ContactsTable(this);
  late final $ScalesTable scales = $ScalesTable(this);
  late final $WorkOrdersTable workOrders = $WorkOrdersTable(this);
  late final $ServiceReportsTable serviceReports = $ServiceReportsTable(this);
  late final CustomerDao customerDao = CustomerDao(this as AppDatabase);
  late final ContactDao contactDao = ContactDao(this as AppDatabase);
  late final ScaleDao scaleDao = ScaleDao(this as dynamic);
  late final WorkOrderDao workOrderDao = WorkOrderDao(this as AppDatabase);
  late final ServiceReportDao serviceReportDao =
      ServiceReportDao(this as dynamic);
  @override
  Iterable<drift.TableInfo<drift.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<drift.TableInfo<drift.Table, Object?>>();
  @override
  List<drift.DatabaseSchemaEntity> get allSchemaEntities =>
      [customers, contacts, scales, workOrders, serviceReports];
}

typedef $$CustomersTableCreateCompanionBuilder = CustomersCompanion Function({
  drift.Value<int> id,
  required String name,
  required String billingAddress,
  required String city,
  required String province,
  required String postal,
  drift.Value<bool> deactivate,
  drift.Value<bool> auditFlag,
  drift.Value<bool> synced,
});
typedef $$CustomersTableUpdateCompanionBuilder = CustomersCompanion Function({
  drift.Value<int> id,
  drift.Value<String> name,
  drift.Value<String> billingAddress,
  drift.Value<String> city,
  drift.Value<String> province,
  drift.Value<String> postal,
  drift.Value<bool> deactivate,
  drift.Value<bool> auditFlag,
  drift.Value<bool> synced,
});

final class $$CustomersTableReferences
    extends drift.BaseReferences<_$AppDatabase, $CustomersTable, Customer> {
  $$CustomersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static drift.MultiTypedResultKey<$ContactsTable, List<Contact>>
      _contactsRefsTable(_$AppDatabase db) =>
          drift.MultiTypedResultKey.fromTable(db.contacts,
              aliasName: drift.$_aliasNameGenerator(
                  db.customers.id, db.contacts.customerId));

  $$ContactsTableProcessedTableManager get contactsRefs {
    final manager = $$ContactsTableTableManager($_db, $_db.contacts)
        .filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contactsRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static drift.MultiTypedResultKey<$ScalesTable, List<Scale>> _scalesRefsTable(
          _$AppDatabase db) =>
      drift.MultiTypedResultKey.fromTable(db.scales,
          aliasName: drift.$_aliasNameGenerator(
              db.customers.id, db.scales.customerId));

  $$ScalesTableProcessedTableManager get scalesRefs {
    final manager = $$ScalesTableTableManager($_db, $_db.scales)
        .filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_scalesRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static drift.MultiTypedResultKey<$WorkOrdersTable, List<WorkOrder>>
      _workOrdersRefsTable(_$AppDatabase db) =>
          drift.MultiTypedResultKey.fromTable(db.workOrders,
              aliasName: drift.$_aliasNameGenerator(
                  db.customers.id, db.workOrders.customerId));

  $$WorkOrdersTableProcessedTableManager get workOrdersRefs {
    final manager = $$WorkOrdersTableTableManager($_db, $_db.workOrders)
        .filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_workOrdersRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CustomersTableFilterComposer
    extends drift.Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get province => $composableBuilder(
      column: $table.province,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get postal => $composableBuilder(
      column: $table.postal, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get deactivate => $composableBuilder(
      column: $table.deactivate,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => drift.ColumnFilters(column));

  drift.Expression<bool> contactsRefs(
      drift.Expression<bool> Function($$ContactsTableFilterComposer f) f) {
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

  drift.Expression<bool> scalesRefs(
      drift.Expression<bool> Function($$ScalesTableFilterComposer f) f) {
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

  drift.Expression<bool> workOrdersRefs(
      drift.Expression<bool> Function($$WorkOrdersTableFilterComposer f) f) {
    final $$WorkOrdersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.workOrders,
        getReferencedColumn: (t) => t.customerId,
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
    return f(composer);
  }
}

class $$CustomersTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get province => $composableBuilder(
      column: $table.province,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get postal => $composableBuilder(
      column: $table.postal,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get deactivate => $composableBuilder(
      column: $table.deactivate,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$CustomersTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress, builder: (column) => column);

  drift.GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  drift.GeneratedColumn<String> get province =>
      $composableBuilder(column: $table.province, builder: (column) => column);

  drift.GeneratedColumn<String> get postal =>
      $composableBuilder(column: $table.postal, builder: (column) => column);

  drift.GeneratedColumn<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => column);

  drift.GeneratedColumn<bool> get auditFlag =>
      $composableBuilder(column: $table.auditFlag, builder: (column) => column);

  drift.GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  drift.Expression<T> contactsRefs<T extends Object>(
      drift.Expression<T> Function($$ContactsTableAnnotationComposer a) f) {
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

  drift.Expression<T> scalesRefs<T extends Object>(
      drift.Expression<T> Function($$ScalesTableAnnotationComposer a) f) {
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

  drift.Expression<T> workOrdersRefs<T extends Object>(
      drift.Expression<T> Function($$WorkOrdersTableAnnotationComposer a) f) {
    final $$WorkOrdersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.workOrders,
        getReferencedColumn: (t) => t.customerId,
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
    return f(composer);
  }
}

class $$CustomersTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function(
        {bool contactsRefs, bool scalesRefs, bool workOrdersRefs})> {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> name = const drift.Value.absent(),
            drift.Value<String> billingAddress = const drift.Value.absent(),
            drift.Value<String> city = const drift.Value.absent(),
            drift.Value<String> province = const drift.Value.absent(),
            drift.Value<String> postal = const drift.Value.absent(),
            drift.Value<bool> deactivate = const drift.Value.absent(),
            drift.Value<bool> auditFlag = const drift.Value.absent(),
            drift.Value<bool> synced = const drift.Value.absent(),
          }) =>
              CustomersCompanion(
            id: id,
            name: name,
            billingAddress: billingAddress,
            city: city,
            province: province,
            postal: postal,
            deactivate: deactivate,
            auditFlag: auditFlag,
            synced: synced,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String name,
            required String billingAddress,
            required String city,
            required String province,
            required String postal,
            drift.Value<bool> deactivate = const drift.Value.absent(),
            drift.Value<bool> auditFlag = const drift.Value.absent(),
            drift.Value<bool> synced = const drift.Value.absent(),
          }) =>
              CustomersCompanion.insert(
            id: id,
            name: name,
            billingAddress: billingAddress,
            city: city,
            province: province,
            postal: postal,
            deactivate: deactivate,
            auditFlag: auditFlag,
            synced: synced,
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
              workOrdersRefs = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (contactsRefs) db.contacts,
                if (scalesRefs) db.scales,
                if (workOrdersRefs) db.workOrders
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (contactsRefs)
                    await drift.$_getPrefetchedData<Customer, $CustomersTable,
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
                    await drift
                        .$_getPrefetchedData<Customer, $CustomersTable, Scale>(
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
                  if (workOrdersRefs)
                    await drift.$_getPrefetchedData<Customer, $CustomersTable,
                            WorkOrder>(
                        currentTable: table,
                        referencedTable:
                            $$CustomersTableReferences._workOrdersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CustomersTableReferences(db, table, p0)
                                .workOrdersRefs,
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

typedef $$CustomersTableProcessedTableManager = drift.ProcessedTableManager<
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
    drift.PrefetchHooks Function(
        {bool contactsRefs, bool scalesRefs, bool workOrdersRefs})>;
typedef $$ContactsTableCreateCompanionBuilder = ContactsCompanion Function({
  drift.Value<int> id,
  required int customerId,
  required String name,
  drift.Value<String?> phone,
  drift.Value<String?> email,
  drift.Value<String?> note,
  drift.Value<bool> isMain,
  drift.Value<bool> deactivate,
  drift.Value<bool> auditFlag,
  drift.Value<bool> synced,
});
typedef $$ContactsTableUpdateCompanionBuilder = ContactsCompanion Function({
  drift.Value<int> id,
  drift.Value<int> customerId,
  drift.Value<String> name,
  drift.Value<String?> phone,
  drift.Value<String?> email,
  drift.Value<String?> note,
  drift.Value<bool> isMain,
  drift.Value<bool> deactivate,
  drift.Value<bool> auditFlag,
  drift.Value<bool> synced,
});

final class $$ContactsTableReferences
    extends drift.BaseReferences<_$AppDatabase, $ContactsTable, Contact> {
  $$ContactsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias(
          drift.$_aliasNameGenerator(db.contacts.customerId, db.customers.id));

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<int>('customer_id')!;

    final manager = $$CustomersTableTableManager($_db, $_db.customers)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ContactsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ContactsTable> {
  $$ContactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get isMain => $composableBuilder(
      column: $table.isMain, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get deactivate => $composableBuilder(
      column: $table.deactivate,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => drift.ColumnFilters(column));

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
    extends drift.Composer<_$AppDatabase, $ContactsTable> {
  $$ContactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get isMain => $composableBuilder(
      column: $table.isMain,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get deactivate => $composableBuilder(
      column: $table.deactivate,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced,
      builder: (column) => drift.ColumnOrderings(column));

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
    extends drift.Composer<_$AppDatabase, $ContactsTable> {
  $$ContactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  drift.GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  drift.GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  drift.GeneratedColumn<bool> get isMain =>
      $composableBuilder(column: $table.isMain, builder: (column) => column);

  drift.GeneratedColumn<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => column);

  drift.GeneratedColumn<bool> get auditFlag =>
      $composableBuilder(column: $table.auditFlag, builder: (column) => column);

  drift.GeneratedColumn<bool> get synced =>
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
}

class $$ContactsTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function({bool customerId})> {
  $$ContactsTableTableManager(_$AppDatabase db, $ContactsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<int> customerId = const drift.Value.absent(),
            drift.Value<String> name = const drift.Value.absent(),
            drift.Value<String?> phone = const drift.Value.absent(),
            drift.Value<String?> email = const drift.Value.absent(),
            drift.Value<String?> note = const drift.Value.absent(),
            drift.Value<bool> isMain = const drift.Value.absent(),
            drift.Value<bool> deactivate = const drift.Value.absent(),
            drift.Value<bool> auditFlag = const drift.Value.absent(),
            drift.Value<bool> synced = const drift.Value.absent(),
          }) =>
              ContactsCompanion(
            id: id,
            customerId: customerId,
            name: name,
            phone: phone,
            email: email,
            note: note,
            isMain: isMain,
            deactivate: deactivate,
            auditFlag: auditFlag,
            synced: synced,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required int customerId,
            required String name,
            drift.Value<String?> phone = const drift.Value.absent(),
            drift.Value<String?> email = const drift.Value.absent(),
            drift.Value<String?> note = const drift.Value.absent(),
            drift.Value<bool> isMain = const drift.Value.absent(),
            drift.Value<bool> deactivate = const drift.Value.absent(),
            drift.Value<bool> auditFlag = const drift.Value.absent(),
            drift.Value<bool> synced = const drift.Value.absent(),
          }) =>
              ContactsCompanion.insert(
            id: id,
            customerId: customerId,
            name: name,
            phone: phone,
            email: email,
            note: note,
            isMain: isMain,
            deactivate: deactivate,
            auditFlag: auditFlag,
            synced: synced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ContactsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({customerId = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends drift.TableManagerState<
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

typedef $$ContactsTableProcessedTableManager = drift.ProcessedTableManager<
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
    drift.PrefetchHooks Function({bool customerId})>;
typedef $$ScalesTableCreateCompanionBuilder = ScalesCompanion Function({
  drift.Value<int> id,
  required int customerId,
  required bool configuration,
  required String scaleType,
  required String indicatorMake,
  required String indicatorModel,
  required String indicatorSerial,
  required String approvalPrefix,
  required String approvalNumber,
  drift.Value<String?> baseMake,
  drift.Value<String?> baseModel,
  drift.Value<String?> baseSerial,
  drift.Value<String?> baseApprovalPrefix,
  drift.Value<String?> baseApprovalNumber,
  required double capacity,
  required String capacityUnit,
  required double division,
  required int numberOfLoadCells,
  required int numberOfSections,
  required String loadCellModel,
  required double loadCellCapacity,
  required String loadCellCapacityUnit,
  drift.Value<String?> notes,
  drift.Value<bool> deactivate,
  drift.Value<bool> auditFlag,
  drift.Value<bool> synced,
});
typedef $$ScalesTableUpdateCompanionBuilder = ScalesCompanion Function({
  drift.Value<int> id,
  drift.Value<int> customerId,
  drift.Value<bool> configuration,
  drift.Value<String> scaleType,
  drift.Value<String> indicatorMake,
  drift.Value<String> indicatorModel,
  drift.Value<String> indicatorSerial,
  drift.Value<String> approvalPrefix,
  drift.Value<String> approvalNumber,
  drift.Value<String?> baseMake,
  drift.Value<String?> baseModel,
  drift.Value<String?> baseSerial,
  drift.Value<String?> baseApprovalPrefix,
  drift.Value<String?> baseApprovalNumber,
  drift.Value<double> capacity,
  drift.Value<String> capacityUnit,
  drift.Value<double> division,
  drift.Value<int> numberOfLoadCells,
  drift.Value<int> numberOfSections,
  drift.Value<String> loadCellModel,
  drift.Value<double> loadCellCapacity,
  drift.Value<String> loadCellCapacityUnit,
  drift.Value<String?> notes,
  drift.Value<bool> deactivate,
  drift.Value<bool> auditFlag,
  drift.Value<bool> synced,
});

final class $$ScalesTableReferences
    extends drift.BaseReferences<_$AppDatabase, $ScalesTable, Scale> {
  $$ScalesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias(
          drift.$_aliasNameGenerator(db.scales.customerId, db.customers.id));

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<int>('customer_id')!;

    final manager = $$CustomersTableTableManager($_db, $_db.customers)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static drift.MultiTypedResultKey<$ServiceReportsTable, List<ServiceReport>>
      _serviceReportsRefsTable(_$AppDatabase db) =>
          drift.MultiTypedResultKey.fromTable(db.serviceReports,
              aliasName: drift.$_aliasNameGenerator(
                  db.scales.id, db.serviceReports.scaleId));

  $$ServiceReportsTableProcessedTableManager get serviceReportsRefs {
    final manager = $$ServiceReportsTableTableManager($_db, $_db.serviceReports)
        .filter((f) => f.scaleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_serviceReportsRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ScalesTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ScalesTable> {
  $$ScalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get configuration => $composableBuilder(
      column: $table.configuration,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get scaleType => $composableBuilder(
      column: $table.scaleType,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get indicatorMake => $composableBuilder(
      column: $table.indicatorMake,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get indicatorModel => $composableBuilder(
      column: $table.indicatorModel,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get indicatorSerial => $composableBuilder(
      column: $table.indicatorSerial,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get approvalPrefix => $composableBuilder(
      column: $table.approvalPrefix,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get approvalNumber => $composableBuilder(
      column: $table.approvalNumber,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get baseMake => $composableBuilder(
      column: $table.baseMake,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get baseModel => $composableBuilder(
      column: $table.baseModel,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get baseSerial => $composableBuilder(
      column: $table.baseSerial,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get baseApprovalPrefix => $composableBuilder(
      column: $table.baseApprovalPrefix,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get baseApprovalNumber => $composableBuilder(
      column: $table.baseApprovalNumber,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get capacity => $composableBuilder(
      column: $table.capacity,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get capacityUnit => $composableBuilder(
      column: $table.capacityUnit,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get division => $composableBuilder(
      column: $table.division,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get numberOfLoadCells => $composableBuilder(
      column: $table.numberOfLoadCells,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get numberOfSections => $composableBuilder(
      column: $table.numberOfSections,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get loadCellModel => $composableBuilder(
      column: $table.loadCellModel,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get loadCellCapacity => $composableBuilder(
      column: $table.loadCellCapacity,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get loadCellCapacityUnit => $composableBuilder(
      column: $table.loadCellCapacityUnit,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get deactivate => $composableBuilder(
      column: $table.deactivate,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => drift.ColumnFilters(column));

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

  drift.Expression<bool> serviceReportsRefs(
      drift.Expression<bool> Function($$ServiceReportsTableFilterComposer f)
          f) {
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
    extends drift.Composer<_$AppDatabase, $ScalesTable> {
  $$ScalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get configuration => $composableBuilder(
      column: $table.configuration,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get scaleType => $composableBuilder(
      column: $table.scaleType,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get indicatorMake => $composableBuilder(
      column: $table.indicatorMake,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get indicatorModel => $composableBuilder(
      column: $table.indicatorModel,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get indicatorSerial => $composableBuilder(
      column: $table.indicatorSerial,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get approvalPrefix => $composableBuilder(
      column: $table.approvalPrefix,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get approvalNumber => $composableBuilder(
      column: $table.approvalNumber,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get baseMake => $composableBuilder(
      column: $table.baseMake,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get baseModel => $composableBuilder(
      column: $table.baseModel,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get baseSerial => $composableBuilder(
      column: $table.baseSerial,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get baseApprovalPrefix => $composableBuilder(
      column: $table.baseApprovalPrefix,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get baseApprovalNumber => $composableBuilder(
      column: $table.baseApprovalNumber,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get capacity => $composableBuilder(
      column: $table.capacity,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get capacityUnit => $composableBuilder(
      column: $table.capacityUnit,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get division => $composableBuilder(
      column: $table.division,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get numberOfLoadCells => $composableBuilder(
      column: $table.numberOfLoadCells,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get numberOfSections => $composableBuilder(
      column: $table.numberOfSections,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get loadCellModel => $composableBuilder(
      column: $table.loadCellModel,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get loadCellCapacity => $composableBuilder(
      column: $table.loadCellCapacity,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get loadCellCapacityUnit => $composableBuilder(
      column: $table.loadCellCapacityUnit,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get deactivate => $composableBuilder(
      column: $table.deactivate,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get auditFlag => $composableBuilder(
      column: $table.auditFlag,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced,
      builder: (column) => drift.ColumnOrderings(column));

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
    extends drift.Composer<_$AppDatabase, $ScalesTable> {
  $$ScalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<bool> get configuration => $composableBuilder(
      column: $table.configuration, builder: (column) => column);

  drift.GeneratedColumn<String> get scaleType =>
      $composableBuilder(column: $table.scaleType, builder: (column) => column);

  drift.GeneratedColumn<String> get indicatorMake => $composableBuilder(
      column: $table.indicatorMake, builder: (column) => column);

  drift.GeneratedColumn<String> get indicatorModel => $composableBuilder(
      column: $table.indicatorModel, builder: (column) => column);

  drift.GeneratedColumn<String> get indicatorSerial => $composableBuilder(
      column: $table.indicatorSerial, builder: (column) => column);

  drift.GeneratedColumn<String> get approvalPrefix => $composableBuilder(
      column: $table.approvalPrefix, builder: (column) => column);

  drift.GeneratedColumn<String> get approvalNumber => $composableBuilder(
      column: $table.approvalNumber, builder: (column) => column);

  drift.GeneratedColumn<String> get baseMake =>
      $composableBuilder(column: $table.baseMake, builder: (column) => column);

  drift.GeneratedColumn<String> get baseModel =>
      $composableBuilder(column: $table.baseModel, builder: (column) => column);

  drift.GeneratedColumn<String> get baseSerial => $composableBuilder(
      column: $table.baseSerial, builder: (column) => column);

  drift.GeneratedColumn<String> get baseApprovalPrefix => $composableBuilder(
      column: $table.baseApprovalPrefix, builder: (column) => column);

  drift.GeneratedColumn<String> get baseApprovalNumber => $composableBuilder(
      column: $table.baseApprovalNumber, builder: (column) => column);

  drift.GeneratedColumn<double> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  drift.GeneratedColumn<String> get capacityUnit => $composableBuilder(
      column: $table.capacityUnit, builder: (column) => column);

  drift.GeneratedColumn<double> get division =>
      $composableBuilder(column: $table.division, builder: (column) => column);

  drift.GeneratedColumn<int> get numberOfLoadCells => $composableBuilder(
      column: $table.numberOfLoadCells, builder: (column) => column);

  drift.GeneratedColumn<int> get numberOfSections => $composableBuilder(
      column: $table.numberOfSections, builder: (column) => column);

  drift.GeneratedColumn<String> get loadCellModel => $composableBuilder(
      column: $table.loadCellModel, builder: (column) => column);

  drift.GeneratedColumn<double> get loadCellCapacity => $composableBuilder(
      column: $table.loadCellCapacity, builder: (column) => column);

  drift.GeneratedColumn<String> get loadCellCapacityUnit => $composableBuilder(
      column: $table.loadCellCapacityUnit, builder: (column) => column);

  drift.GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  drift.GeneratedColumn<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => column);

  drift.GeneratedColumn<bool> get auditFlag =>
      $composableBuilder(column: $table.auditFlag, builder: (column) => column);

  drift.GeneratedColumn<bool> get synced =>
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

  drift.Expression<T> serviceReportsRefs<T extends Object>(
      drift.Expression<T> Function($$ServiceReportsTableAnnotationComposer a)
          f) {
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

class $$ScalesTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function({bool customerId, bool serviceReportsRefs})> {
  $$ScalesTableTableManager(_$AppDatabase db, $ScalesTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<int> customerId = const drift.Value.absent(),
            drift.Value<bool> configuration = const drift.Value.absent(),
            drift.Value<String> scaleType = const drift.Value.absent(),
            drift.Value<String> indicatorMake = const drift.Value.absent(),
            drift.Value<String> indicatorModel = const drift.Value.absent(),
            drift.Value<String> indicatorSerial = const drift.Value.absent(),
            drift.Value<String> approvalPrefix = const drift.Value.absent(),
            drift.Value<String> approvalNumber = const drift.Value.absent(),
            drift.Value<String?> baseMake = const drift.Value.absent(),
            drift.Value<String?> baseModel = const drift.Value.absent(),
            drift.Value<String?> baseSerial = const drift.Value.absent(),
            drift.Value<String?> baseApprovalPrefix =
                const drift.Value.absent(),
            drift.Value<String?> baseApprovalNumber =
                const drift.Value.absent(),
            drift.Value<double> capacity = const drift.Value.absent(),
            drift.Value<String> capacityUnit = const drift.Value.absent(),
            drift.Value<double> division = const drift.Value.absent(),
            drift.Value<int> numberOfLoadCells = const drift.Value.absent(),
            drift.Value<int> numberOfSections = const drift.Value.absent(),
            drift.Value<String> loadCellModel = const drift.Value.absent(),
            drift.Value<double> loadCellCapacity = const drift.Value.absent(),
            drift.Value<String> loadCellCapacityUnit =
                const drift.Value.absent(),
            drift.Value<String?> notes = const drift.Value.absent(),
            drift.Value<bool> deactivate = const drift.Value.absent(),
            drift.Value<bool> auditFlag = const drift.Value.absent(),
            drift.Value<bool> synced = const drift.Value.absent(),
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
            drift.Value<int> id = const drift.Value.absent(),
            required int customerId,
            required bool configuration,
            required String scaleType,
            required String indicatorMake,
            required String indicatorModel,
            required String indicatorSerial,
            required String approvalPrefix,
            required String approvalNumber,
            drift.Value<String?> baseMake = const drift.Value.absent(),
            drift.Value<String?> baseModel = const drift.Value.absent(),
            drift.Value<String?> baseSerial = const drift.Value.absent(),
            drift.Value<String?> baseApprovalPrefix =
                const drift.Value.absent(),
            drift.Value<String?> baseApprovalNumber =
                const drift.Value.absent(),
            required double capacity,
            required String capacityUnit,
            required double division,
            required int numberOfLoadCells,
            required int numberOfSections,
            required String loadCellModel,
            required double loadCellCapacity,
            required String loadCellCapacityUnit,
            drift.Value<String?> notes = const drift.Value.absent(),
            drift.Value<bool> deactivate = const drift.Value.absent(),
            drift.Value<bool> auditFlag = const drift.Value.absent(),
            drift.Value<bool> synced = const drift.Value.absent(),
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
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (serviceReportsRefs) db.serviceReports
              ],
              addJoins: <
                  T extends drift.TableManagerState<
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
                    await drift.$_getPrefetchedData<Scale, $ScalesTable,
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

typedef $$ScalesTableProcessedTableManager = drift.ProcessedTableManager<
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
    drift.PrefetchHooks Function({bool customerId, bool serviceReportsRefs})>;
typedef $$WorkOrdersTableCreateCompanionBuilder = WorkOrdersCompanion Function({
  drift.Value<int> id,
  required int customerId,
  required String workOrderNumber,
  required String businessName,
  required String billingAddress,
  required String city,
  required String province,
  required String postal,
  required String mainContactName,
  drift.Value<String?> mainContactPhone,
  drift.Value<String?> mainContactEmail,
  drift.Value<String?> mainContactNote,
  drift.Value<String?> gpsLocation,
  drift.Value<String?> customerNotes,
  drift.Value<bool> deactivate,
  drift.Value<bool> synced,
});
typedef $$WorkOrdersTableUpdateCompanionBuilder = WorkOrdersCompanion Function({
  drift.Value<int> id,
  drift.Value<int> customerId,
  drift.Value<String> workOrderNumber,
  drift.Value<String> businessName,
  drift.Value<String> billingAddress,
  drift.Value<String> city,
  drift.Value<String> province,
  drift.Value<String> postal,
  drift.Value<String> mainContactName,
  drift.Value<String?> mainContactPhone,
  drift.Value<String?> mainContactEmail,
  drift.Value<String?> mainContactNote,
  drift.Value<String?> gpsLocation,
  drift.Value<String?> customerNotes,
  drift.Value<bool> deactivate,
  drift.Value<bool> synced,
});

final class $$WorkOrdersTableReferences
    extends drift.BaseReferences<_$AppDatabase, $WorkOrdersTable, WorkOrder> {
  $$WorkOrdersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias(drift.$_aliasNameGenerator(
          db.workOrders.customerId, db.customers.id));

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<int>('customer_id')!;

    final manager = $$CustomersTableTableManager($_db, $_db.customers)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static drift.MultiTypedResultKey<$ServiceReportsTable, List<ServiceReport>>
      _serviceReportsRefsTable(_$AppDatabase db) =>
          drift.MultiTypedResultKey.fromTable(db.serviceReports,
              aliasName: drift.$_aliasNameGenerator(
                  db.workOrders.id, db.serviceReports.workOrderId));

  $$ServiceReportsTableProcessedTableManager get serviceReportsRefs {
    final manager = $$ServiceReportsTableTableManager($_db, $_db.serviceReports)
        .filter((f) => f.workOrderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_serviceReportsRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkOrdersTableFilterComposer
    extends drift.Composer<_$AppDatabase, $WorkOrdersTable> {
  $$WorkOrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get workOrderNumber => $composableBuilder(
      column: $table.workOrderNumber,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get businessName => $composableBuilder(
      column: $table.businessName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get province => $composableBuilder(
      column: $table.province,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get postal => $composableBuilder(
      column: $table.postal, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get mainContactName => $composableBuilder(
      column: $table.mainContactName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get mainContactPhone => $composableBuilder(
      column: $table.mainContactPhone,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get mainContactEmail => $composableBuilder(
      column: $table.mainContactEmail,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get mainContactNote => $composableBuilder(
      column: $table.mainContactNote,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get gpsLocation => $composableBuilder(
      column: $table.gpsLocation,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get customerNotes => $composableBuilder(
      column: $table.customerNotes,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get deactivate => $composableBuilder(
      column: $table.deactivate,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => drift.ColumnFilters(column));

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

  drift.Expression<bool> serviceReportsRefs(
      drift.Expression<bool> Function($$ServiceReportsTableFilterComposer f)
          f) {
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
    extends drift.Composer<_$AppDatabase, $WorkOrdersTable> {
  $$WorkOrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get workOrderNumber => $composableBuilder(
      column: $table.workOrderNumber,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get businessName => $composableBuilder(
      column: $table.businessName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get province => $composableBuilder(
      column: $table.province,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get postal => $composableBuilder(
      column: $table.postal,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get mainContactName => $composableBuilder(
      column: $table.mainContactName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get mainContactPhone => $composableBuilder(
      column: $table.mainContactPhone,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get mainContactEmail => $composableBuilder(
      column: $table.mainContactEmail,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get mainContactNote => $composableBuilder(
      column: $table.mainContactNote,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get gpsLocation => $composableBuilder(
      column: $table.gpsLocation,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get customerNotes => $composableBuilder(
      column: $table.customerNotes,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get deactivate => $composableBuilder(
      column: $table.deactivate,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced,
      builder: (column) => drift.ColumnOrderings(column));

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

class $$WorkOrdersTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $WorkOrdersTable> {
  $$WorkOrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get workOrderNumber => $composableBuilder(
      column: $table.workOrderNumber, builder: (column) => column);

  drift.GeneratedColumn<String> get businessName => $composableBuilder(
      column: $table.businessName, builder: (column) => column);

  drift.GeneratedColumn<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress, builder: (column) => column);

  drift.GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  drift.GeneratedColumn<String> get province =>
      $composableBuilder(column: $table.province, builder: (column) => column);

  drift.GeneratedColumn<String> get postal =>
      $composableBuilder(column: $table.postal, builder: (column) => column);

  drift.GeneratedColumn<String> get mainContactName => $composableBuilder(
      column: $table.mainContactName, builder: (column) => column);

  drift.GeneratedColumn<String> get mainContactPhone => $composableBuilder(
      column: $table.mainContactPhone, builder: (column) => column);

  drift.GeneratedColumn<String> get mainContactEmail => $composableBuilder(
      column: $table.mainContactEmail, builder: (column) => column);

  drift.GeneratedColumn<String> get mainContactNote => $composableBuilder(
      column: $table.mainContactNote, builder: (column) => column);

  drift.GeneratedColumn<String> get gpsLocation => $composableBuilder(
      column: $table.gpsLocation, builder: (column) => column);

  drift.GeneratedColumn<String> get customerNotes => $composableBuilder(
      column: $table.customerNotes, builder: (column) => column);

  drift.GeneratedColumn<bool> get deactivate => $composableBuilder(
      column: $table.deactivate, builder: (column) => column);

  drift.GeneratedColumn<bool> get synced =>
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

  drift.Expression<T> serviceReportsRefs<T extends Object>(
      drift.Expression<T> Function($$ServiceReportsTableAnnotationComposer a)
          f) {
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

class $$WorkOrdersTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function({bool customerId, bool serviceReportsRefs})> {
  $$WorkOrdersTableTableManager(_$AppDatabase db, $WorkOrdersTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkOrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkOrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkOrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<int> customerId = const drift.Value.absent(),
            drift.Value<String> workOrderNumber = const drift.Value.absent(),
            drift.Value<String> businessName = const drift.Value.absent(),
            drift.Value<String> billingAddress = const drift.Value.absent(),
            drift.Value<String> city = const drift.Value.absent(),
            drift.Value<String> province = const drift.Value.absent(),
            drift.Value<String> postal = const drift.Value.absent(),
            drift.Value<String> mainContactName = const drift.Value.absent(),
            drift.Value<String?> mainContactPhone = const drift.Value.absent(),
            drift.Value<String?> mainContactEmail = const drift.Value.absent(),
            drift.Value<String?> mainContactNote = const drift.Value.absent(),
            drift.Value<String?> gpsLocation = const drift.Value.absent(),
            drift.Value<String?> customerNotes = const drift.Value.absent(),
            drift.Value<bool> deactivate = const drift.Value.absent(),
            drift.Value<bool> synced = const drift.Value.absent(),
          }) =>
              WorkOrdersCompanion(
            id: id,
            customerId: customerId,
            workOrderNumber: workOrderNumber,
            businessName: businessName,
            billingAddress: billingAddress,
            city: city,
            province: province,
            postal: postal,
            mainContactName: mainContactName,
            mainContactPhone: mainContactPhone,
            mainContactEmail: mainContactEmail,
            mainContactNote: mainContactNote,
            gpsLocation: gpsLocation,
            customerNotes: customerNotes,
            deactivate: deactivate,
            synced: synced,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required int customerId,
            required String workOrderNumber,
            required String businessName,
            required String billingAddress,
            required String city,
            required String province,
            required String postal,
            required String mainContactName,
            drift.Value<String?> mainContactPhone = const drift.Value.absent(),
            drift.Value<String?> mainContactEmail = const drift.Value.absent(),
            drift.Value<String?> mainContactNote = const drift.Value.absent(),
            drift.Value<String?> gpsLocation = const drift.Value.absent(),
            drift.Value<String?> customerNotes = const drift.Value.absent(),
            drift.Value<bool> deactivate = const drift.Value.absent(),
            drift.Value<bool> synced = const drift.Value.absent(),
          }) =>
              WorkOrdersCompanion.insert(
            id: id,
            customerId: customerId,
            workOrderNumber: workOrderNumber,
            businessName: businessName,
            billingAddress: billingAddress,
            city: city,
            province: province,
            postal: postal,
            mainContactName: mainContactName,
            mainContactPhone: mainContactPhone,
            mainContactEmail: mainContactEmail,
            mainContactNote: mainContactNote,
            gpsLocation: gpsLocation,
            customerNotes: customerNotes,
            deactivate: deactivate,
            synced: synced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkOrdersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {customerId = false, serviceReportsRefs = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (serviceReportsRefs) db.serviceReports
              ],
              addJoins: <
                  T extends drift.TableManagerState<
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
                        $$WorkOrdersTableReferences._customerIdTable(db),
                    referencedColumn:
                        $$WorkOrdersTableReferences._customerIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (serviceReportsRefs)
                    await drift.$_getPrefetchedData<WorkOrder, $WorkOrdersTable,
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

typedef $$WorkOrdersTableProcessedTableManager = drift.ProcessedTableManager<
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
    drift.PrefetchHooks Function({bool customerId, bool serviceReportsRefs})>;
typedef $$ServiceReportsTableCreateCompanionBuilder = ServiceReportsCompanion
    Function({
  drift.Value<int> id,
  required int workOrderId,
  required int scaleId,
  required String reportType,
  drift.Value<String?> notes,
  drift.Value<DateTime> createdAt,
  drift.Value<bool> complete,
  drift.Value<bool> synced,
});
typedef $$ServiceReportsTableUpdateCompanionBuilder = ServiceReportsCompanion
    Function({
  drift.Value<int> id,
  drift.Value<int> workOrderId,
  drift.Value<int> scaleId,
  drift.Value<String> reportType,
  drift.Value<String?> notes,
  drift.Value<DateTime> createdAt,
  drift.Value<bool> complete,
  drift.Value<bool> synced,
});

final class $$ServiceReportsTableReferences extends drift
    .BaseReferences<_$AppDatabase, $ServiceReportsTable, ServiceReport> {
  $$ServiceReportsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkOrdersTable _workOrderIdTable(_$AppDatabase db) =>
      db.workOrders.createAlias(drift.$_aliasNameGenerator(
          db.serviceReports.workOrderId, db.workOrders.id));

  $$WorkOrdersTableProcessedTableManager get workOrderId {
    final $_column = $_itemColumn<int>('work_order_id')!;

    final manager = $$WorkOrdersTableTableManager($_db, $_db.workOrders)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workOrderIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ScalesTable _scaleIdTable(_$AppDatabase db) => db.scales.createAlias(
      drift.$_aliasNameGenerator(db.serviceReports.scaleId, db.scales.id));

  $$ScalesTableProcessedTableManager get scaleId {
    final $_column = $_itemColumn<int>('scale_id')!;

    final manager = $$ScalesTableTableManager($_db, $_db.scales)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_scaleIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ServiceReportsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ServiceReportsTable> {
  $$ServiceReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get reportType => $composableBuilder(
      column: $table.reportType,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get complete => $composableBuilder(
      column: $table.complete,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => drift.ColumnFilters(column));

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
    extends drift.Composer<_$AppDatabase, $ServiceReportsTable> {
  $$ServiceReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get reportType => $composableBuilder(
      column: $table.reportType,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get complete => $composableBuilder(
      column: $table.complete,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced,
      builder: (column) => drift.ColumnOrderings(column));

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
    extends drift.Composer<_$AppDatabase, $ServiceReportsTable> {
  $$ServiceReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => column);

  drift.GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  drift.GeneratedColumn<bool> get complete =>
      $composableBuilder(column: $table.complete, builder: (column) => column);

  drift.GeneratedColumn<bool> get synced =>
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

class $$ServiceReportsTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function({bool workOrderId, bool scaleId})> {
  $$ServiceReportsTableTableManager(
      _$AppDatabase db, $ServiceReportsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<int> workOrderId = const drift.Value.absent(),
            drift.Value<int> scaleId = const drift.Value.absent(),
            drift.Value<String> reportType = const drift.Value.absent(),
            drift.Value<String?> notes = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<bool> complete = const drift.Value.absent(),
            drift.Value<bool> synced = const drift.Value.absent(),
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
            drift.Value<int> id = const drift.Value.absent(),
            required int workOrderId,
            required int scaleId,
            required String reportType,
            drift.Value<String?> notes = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<bool> complete = const drift.Value.absent(),
            drift.Value<bool> synced = const drift.Value.absent(),
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
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends drift.TableManagerState<
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

typedef $$ServiceReportsTableProcessedTableManager
    = drift.ProcessedTableManager<
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
        drift.PrefetchHooks Function({bool workOrderId, bool scaleId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$ContactsTableTableManager get contacts =>
      $$ContactsTableTableManager(_db, _db.contacts);
  $$ScalesTableTableManager get scales =>
      $$ScalesTableTableManager(_db, _db.scales);
  $$WorkOrdersTableTableManager get workOrders =>
      $$WorkOrdersTableTableManager(_db, _db.workOrders);
  $$ServiceReportsTableTableManager get serviceReports =>
      $$ServiceReportsTableTableManager(_db, _db.serviceReports);
}
