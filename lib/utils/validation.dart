class MyValidator {

  // empty text validation
  static String? validateEmptyText(String? value, String? fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
  
  // validate email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    // regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  // validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // check min password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    // check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.' ;
    }
    // check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.' ;
    }
    // check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*()<>?":{}|<>]'))) {
      return 'Password must contain at least one special character.' ;
    }

    return null;
  }

  // validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    // regular expression for phone number validation (assuming an 11-digit egyptian phone number)
    final phoneRegExp =RegExp(r'^\d{11}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (11 digits required)' ;
    }
    return null;
  }

}