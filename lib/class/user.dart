class User{
   int id;
   String name;
   String email;
   String adresse;
   int age;
   String phoneNumber;


  User({
      this.id=-1,
    this.name='',
    this.email=''
  ,  this.adresse='',
     this.age=-1,
     this.phoneNumber=''});
 

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        adresse: json["adresse"],
        age: json["age"],
        phoneNumber: json["phoneNumber"],
      );


  Map<String,dynamic> toMap() {
    return {
      'id':id,
      'name':name,
      'email':email,
      'adresse':adresse,
      'age':age,
      'phoneNumber':phoneNumber

    };
  }

  @override
  String toString() {
    return 'User(id:$id,name:$name, email:$email, adresse:$adresse, age:$age)';
  }

  
}