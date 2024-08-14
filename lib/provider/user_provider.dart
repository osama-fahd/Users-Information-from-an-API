import 'package:flutter/material.dart';
import 'package:flutter_hashcamp_3/api/api.dart';
import 'package:flutter_hashcamp_3/models/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = false;
  String? errorMassage;
  
  Api _api = Api();
  
  Future<void> fetchUsers() async {
    isLoading = true;
    errorMassage = null;
    //تحدث البيانات
    notifyListeners();

    try{
      users = await _api.getUsers();
    }catch(e){
      errorMassage = e.toString();
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }
}