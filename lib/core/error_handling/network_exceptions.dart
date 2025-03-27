import 'dart:io';

class NetworkExceptions {
  static String handleException(dynamic error) {
    if (error is SocketException) {
      return "No internet connection. Please check your network.";
    } else {
      return "Something went wrong.";
    }
  }
}
