import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app/Core/utils/utils.dart';
import 'package:todo_app/repository/todo_Repository.dart';
import 'package:todo_app/routes/routes_names.dart';

import '../Model/Todo_Model.dart';

class todoprovider extends ChangeNotifier{

  final _todorepo = todoRepository();

  //post laoding
  bool _postloading = false;
  bool get postloading => _postloading;
  void setpostloading(bool value){
    _postloading = value;
    notifyListeners();
  }

  //get laoding
  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;
  bool _getloading = false;
  bool get getloading => _getloading;
  void setgetloading(bool value){
    _getloading = value;
    notifyListeners();
  }

  //edit laoding
  bool _editloading = false;
  bool get editloading => _editloading;
  void seteditloading(bool value){
    _editloading = value;
    notifyListeners();
  }


  //delete laoding
  bool _deleteloading = false;
  bool get deleteloading => _deleteloading;
  void setdeleteloading(bool value){
    _deleteloading = value;
    notifyListeners();
  }


  //gettodo
  Future<dynamic> gettood(BuildContext context) async {
    setgetloading(true);
    _todorepo.fetchGetData().then((value){
      setgetloading(false);
      _todos = (value as List).
          map((item) => TodoModel.fromJson(item)).toList();
      Utils.snackbar('Get Successfully', context);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTracer){
      setgetloading(false);
      Utils.flushbar(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }
    });
  }




  //posttodo
  Future<dynamic> posttodo(dynamic data, BuildContext context) async {
    setpostloading(true);
    _todorepo.sendPostData(data).then((value){
      setpostloading(false);
      Utils.snackbar('Post Successfully...', context);
      Navigator.pushNamedAndRemoveUntil(context,
          RoutesNames.homescreen,
          (routes) => false,
      );
      if(kDebugMode){
        print(value.toString());
      }
    }
    ).onError((error, stackTrace){
      setpostloading(false);
      if(kDebugMode){
        Utils.flushbar(error.toString(), context);
        print(error.toString());
      }
    });
  }


  //edittodo
   Future<dynamic>  edittodo(dynamic data, String id, BuildContext context) async {
    seteditloading(true);
    _todorepo.UpdatePutData(data, id).then((value){
      seteditloading(false);
      Utils.snackbar('Edit Successfully', context);
      Navigator.pushNamedAndRemoveUntil(context,
          RoutesNames.homescreen,
          (routes) => false,
      );
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTracer){
      seteditloading(false);
      Utils.flushbar(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }
    });
   }



  //deletedo
  Future<dynamic> deletetodo(String id, BuildContext context) async {
    setdeleteloading(true);
    notifyListeners();
     _todorepo.DeleteData(id).then((value) {
      setdeleteloading(false);
      notifyListeners();
      todos.removeWhere((todo) => todo.id == id);
      Navigator.pop(context);
      Utils.snackbar('Deleted Successfully', context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setdeleteloading(false);
      notifyListeners();
      Utils.flushbar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}