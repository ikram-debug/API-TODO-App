import 'package:flutter/material.dart';
import 'package:todo_app/data/API_Response/API_Status.dart';

class ApiResponse<T> {

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.Loading;
  ApiResponse.error() : status =  Status.Error;
  ApiResponse.completed() : status = Status.Completede;

  @override
  String toString() {
    return 'Status: $status \n Massage: $message \n Data: $data';

  }
}