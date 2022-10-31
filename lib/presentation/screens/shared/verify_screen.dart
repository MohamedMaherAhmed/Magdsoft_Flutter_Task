import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/verify_cubit/verify_cubit.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/view/my_buttons.dart';
import 'package:magdsoft_flutter_structure/presentation/view/verify_text_form_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_text.dart';
import 'package:sizer/sizer.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart'
    as global;
import '../../view/linear_gradient.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({Key? key}) : super(key: key);

  final List<String> keyBoardButtons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '',
    '0',
    'assets/images/keyboard_delete.png',
  ];

  @override
  Widget build(BuildContext context) {
    VerifyCubit verifyCubit = VerifyCubit.get(context);
    return BlocListener<VerifyCubit, VerifyState>(
      listener: (listenerContext, state) {
        if (state is VerifyInitial) {
          Fluttertoast.showToast(
              msg: "Code Is ${CacheHelper.getDataFromSharedPreference(key: 'code')}",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: global.colorMap['flutter_toast_background'],
              textColor: global.colorMap['white'],
              fontSize: 16.0);
        }
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                gradient: backgroundGradient,
              ),
            ),
            Positioned(
              top: 62.sp,
              left: 90.sp,
              right: 90.sp,
              child: DefaultText(
                text: "Verify Phone",
                textFontSize: 20.sp,
                textColor: global.colorMap['white'],
              ),
            ),
            Positioned(
              top: 125.sp,
              child: Form(
                key: verifyCubit.verifyKey,
                child: SizedBox(
                  width: 100.w,
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          VerifyTextFormField(
                              autoFocus: true,
                              codeController: verifyCubit.firstCodeController,
                              codeNode: verifyCubit.firstCodeNode,
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Please Enter 1st Code No.";
                                } else {
                                  return null;
                                }
                              },
                              onCat: () => verifyCubit.conCat(
                                  txt: verifyCubit
                                      .firstCodeController.value.text),
                              deCat: () => verifyCubit.deCat()),
                          VerifyTextFormField(
                              codeController: verifyCubit.secondCodeController,
                              codeNode: verifyCubit.secondCodeNode,
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Please Enter 2nd Code No.";
                                } else {
                                  return null;
                                }
                              },
                              onCat: () => verifyCubit.conCat(
                                  txt: verifyCubit
                                      .secondCodeController.value.text),
                              deCat: () => verifyCubit.deCat()),
                          VerifyTextFormField(
                              codeController: verifyCubit.thirdCodeController,
                              codeNode: verifyCubit.thirdCodeNode,
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Please Enter 3rd Code No.";
                                } else {
                                  return null;
                                }
                              },
                              onCat: () => verifyCubit.conCat(
                                  txt: verifyCubit
                                      .thirdCodeController.value.text),
                              deCat: () => verifyCubit.deCat()),
                          VerifyTextFormField(
                              codeController: verifyCubit.fourthCodeController,
                              codeNode: verifyCubit.fourthCodeNode,
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Please Enter 4th Code No.";
                                } else {
                                  return null;
                                }
                              },
                              onCat: () => verifyCubit.conCat(
                                  txt: verifyCubit
                                      .fourthCodeController.value.text),
                              deCat: () => verifyCubit.deCat()),
                        ],
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      TextButton(
                          onPressed: () {
                            LoginCubit.get(context).postLogin(context);
                          },
                          child: DefaultText(
                            text: "Resend Code",
                            textColor:
                                global.colorMap['verify_screen_input_cursor'],
                            textFontSize: 15.sp,
                          )),
                      SizedBox(
                        height: 20.sp,
                      ),
                      DefaultButton(
                        func: () {
                          if (verifyCubit.verifyKey.currentState!.validate()) {
                            verifyCubit.postVerify(context);
                          }
                        },
                        text: "Verify",
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Container(
                        height: 50.h,
                        width: 100.w,
                        alignment: Alignment.bottomCenter,
                        child: GridView.builder(
                          padding: EdgeInsets.only(bottom: 30.sp),
                          itemCount: keyBoardButtons.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20.sp,
                          ),
                          itemBuilder: (gridViewContext, index) {
                            if (index == 9) {
                              return MyButtons(
                                  buttonText: keyBoardButtons[index],
                                  buttonTapped: () {});
                            } else if (index == keyBoardButtons.length - 1) {
                              return MyButtons(
                                  buttonText: "Delete Icon",
                                  imgPath: keyBoardButtons[index],
                                  buttonTapped: () {
                                    verifyCubit.controllerValueChange(
                                        newValue: "", context: context);
                                  });
                            } else {
                              return MyButtons(
                                  buttonText: keyBoardButtons[index],
                                  buttonTapped: () {
                                    verifyCubit.controllerValueChange(
                                        newValue: keyBoardButtons[index],
                                        context: context);
                                  });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
