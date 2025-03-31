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
    if (value == null || value.trim().isEmpty) return "Full Name can't be empty";
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return "Full Name must contain only letters";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return "Phone number can't be empty";
    if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
      return "Enter a valid phone number";
    }
    return null;
  }

  static String? validateSchoolID(String? value) {
    if (value == null || value.isEmpty) return "School ID can't be empty";
    if (!RegExp(r'^[A-Za-z0-9]{6,}$').hasMatch(value)) {
      return "Invalid School ID format";
    }
    return null;
  }

  static String? validateSubject(String? value) {
    if (value == null || value.isEmpty) return "Subject can't be empty";
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return "Subject must contain only letters";
    }
    return null;
  }

  static String? validateClass(String? value) {
    if (value == null || value.isEmpty) return "Class can't be empty";
    if (!RegExp(r'^[0-9A-Za-z\s-]+$').hasMatch(value)) {
      return "Invalid class format";
    }
    return null;
  }
}
