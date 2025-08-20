class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return '$prefix: $message';
  }
}

// Internet and API exceptions

class NoInternetException extends AppException {
  NoInternetException([String? message])
    : super(message, 'No Internet Connection');
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message])
    : super(message, 'Request Timed Out');
}

class UnAuthorisedException extends AppException {
  UnAuthorisedException([String? message])
    : super(message, 'Unauthorized Request');
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
    : super(message, 'Error During Communication');
}
