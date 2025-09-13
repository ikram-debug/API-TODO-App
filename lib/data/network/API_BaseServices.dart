
abstract class BaseApiServices {

  Future<dynamic> getGetApiResponse(String Url);
  Future<dynamic> GetPostApiResponse(String Url, dynamic data);
  Future<dynamic> GetPutApiResponse(String Url, dynamic data);
  Future<dynamic> GetDeleteApiResponse(String Url);
}