import '../../data_providers/local/cache_helper.dart';

class LoginResponse{
  String? code;

  LoginResponse.fromJson({required Map <String, dynamic> json}){
    code = json['code'];
    CacheHelper.saveDataSharedPreference(key: "code", value: code);
  }
}