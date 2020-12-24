import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor_database/Bloc/contact_bloc.dart';
import 'package:moor_database/Bloc/contact_events.dart';
import 'package:moor_database/Bloc/contact_states.dart';
import 'package:moor_database/DataBase/moor_database.dart';
class ContactScreen extends StatefulWidget {

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController gmail = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ContactsBloc>(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Contacts"),
        ),
        body: BlocListener<ContactsBloc,ContactStates>(
          listener: (context,states){
            if(states is ContactLoadedSuccesfullState){
              _cleartextfields();
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("Inserted Contact")));
            }
            if(states is ContactDeletedState){
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("Deleted Contact")));
            }
          },
          child: Form(
            key: _key,
            child: Container(
              margin: EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  firstname(),
                  lastname(),
                  num(),
                  add(),
                  submit()
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  Widget firstname() {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: TextFormField(
        controller: fname,
        validator: (value){
          if(value.isEmpty){
            return "Enter Firstname";
          }
        },
        decoration: _decoration("Firstname",Icon(Icons.account_circle_rounded,color: Colors.purple,)),
      ),
    );
  }

  InputDecoration _decoration(String s, Icon icon) {
    return InputDecoration(
        labelStyle: TextStyle(
          color: Colors.pinkAccent
        ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),

      labelText: s,
      prefixIcon: icon
    );
  }

  Widget lastname() {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: TextFormField(
        controller: lname,
        validator: (value){
          if(value.isEmpty){
            return "Enter Firstname";
          }
        },
        decoration: _decoration("Lastname",Icon(Icons.account_circle_rounded,color: Colors.purple,)),
      ),
    );
  }
  Widget num(){
    return Container(
      margin: EdgeInsets.all(5.0),
      child: TextFormField(
        controller: number,
        keyboardType: TextInputType.phone,
        validator: (value){
          if(value.isEmpty){
            return "Enter Number";
          }
        },
        decoration: _decoration("Number",Icon(Icons.phone,color: Colors.purple,)),
      ),
    );
  }

  Widget add() {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: TextFormField(
        controller: gmail,
        keyboardType: TextInputType.emailAddress,
        validator: (value){
          if(value.isEmpty){
            if(!value.contains("@gmail.com")){
              return "Incorrect gmail entered";
            }
            return "Gmail is requierd";
          }
        },
        decoration: _decoration("Gmail",Icon(Icons.mail_outline,color: Colors.purple,)),
      ),
    );
  }

  Widget submit() {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple,
            Colors.pinkAccent
          ]
        ),
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: FlatButton(
        onPressed: (){
          if(_key.currentState.validate()){
            ContactTableData contactTableData = ContactTableData(fname: fname.text, lname: lname.text, number: number.text, address:gmail.text);
            BlocProvider.of<ContactsBloc>(context).add(ContactInsert(contactTableData: contactTableData));
          }
        },
        child: Text("Add to Phone",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
  void _cleartextfields() {
    fname.clear();
    lname.clear();
    number.clear();
    gmail.clear();
  }
}



