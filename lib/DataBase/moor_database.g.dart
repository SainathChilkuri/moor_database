// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ContactTableData extends DataClass
    implements Insertable<ContactTableData> {
  final int id;
  final String fname;
  final String lname;
  final String number;
  final String address;
  ContactTableData(
      {@required this.id,
      @required this.fname,
      @required this.lname,
      @required this.number,
      @required this.address});
  factory ContactTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ContactTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      fname:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}fname']),
      lname:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}lname']),
      number:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}number']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || fname != null) {
      map['fname'] = Variable<String>(fname);
    }
    if (!nullToAbsent || lname != null) {
      map['lname'] = Variable<String>(lname);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    return map;
  }

  ContactTableCompanion toCompanion(bool nullToAbsent) {
    return ContactTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      fname:
          fname == null && nullToAbsent ? const Value.absent() : Value(fname),
      lname:
          lname == null && nullToAbsent ? const Value.absent() : Value(lname),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
    );
  }

  factory ContactTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ContactTableData(
      id: serializer.fromJson<int>(json['id']),
      fname: serializer.fromJson<String>(json['fname']),
      lname: serializer.fromJson<String>(json['lname']),
      number: serializer.fromJson<String>(json['number']),
      address: serializer.fromJson<String>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fname': serializer.toJson<String>(fname),
      'lname': serializer.toJson<String>(lname),
      'number': serializer.toJson<String>(number),
      'address': serializer.toJson<String>(address),
    };
  }

  ContactTableData copyWith(
          {int id,
          String fname,
          String lname,
          String number,
          String address}) =>
      ContactTableData(
        id: id ?? this.id,
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        number: number ?? this.number,
        address: address ?? this.address,
      );
  @override
  String toString() {
    return (StringBuffer('ContactTableData(')
          ..write('id: $id, ')
          ..write('fname: $fname, ')
          ..write('lname: $lname, ')
          ..write('number: $number, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(fname.hashCode,
          $mrjc(lname.hashCode, $mrjc(number.hashCode, address.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ContactTableData &&
          other.id == this.id &&
          other.fname == this.fname &&
          other.lname == this.lname &&
          other.number == this.number &&
          other.address == this.address);
}

class ContactTableCompanion extends UpdateCompanion<ContactTableData> {
  final Value<int> id;
  final Value<String> fname;
  final Value<String> lname;
  final Value<String> number;
  final Value<String> address;
  const ContactTableCompanion({
    this.id = const Value.absent(),
    this.fname = const Value.absent(),
    this.lname = const Value.absent(),
    this.number = const Value.absent(),
    this.address = const Value.absent(),
  });
  ContactTableCompanion.insert({
    this.id = const Value.absent(),
    @required String fname,
    @required String lname,
    @required String number,
    @required String address,
  })  : fname = Value(fname),
        lname = Value(lname),
        number = Value(number),
        address = Value(address);
  static Insertable<ContactTableData> custom({
    Expression<int> id,
    Expression<String> fname,
    Expression<String> lname,
    Expression<String> number,
    Expression<String> address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fname != null) 'fname': fname,
      if (lname != null) 'lname': lname,
      if (number != null) 'number': number,
      if (address != null) 'address': address,
    });
  }

  ContactTableCompanion copyWith(
      {Value<int> id,
      Value<String> fname,
      Value<String> lname,
      Value<String> number,
      Value<String> address}) {
    return ContactTableCompanion(
      id: id ?? this.id,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      number: number ?? this.number,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fname.present) {
      map['fname'] = Variable<String>(fname.value);
    }
    if (lname.present) {
      map['lname'] = Variable<String>(lname.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactTableCompanion(')
          ..write('id: $id, ')
          ..write('fname: $fname, ')
          ..write('lname: $lname, ')
          ..write('number: $number, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $ContactTableTable extends ContactTable
    with TableInfo<$ContactTableTable, ContactTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ContactTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _fnameMeta = const VerificationMeta('fname');
  GeneratedTextColumn _fname;
  @override
  GeneratedTextColumn get fname => _fname ??= _constructFname();
  GeneratedTextColumn _constructFname() {
    return GeneratedTextColumn('fname', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _lnameMeta = const VerificationMeta('lname');
  GeneratedTextColumn _lname;
  @override
  GeneratedTextColumn get lname => _lname ??= _constructLname();
  GeneratedTextColumn _constructLname() {
    return GeneratedTextColumn('lname', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  GeneratedTextColumn _number;
  @override
  GeneratedTextColumn get number => _number ??= _constructNumber();
  GeneratedTextColumn _constructNumber() {
    return GeneratedTextColumn('number', $tableName, false,
        minTextLength: 1, maxTextLength: 10);
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn('address', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  @override
  List<GeneratedColumn> get $columns => [id, fname, lname, number, address];
  @override
  $ContactTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'contact_table';
  @override
  final String actualTableName = 'contact_table';
  @override
  VerificationContext validateIntegrity(Insertable<ContactTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('fname')) {
      context.handle(
          _fnameMeta, fname.isAcceptableOrUnknown(data['fname'], _fnameMeta));
    } else if (isInserting) {
      context.missing(_fnameMeta);
    }
    if (data.containsKey('lname')) {
      context.handle(
          _lnameMeta, lname.isAcceptableOrUnknown(data['lname'], _lnameMeta));
    } else if (isInserting) {
      context.missing(_lnameMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number'], _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContactTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ContactTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ContactTableTable createAlias(String alias) {
    return $ContactTableTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ContactTableTable _contactTable;
  $ContactTableTable get contactTable =>
      _contactTable ??= $ContactTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contactTable];
}
