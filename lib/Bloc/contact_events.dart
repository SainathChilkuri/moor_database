import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:moor_database/DataBase/moor_database.dart';

abstract class ContactsEvents extends Equatable{
}
class ContactInitialEvent extends ContactsEvents{
  @override
  List<Object> get props => [];

}
class ContactInsert extends ContactsEvents{
  final ContactTableData contactTableData;
  ContactInsert({
    @required this.contactTableData
}):assert(contactTableData!=null);
 @override
  List<Object> get props => [contactTableData];
}
class ContactDelete extends ContactsEvents{
  final ContactTableData contactTableData;
  ContactDelete({
    @required this.contactTableData
  }):assert(contactTableData!=null);
  @override
  List<Object> get props => [contactTableData];
}