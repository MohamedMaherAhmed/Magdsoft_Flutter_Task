import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/verify_response.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart'
as global;
import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/network/requests/verify_request.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());

  static VerifyCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> verifyKey = GlobalKey<FormState>();

  String? inputVerifyCode;

  final TextEditingController firstCodeController = TextEditingController();
  final FocusNode firstCodeNode = FocusNode();
  final TextEditingController secondCodeController = TextEditingController();
  final FocusNode secondCodeNode = FocusNode();
  final TextEditingController thirdCodeController = TextEditingController();
  final FocusNode thirdCodeNode = FocusNode();
  final TextEditingController fourthCodeController = TextEditingController();
  final FocusNode fourthCodeNode = FocusNode();

  /// this is to be called when a button in the onScreen Keyboard is pressed
  /// to change the value in the focused textformfield and place the cursor at the end
  void controllerValueChange({required String newValue, required context}) {
    FocusNode? focusNode = FocusScope.of(context).focusedChild;
    if (focusNode != null) {
      if (focusNode == firstCodeNode) {
        firstCodeController.value = TextEditingValue(
            text: newValue,
            selection: TextSelection.fromPosition(
              TextPosition(offset: newValue.length),
            ));
        emit(VerifyChange());
      } else if (focusNode == secondCodeNode) {
        secondCodeController.value = TextEditingValue(
            text: newValue,
            selection: TextSelection.fromPosition(
              TextPosition(offset: newValue.length),
            ));
        emit(VerifyChange());
      } else if (focusNode == thirdCodeNode) {
        thirdCodeController.value = TextEditingValue(
            text: newValue,
            selection: TextSelection.fromPosition(
              TextPosition(offset: newValue.length),
            ));
        emit(VerifyChange());
      } else if (focusNode == fourthCodeNode) {
        fourthCodeController.value = TextEditingValue(
            text: newValue,
            selection: TextSelection.fromPosition(
              TextPosition(offset: newValue.length),
            ));
        emit(VerifyChange());
      }
    }
  }

  /// these two functions are to be called when we input or delete a number
  dynamic conCat({required String txt}) {
    inputVerifyCode = "$inputVerifyCode$txt";
  }

  dynamic deCat() {
    inputVerifyCode =
        "${firstCodeController.value.text}${secondCodeController.value.text}${thirdCodeController.value.text}${fourthCodeController.value.text}";
  }

  void dispose(){
    firstCodeController.dispose();
    firstCodeNode.dispose();
    secondCodeController.dispose();
    secondCodeNode.dispose();
    thirdCodeController.dispose();
    thirdCodeNode.dispose();
    fourthCodeController.dispose();
    fourthCodeNode.dispose();
  }

  /// otp verify request
  Future postVerify(context) async {
    var json = setPostVerifyRequestBody(
        code: CacheHelper.getDataFromSharedPreference(key: 'code'),
        phoneNumber:
            CacheHelper.getDataFromSharedPreference(key: 'PhoneNumber'));

    emit(VerifyLoading());

    DioHelper.postData(url: otp, body: json).then((value) {
      if (value.statusCode == 200) {
        /// removing them as they are no longer needed and
        /// will get the data i need from API
        CacheHelper.removeData(key: 'code');
        CacheHelper.removeData(key: 'PhoneNumber');

        Fluttertoast.showToast(
            msg: "Successfully Logged In",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: global.colorMap['flutter_toast_background'],
            textColor: global.colorMap['white'],
            fontSize: 16.0);

        emit(VerifySuccess(
            accountModel: AccountModel.fromJson(
                getAccountModelFromJson(verifyJson: value.data))));
        Future.delayed(
          const Duration(seconds: 10),
          () {
            dispose();
          },
        );
      }
    }).catchError((e) {
      print(e.toString());
      emit(VerifyFailure());
    });
  }
}
