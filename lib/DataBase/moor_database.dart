
import 'package:equatable/equatable.dart';
import 'package:moor_flutter/moor_flutter.dart';
part "moor_database.g.dart";

class ContactTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fname => text().withLength(min: 1,max: 30)();
  TextColumn get lname => text().withLength(min: 1,max: 30)();
  TextColumn get number => text().withLength(min: 1, max: 10)();
  TextColumn get address => text().withLength(min: 1,max: 50)();
}
@UseMoor(tables: [ContactTable])
class MyDatabase extends _$MyDatabase{
  MyDatabase():
        super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite',logStatements: true));

  static MyDatabase database;
  static MyDatabase getDatabase(){
    if(database==null){
      database=MyDatabase();
    }
    return database;
  }
  @override
  int get schemaVersion => 1;
  Future<List<ContactTableData>> getAllcontacts() => (select(contactTable)..orderBy(
      ([(value)=> OrderingTerm(expression: value.fname, mode: OrderingMode.asc)])
  )).get();
  Future<int> insertContacts(ContactTableData contact) => into(contactTable).insert(contact);
  Future<int> deleteContacts(ContactTableData contact)=> delete(contactTable).delete(contact);
}


/*@UseDao(tables: [ContactTable])
class ContactDao extends DatabaseAccessor<MyDatabase> with _$ContactDoaMixin{
final MyDatabase db;
ContactDao(this.db):super(db);
}*/


