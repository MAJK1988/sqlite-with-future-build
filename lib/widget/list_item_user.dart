import 'package:flutter/material.dart';
import 'package:sqlite_future_builder/class/sqlite_finctions.dart';
import 'package:sqlite_future_builder/class/user.dart';
import 'package:sqlite_future_builder/widget/add_user_database.dart';

class ListItemUser extends StatelessWidget{
  final Size size;
  final User user;
  const ListItemUser({Key? key, required this.user,required this.size}) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
                    DBProvider.db.deleteUser(user.id);
                  },
      key: UniqueKey(),
      child: Container(
        height:  size.height*0.18,
        alignment: Alignment.center, 
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            
            decoration: BoxDecoration(
              border:Border.all(width: 1,
              color:Colors.blue),
      
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade50,
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset:const Offset(
                    10.0, // Move to right 10  horizontally
                    10.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
      
                borderRadius:const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
      
                  ),
                ),
            height:  size.height*0.15,
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children:<Widget> [
              
              
                Padding(
                  padding: const EdgeInsets.only(left:5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(bottom:5),
                      child: Text(user.name,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight:FontWeight.bold)),
                    ),
                    Text(user.email, 
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight:FontWeight.w300)),
                  ],),
                ),
              
                SizedBox(
                  width: size.width*0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(bottom:5),
                      child: Text(user.phoneNumber,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight:FontWeight.bold)),
                    ),
                    Text(user.adresse, style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 10,
                      fontWeight:FontWeight.w300)),
                  ],),
                ),
              
                Column(children:<Widget> [
              
                  /*IconButton(
                  icon: const Icon(Icons.delete),
                  tooltip: 'Delete User',
                  onPressed: () {
                   //await DBProvider.db.deleteUser(user.id);
                  },
                  
                ),*/
                IconButton(
                  icon: const Icon(Icons.edit),
                  tooltip: 'Edit User',
                  onPressed: () {
                    Navigator.push(
               context,
                MaterialPageRoute(builder: (context) => AddUserDatabase(user:user)),
               );
                  },)
                
                ])
              
              ],),
            )
          ),
        ),
      ),
    );

  }
}