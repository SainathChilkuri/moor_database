import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:moor_database/DataBase/moor_database.dart';

abstract class ContactStates extends Equatable{
}
class ContactInitialState extends ContactStates{
  @override
  // TODO: implement props
  List<Object> get props =>[];
}
class ContactLoadingState extends ContactStates{
  @override
  // TODO: implement props
  List<Object> get props =>[];
}
class ContactInsertedState extends ContactStates{
  @override
  List<Object> get props => [];
}
class ContactDeletedState extends ContactStates{
  @override
  List<Object> get props => [];
}
class ContactLoadedSuccesfullState extends ContactStates{
  final List<ContactTableData> contactTableData;
  ContactLoadedSuccesfullState({
    @required this.contactTableData
}): assert(contactTableData!=null);
  @override
  // TODO: implement props
  List<Object> get props => [contactTableData];
}
class ContactLoadFailState extends ContactStates{
  @override
  List<Object> get props => [];
}