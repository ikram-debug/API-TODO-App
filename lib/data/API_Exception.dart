class ApiException implements Exception {
  final String? _message;
  final String _prefix;

  ApiException([this._message, this._prefix = ""]);

  @override
  String toString() {
    return '$_prefix: $_message';
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends ApiException {
  BadRequestException([String? message])
      : super(message, 'Invalid Request');
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized Request');
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message])
      : super(message, 'Invalid Input');
}
