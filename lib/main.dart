import 'package:flutter/material.dart';
import 'package:sqlite_future_builder/class/sqlite_finctions.dart';
import 'package:sqlite_future_builder/widget/list_item_user.dart';
import 'package:sqlite_future_builder/widget/user_list_future_builder.dart';

import 'class/user.dart';
import 'widget/add_user_database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  
  


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      floatingActionButton:
      Container(
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color:Colors.blue),
        child: IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'add User',
            onPressed: () {
             Navigator.push(
             context,
              MaterialPageRoute(builder: (context) => AddUserDatabase(user:User())),
             );

            },
          ),
      ) ,// await DBProvider.db.newUser(user);
      body: UserListFutureBuilder(size:size)
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
 
