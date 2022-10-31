import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import '../../data/data_providers/local/cache_helper.dart';
import '../../data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart'
as global;

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController loginFullNameController = TextEditingController();
  final FocusNode loginFullNameFocusNode = FocusNode();
  final TextEditingController loginPhoneNumberController =
      TextEditingController();
  final FocusNode loginPhoneNumberFocusNode = FocusNode();

  static LoginCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  /// Disposes of the Controllers
  void dispose() {
    print("Controllers Disposed!!!");
    loginFullNameFocusNode.dispose();
    loginPhoneNumberFocusNode.dispose();
    loginFullNameController.dispose();
    loginPhoneNumberController.dispose();
  }

  /// LoginCubit API request
  Future postLogin(context) async {
    var json = setPostLoginRequestBody(
        fullName: loginFullNameController.value.text,
        phoneNumber: loginPhoneNumberController.value.text);

    emit(LoginLoading());

    DioHelper.postData(url: verifyPhone, body: json).then((value) {
      if (value.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Successfully Logged In",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: global.colorMap['flutter_toast_background'],
            textColor: global.colorMap['white'],
            fontSize: 16.0);

        CacheHelper.saveDataSharedPreference(key: 'PhoneNumber', value: json['phone']);

        emit(LoginSuccess(
            loginResponse: LoginResponse.fromJson(json: value.data)));
        Navigator.pushNamedAndRemoveUntil(
            context, "VerifyScreen", (route) => false);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            dispose();
          },
        );
      }
    }).catchError((e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(LoginError());
    });
  }
}
