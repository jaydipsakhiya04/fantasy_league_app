class Validation {
  static String? emailValidator(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return ("Please enter your email address");
    } else if (!regex.hasMatch(value)) {
      return ("Email address is invalid");
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return ("Please enter your password");
      // return false;
    } else if (value.length < 6) {
      return ("Password length must be at least 6");
      // return false;
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value!.isEmpty) {
      return ("Please enter your password");
      // return false;
    } else if (value.length < 6) {
      return ("Password length must be at least 6");
      // return false;
    } else if (value != password) {
      return ("Please enter same password as above");
    } else {
      return null;
    }
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return ("Please fill this field");
    } else {
      return null;
    }
  }
}
