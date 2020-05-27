class Validator {
//for validat email adress
  String emailValidator(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

//for validate names
  String nameValidator(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

//validate password
  String passwordvalidator(String value) {
    if (value.isEmpty) {
      return "Password is Required";
    } else if (value.length < 7) {
      return "Password should be minimum 7 characters";
    }
    return null;
  }

  // String confirmedPasswordValidator(String value, String password) {
  //   if (value.isEmpty) {
  //     return "Confirm your password";
  //   } else if (value != password) {
  //     return "Password doesn't match";
  //   }
  //   return null;
  // }
}
