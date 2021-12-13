import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_future_builder/class/constant.dart';
import 'package:sqlite_future_builder/class/sqlite_finctions.dart';
import 'package:sqlite_future_builder/class/user.dart';
import 'package:sqlite_future_builder/class/validator.dart';

class AddUserDatabase extends StatefulWidget{
   final User user;
   
   
  //final User user;
    const AddUserDatabase({Key? key, 
    required this.user
     }
  ) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateAddUserDatabase();
}

class _StateAddUserDatabase extends State<AddUserDatabase>{
  
  
  late String name,email,buttonText='Add user to database';
  late int age;
  late bool clicked=false;

  late TextEditingController _myControllerAge, _myControllerEmail,_myControllername,_myControllerAdress,_myControllerPhoneNumber;
  @override
  void initState() {
    super.initState();
    
    if (widget.user.id!=-1){
       _myControllerEmail = TextEditingController()..text=widget.user.email;
    _myControllername = TextEditingController()..text=widget.user.name;
    _myControllerAdress = TextEditingController()..text=widget.user.adresse;
    _myControllerPhoneNumber = TextEditingController()..text=widget.user.phoneNumber;
    _myControllerAge = TextEditingController()..text=widget.user.age.toString();
    buttonText='Update user';

    }else{_myControllerEmail = TextEditingController();
    _myControllername = TextEditingController();
    _myControllerAdress = TextEditingController();
    _myControllerPhoneNumber = TextEditingController();
    _myControllerAge = TextEditingController();

    
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      
      appBar: AppBar(
        
        title:const Text("Add User to Database"),
      ),
      body:SingleChildScrollView(
      
      child:Column(
      children:<Widget> [
        Container(
          padding:const EdgeInsets.all(8),
          child: TextField(
            controller: _myControllername,
            decoration: InputDecoration(
              errorText:clicked ? Validator.isvalidateName(name: _myControllername.value.text)![0]:null,
              labelText: 'type user\'s name',
              hintText: 'Mr...',
              hintStyle:const TextStyle(color: Colors.lightBlue)),
              // The validator receives the text that the user has entered.
              
            ),
        ),
        
        Container(
          padding:const EdgeInsets.all(8),
          child: TextField(
            controller: _myControllerEmail,
            decoration: InputDecoration(
              errorText:clicked ? Validator.isvalidateEmail(email: _myControllerEmail.value.text)![0]:null,
              labelText: 'type user\'s email',
              hintText: 'example@gamil....',
              hintStyle:const TextStyle(color: Colors.lightBlue)),
              // The validator receives the text that the user has entered.
              
            ),
        ),
    
        
        Container(
          padding:const EdgeInsets.all(8),
          child: TextField(
            controller: _myControllerAdress,
            decoration: InputDecoration(
              errorText:clicked ? Validator.isvalidateName(name: _myControllerAdress.value.text)![0]:null,
              labelText: 'type user\'s adresse',
              hintText: 'France Metz 18 rue Gascgone',
              hintStyle:const TextStyle(color: Colors.lightBlue)),
              // The validator receives the text that the user has entered.
              
            ),
        ),
        Container(
          padding:const EdgeInsets.all(8),
          child: TextField(
            controller: _myControllerPhoneNumber,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              errorText:clicked ? Validator.isValidPhoneNumber(phoneNumber: _myControllerPhoneNumber.value.text)![0]:null,
              labelText: 'type user\'s phone number',
              hintText: '+91 7894561230',
               
              hintStyle:const TextStyle(color: Colors.lightBlue)),
              // The validator receives the text that the user has entered.
              
            ),
        ),
        Container(
          padding:const EdgeInsets.all(8),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _myControllerAge,
            decoration: InputDecoration(
              errorText:clicked ? Validator.isValidAge(age:_myControllerAge.value.text)![0]:null,
              hintText: '18',
              labelText: 'Enter user\'s Age',
              hintStyle:const TextStyle(color: Colors.lightBlue)),
              // The validator receives the text that the user has entered.
              
            ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: ()async {
                setState(() {
                  clicked=true;
                });
                // Validate returns true if the form is valid, or false otherwise.
                
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  
                    if (Validator.isValidateUser(name:_myControllername.value.text,
                email:_myControllerAge.value.text,
                phoneNumber:_myControllerPhoneNumber.value.text,
                adresss:_myControllerAdress.value.text,
                age:_myControllerAge.value.text)!){}else{
                  late User user=User(
                    id: 0, name: _myControllername.value.text,
                    email:_myControllerEmail.value.text,
                    adresse: _myControllerAdress.value.text, 
                    age: int.parse(_myControllerAge.value.text),
                     phoneNumber: _myControllerPhoneNumber.value.text);
                  if(widget.user.id==-1){
                    await DBProvider.db.newUser(user).then((value){
                      ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User added to database')),);
                    });
                  
                  }else{user.id=widget.user.id;
                    
                    await DBProvider.db.updateUser(user).then((value){ 
                      ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User Updated')));
                    });
                  }

                }
                  /*if(widget.user.id==-1){
                    if (Validator.isValidateUser(name:_myControllername.value.text,
                email:_myControllerAge.value.text,
                phoneNumber:_myControllerPhoneNumber.value.text,
                adresss:_myControllerAdress.value.text,
                age:_myControllerAge.value.text)!
                ) {
                  late User user=User(
                    id: 0, name: _myControllername.value.text,
                    email:_myControllerEmail.value.text,
                    adresse: _myControllerAdress.value.text, 
                    age: int.parse(_myControllerAge.value.text),
                     phoneNumber: _myControllerPhoneNumber.value.text);

                  await DBProvider.db.newUser(user);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User added to database')),
                  );}}else{if (Validator.isValidateUser(name:_myControllername.value.text,
                email:_myControllerAge.value.text,
                phoneNumber:_myControllerPhoneNumber.value.text,
                adresss:_myControllerAdress.value.text,
                age:_myControllerAge.value.text)!
                ) {
                  late User user=User(
                    id: 0, name: _myControllername.value.text,
                    email:_myControllerEmail.value.text,
                    adresse: _myControllerAdress.value.text, 
                    age: int.parse(_myControllerAge.value.text),
                     phoneNumber: _myControllerPhoneNumber.value.text);
                    await DBProvider.db.newUser(user);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User Updated')));
                  }}*/
              },
              child:  Text(buttonText),
            ),
          ),
      ],
    )));
  }
  
}


