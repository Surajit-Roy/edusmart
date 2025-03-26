class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email can't be empty";
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) return "Name can't be empty";
    return null;
  }
}
