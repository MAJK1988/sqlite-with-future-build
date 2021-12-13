
 import 'package:flutter/material.dart';
import 'package:sqlite_future_builder/class/sqlite_finctions.dart';
import 'package:sqlite_future_builder/class/user.dart';
import 'package:sqlite_future_builder/widget/list_item_user.dart';

class UserListFutureBuilder extends StatefulWidget{
   final Size size;
  const UserListFutureBuilder({Key? key,required this.size}) : super(key: key);

  @override
  State<UserListFutureBuilder> createState()=> _StateUserListFutureBuilder();
}

class _StateUserListFutureBuilder extends State<UserListFutureBuilder>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: DBProvider.db.getAllUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot){
             if (snapshot.hasData) {
          
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return  ListItemUser(user:snapshot.data![index] ,size: widget.size);
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
  }
}