import '../data_providers/local/cache_helper.dart';

class AccountModel {
  int? id;
  String? name;
  String? phone;

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    CacheHelper.saveDataSharedPreference(key: 'FullName', value: name);
    CacheHelper.saveDataSharedPreference(key: 'PhoneNumber', value: phone);
  }
}
