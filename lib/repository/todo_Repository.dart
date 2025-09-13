import 'package:todo_app/Core/Components/Api_Urls.dart';
import 'package:todo_app/data/network/API_BaseServices.dart';
import 'package:todo_app/data/network/API_Network.dart';

class todoRepository {

  BaseApiServices _apiServices = NetworkApiServices();


  Future<dynamic>  fetchGetData() async{
    try{
      return await _apiServices.getGetApiResponse(ApiUrl.getTodosEndpoint);
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic>  sendPostData(dynamic data) async {
    try{
      return await _apiServices.GetPostApiResponse(ApiUrl.postTodosEndpoint, data);
    }catch (e){
      rethrow;
    }
  }


  Future<dynamic>  UpdatePutData(dynamic data,String id) async {
    try{
      dynamic response = await _apiServices.GetPutApiResponse(ApiUrl.putTodosEndpoint(id), data);
      return response;
    }catch (e){
      rethrow;
    }
  }

  Future<dynamic> DeleteData(String id) async {
    try{
      return await _apiServices.GetDeleteApiResponse(ApiUrl.deleteTodosEndpoint(id));
    } catch(e){
      rethrow;
    }
  }

}