import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor_database/Bloc/contact_bloc.dart';
import 'package:moor_database/Bloc/contact_events.dart';
import 'package:moor_database/Bloc/contact_states.dart';
import 'package:moor_database/DataBase/moor_database.dart';
import 'package:moor_database/Screens/contact_screen.dart';
class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ContactScreen();
          }));
        },
        child: Icon(
          Icons.add
        ),
      ),
      body: BlocConsumer<ContactsBloc,ContactStates>(
        listener: (context,states){
          if(states is ContactDeletedState){
            return showSnackBar(context);
          }
        },
        builder: (context,state){
          if(state is ContactInitialState){
            //getting the intial contacts
            BlocProvider.of<ContactsBloc>(context).add(ContactInitialEvent());
            //////////////////
            return Center(child: Text("No Contacts to show!",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),);
          }
          if(state is ContactLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is ContactLoadedSuccesfullState){
            return Container(
              child: lisview(state.contactTableData),
            );
          }
          if(state is ContactLoadFailState){
            return Center(child: Text("Something Went Wrong"),);
          }
        },
      ),
    );
  }

 Widget lisview(List<ContactTableData> contactTableData) {
    return Container(
      margin: EdgeInsets.all(6.0),
      child: ListView.builder(
        itemCount: contactTableData.length,
          itemBuilder:(context,index){
           return contacts(contactTableData[index]);
          }),
    );
 }

  Widget contacts(ContactTableData contactTableData) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple,
          child: Text(contactTableData.fname[0].toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
        title: Text(
          contactTableData.fname + " " + contactTableData.lname,
          style: TextStyle(
            color: Colors.black
          ),
        ),
        subtitle: Text(contactTableData.number, style: TextStyle(
            color: Colors.black
        ),),
        trailing: IconButton(
          onPressed: (){
            showDialog(
                context: context,
            builder: (BuildContext context){
                  return AlertDialog(
                    content: Text("Are you Sure?"),
                    actions: [
                      Row(
                        children: [
                          FlatButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("No")),
                          FlatButton(
                              onPressed: (){
                                BlocProvider.of<ContactsBloc>(context).add(ContactDelete(contactTableData: contactTableData));
                                Navigator.of(context).pop();
                              },
                              child: Text("Yes")),

                        ],
                      )
                    ],
                  );
            });

          },
          icon: Icon(Icons.delete,color: Colors.purple,),
        ),
      ),

    );
  }

  showSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Deleted the contact")));
  }
}
