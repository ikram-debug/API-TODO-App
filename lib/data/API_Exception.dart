import 'package:flutter/material.dart';

class ApiException implements Exception {
  final _message;
  final _prefix;

  ApiException([this._message, this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
}


class FetchDataException extends ApiException {
  FetchDataException([String? message]) :super (message, 'Error during communications');
}


class BadRequestExceptiona extends ApiException {
  BadRequestExceptiona ([String? message]) : super (message, 'Invalid Request');
}


class UnauthorizedException extends ApiException {
  UnauthorizedException ([String? message]) : super (message, 'Unathorized request');
}


class InvalidInputException extends ApiException {
  InvalidInputException ([String? message]) : super (message, 'Innalid Input');
}
