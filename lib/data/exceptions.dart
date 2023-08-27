class AppException implements Exception {
  final String message;
  final String prefix;

  AppException(this.message, this.prefix);

  @override
  String toString() {
    return '$prefix: $message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message ?? 'Error during communication', 'Fetch Data Error');
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message ?? 'Invalid request', 'Bad Request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message ?? 'Unauthorised request', 'Unauthorised');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message ?? 'Invalid input', 'Invalid Input');
}

class ServerException extends AppException {
  ServerException([String? message])
      : super(message ?? 'Internal server error', 'Server Error');
}

class NotFoundException extends AppException {
  NotFoundException([String? message])
      : super(message ?? 'Resource not found', 'Not Found');
}

class TimeoutException extends AppException {
  TimeoutException([String? message])
      : super(message ?? 'Request timeout', 'Timeout');
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message ?? 'No internet connection', 'No Internet');
}

class DataParsingException extends AppException {
  DataParsingException([String? message])
      : super(message ?? 'Error while parsing data', 'Data Parsing Error');
}

class AuthenticationException extends AppException {
  AuthenticationException([String? message])
      : super(message ?? 'Authentication error', 'Authentication Error');
}

class PermissionsException extends AppException {
  PermissionsException([String? message])
      : super(message ?? 'Insufficient permissions', 'Permissions Error');
}

class PlatformException extends AppException {
  PlatformException([String? message])
      : super(message ?? 'Platform-specific error', 'Platform Error');
}

class UnknownException extends AppException {
  UnknownException([String? message])
      : super(message ?? 'Unknown error occurred', 'Unknown Error');
}
