import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor_database/Bloc/contact_events.dart';
import 'package:moor_database/Bloc/contact_states.dart';
import 'package:moor_database/DataBase/moor_database.dart';

class ContactsBloc extends Bloc<ContactsEvents,ContactStates>{
  ContactsBloc() : super(ContactInitialState());
  @override
  Stream<ContactStates> mapEventToState(ContactsEvents event) async* {
    if(event is ContactInitialEvent){
      List<ContactTableData> contacts = await MyDatabase.getDatabase().getAllcontacts();
      if(contacts.isNotEmpty){
        yield ContactLoadedSuccesfullState(contactTableData: contacts);
      }else{
        yield ContactInitialState();
      }

    }
   if(event is ContactInsert){
     yield ContactLoadingState();
     try{
       var result = MyDatabase.getDatabase().insertContacts(event.contactTableData);
       if(result!=0){
         List<ContactTableData> contacts = await MyDatabase.getDatabase().getAllcontacts();
         yield ContactLoadedSuccesfullState(contactTableData: contacts);
       }else{
         yield ContactLoadFailState();
       }
     }catch(e){
       yield ContactLoadFailState();
     }
   }
   if(event is ContactDelete){
     print(event.contactTableData);
     int result = await MyDatabase.getDatabase().deleteContacts(event.contactTableData);
     print(result);
     if(result==1){
       List<ContactTableData> contacts = await MyDatabase.getDatabase().getAllcontacts();
       yield ContactLoadedSuccesfullState(contactTableData: contacts);
     }else{
       yield ContactLoadFailState();
     }

   }
  }

}