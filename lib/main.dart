
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor_database/Bloc/contact_bloc.dart';
import 'package:moor_database/Screens/contact_list_screen.dart';
import 'package:moor_database/Screens/contact_screen.dart';

void main(){
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> ContactsBloc(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
        home: ContactListScreen(),
     ),
    );
  }
}
