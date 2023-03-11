import 'package:intl/intl.dart';

class FormFieldValidate {
  static String? isEmpty(String input) {
    if (input.isEmpty) {
      return "Please fill this section";
    }
    return null;
  }

  static String? isPhoneNo(String input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a phone number';
    } else if (input.length != 10 || int.tryParse(input) == null) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? isEmail(String input) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(input)) {
      return 'Please enter a valide email';
    }
    return null;
  }

  static String? minMaxLength(String input, int minLength, int maxLength) {
    if (input.length < minLength) {
      return 'Input should be minimum of $minLength characters';
    }
    if (input.length > maxLength) {
      return 'Input should be maximum of $maxLength characters';
    }
    return null;
  }

  static String? isDate(String input) {
    if (input.length == 10 && input[2] != '/' && input[6] != '/') {
      return 'Please enter a valid date';
    }
    List splitDate = input.split(input[2]);
    if (splitDate.length < 3) {
      return 'Please enter a valid date';
    }
    if (int.tryParse(splitDate[0]) == null ||
        int.tryParse(splitDate[1]) == null ||
        int.tryParse(splitDate[2]) == null) {
      return 'Please enter a valid date';
    }
    int day = int.parse(splitDate[0]);
    int month = int.parse(splitDate[1]);
    int year = int.parse(splitDate[2]);

    if (day == 0 ||
        day > 31 ||
        month == 0 ||
        month > 12 ||
        year < 1900 ||
        year > DateTime.now().year) {
      return 'Please enter a valid date';
    }
    DateTime inputDate = new DateFormat("dd/MM/yyyy").parse(input);

    if (inputDate.isAfter(DateTime.now())) {
      return 'Dob cannot be a future date';
    }
  }
}
