import 'dart:convert';
import 'dart:io';
import 'package:todo_app/data/API_Exception.dart';
import 'package:todo_app/data/network/API_BaseServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{

  @override
  Future getGetApiResponse(String Url) async{
    dynamic responseJson;
    try{
      final response =  await http.get(
          Uri.parse(Url)
      ).timeout(Duration(seconds: 10));
      responseJson = ReturnResponse(response);
    }on SocketException{
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }


  @override
  Future GetPostApiResponse(String Url, dynamic data) async {
    dynamic responseJson;
    try{
      http.Response response = await http.post(
        Uri.parse(Url),
        body: jsonEncode(data),
          headers: {"Content-Type": "application/json"}
      ).timeout(Duration(seconds: 10));

      responseJson = ReturnResponse(response);
    }on SocketException{
      throw FetchDataException('NO internet connection');
    }
    return responseJson;
  }

  @override
  Future GetPutApiResponse(String Url, dynamic data) async {
    dynamic responseJson;
    try{
      http.Response response = await http.put(
        Uri.parse(Url),
        body: jsonEncode(data),
          headers: {"Content-Type": "application/json"}
      ).timeout(Duration(seconds: 10));
      responseJson = ReturnResponse(response);
    }on SocketException{
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> GetDeleteApiResponse(String Url) async{
   dynamic responseJson;
   try{
     final response = await http.delete(
         Uri.parse(Url),
     ).timeout(Duration(seconds: 10));
     responseJson = ReturnResponse(response);
   }on SocketException{
     throw FetchDataException('No internet connection');
   }
   return responseJson;
  }



  dynamic ReturnResponse (http.Response response){
    switch(response.statusCode){
      case 200:
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 403:
      case 401:
        throw UnauthorizedException(response.body.toString());
      case 404:
        throw FetchDataException('Resource not found');
      default:
        throw FetchDataException(
            'Error occurred while communicating with server. Status code: ${response.statusCode}, Body: ${response.body}'
        );
    }
  }
}