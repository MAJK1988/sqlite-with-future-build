


class Validator {
  static bool checkEmpty(String? name, String? password,
      [String? passwordConfirm]) {
    if (name == null || password == null) {
      return false;
    }
    if (name.isEmpty || password.isEmpty) {
      return false;
    } else {
      if (passwordConfirm == null)
        return true;
      else
        return true && !passwordConfirm.isEmpty;
    }
  }

  static List? isvalidateName({required String? name}) {
    if (name == null) {
      return [null,false];
    }

    if (name.isEmpty) {
      return ['Name can\'t be empty', false];
    }

    return [null,true];
  }

  static List? isvalidateEmail({required String? email}) {
    if (email == null) {
      return [null,false];
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return ['Email can\'t be empty',false];
    } else if (!emailRegExp.hasMatch(email)) {
      return[ 'Enter a correct email',false];
    }

    return[ null,true];
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Password length is at least 6';
    }

    return null;
  }

  static bool confirmPassword(
      {required String? password, required String? confirmPassword}) {
    if (password == confirmPassword) {
      return true;
    } else
      return false;
  }

  static List?  isValidPhoneNumber({required String? phoneNumber}) {
  // Null or empty string is invalid phone number
  if (phoneNumber == null) {
    return [null,false];
  }

  // You may need to change this pattern to fit your requirement.
  // I just copied the pattern from here: https://regexr.com/3c53v
  const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  final regExp = RegExp(pattern);

  if (phoneNumber.isEmpty) {
      return ['Phone number can\'t be empty',false];
    }
  else if (!regExp.hasMatch(phoneNumber)) {
    return ['Enter a correct Phone number',false];
  }
  return [null,true];
}


 static List?  isValidAge({required String? age}) {
  // Null or empty string is invalid phone number
  if (age == null) {
     return [null,false];
  }
  if (age.isEmpty) {
      return ['age can\'t be empty',false];
    }

  
  return [null, true];
}

static bool? isValidateUser({required String? name,
 required String? email,
  required String? adresss,
  required String? phoneNumber,
  required String?age}){
 
 return isValidAge(age:age)![1]&&isValidPhoneNumber(phoneNumber: phoneNumber)![1]
 &&isvalidateName(name:name)![1]&&isvalidateName(name:adresss)![1]&&isvalidateEmail(email:email)![1];
}
}