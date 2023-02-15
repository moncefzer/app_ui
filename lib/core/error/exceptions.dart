class ServerException implements Exception {
  final String message;

  ServerException(this.message);
  @override
  String toString() {
    return message;
  }
}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}

class LoginException implements Exception {
  final String message;

  LoginException(this.message);
  @override
  String toString() {
    return message;
  }
}

class SignUpException implements Exception {
  final String message;

  SignUpException(this.message);

  @override
  String toString() {
    return message;
  }
}

class UnAuthenticatedException implements Exception {}
