import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_text.dart';
import 'package:sizer/sizer.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart'
    as global;

import '../../../data/data_providers/local/cache_helper.dart';
import '../../view/linear_gradient.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      LoginCubit _loginCubit = LoginCubit.get(context);
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _loginCubit.loginKey,
          child: Stack(
            children: [
              /// Background Design
              Image.asset('assets/images/login_background_photo.png',
                  width: 100.w,
                  height: 100.h,
                  repeat: ImageRepeat.noRepeat,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter),
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  gradient: backgroundGradient,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: global.colorMap['white'],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.sp),
                        topLeft: Radius.circular(40.sp)),
                  ),
                ),
              ),
              /// Foreground Design
              Positioned(
                top: 80.sp,
                left: 20.sp,
                right: 20.sp,
                bottom: 0.sp,
                child: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      /// Login Card Design
                      SizedBox(
                        width: 80.w,
                        height: 40.h,
                        child: Card(
                          elevation: 10.sp,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.sp, right: 25.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DefaultText(
                                  text: "Welcome",
                                  textFontSize: 20.sp,
                                  textColor:
                                      global.colorMap['login_screen_title'],
                                ),
                                Divider(
                                  color: global
                                      .colorMap['login_screen_title_divider'],
                                  thickness: 2.sp,
                                  endIndent: 55.sp,
                                  indent: 55.sp,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: 205.sp,
                                      height: 45.sp,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: global.colorMap[
                                                'focused_border_side'],
                                            blurRadius: 2.sp,
                                            spreadRadius: 0.sp,
                                            offset: Offset(2.sp,
                                                2.sp), // shadow direction: bottom right
                                          )
                                        ],
                                      ),
                                    ),
                                    TextFormField(
                                      controller:
                                          _loginCubit.loginFullNameController,
                                      focusNode:
                                          _loginCubit.loginFullNameFocusNode,
                                      minLines: null,
                                      autofocus: true,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (val) {
                                        FocusScope.of(context).requestFocus(
                                            _loginCubit
                                                .loginPhoneNumberFocusNode);
                                      },
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          color: global.colorMap['hint_text'],
                                        ),
                                        hintText: "Enter your Full Name",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          borderSide: BorderSide(
                                              color: global
                                                  .colorMap['border_side']),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          borderSide: BorderSide(
                                              color: global.colorMap[
                                                  'focused_border_side']),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          borderSide: BorderSide(
                                              color: global.colorMap[
                                                  'login_Screen_error_border']),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          borderSide: BorderSide(
                                              color: global.colorMap[
                                                  'login_Screen_error_border']),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value == '') {
                                          return "Please Enter your Full Name";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: 205.sp,
                                      height: 45.sp,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: global.colorMap[
                                                'focused_border_side'],
                                            blurRadius: 2.sp,
                                            spreadRadius: 0.sp,
                                            offset: Offset(2.sp,
                                                2.sp), // shadow direction: bottom right
                                          )
                                        ],
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _loginCubit
                                          .loginPhoneNumberController,
                                      focusNode:
                                          _loginCubit.loginPhoneNumberFocusNode,
                                      minLines: null,
                                      keyboardType: TextInputType.phone,
                                      textInputAction: TextInputAction.done,
                                      onFieldSubmitted: (val) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          color: global.colorMap['hint_text'],
                                        ),
                                        hintText: "Enter your Phone Number",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          borderSide: BorderSide(
                                              color: global
                                                  .colorMap['border_side']),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          borderSide: BorderSide(
                                              color: global.colorMap[
                                                  'focused_border_side']),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          borderSide: BorderSide(
                                              color: global.colorMap[
                                                  'login_Screen_error_border']),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          borderSide: BorderSide(
                                              color: global.colorMap[
                                                  'login_Screen_error_border']),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value == '') {
                                          return "Please Enter your Phone Number";
                                        } else if (value.length == 12) {
                                          return 'Mobile number should be 11 digits only';
                                        } else {
                                          return null;
                                        }
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(11),
                                      ],
                                    ),
                                  ],
                                ),
                                DefaultButton(
                                  text: "Login",
                                  func: () {
                                    if (_loginCubit.loginKey.currentState!
                                        .validate()) {
                                      CacheHelper.saveDataSharedPreference(
                                          key: "loggedIn", value: true);
                                      _loginCubit.postLogin(context);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      /// Social Media Buttons' Design
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40.w,
                            child: Divider(
                              color: global.colorMap[
                                  'login_screen_social_media_divider'],
                              thickness: 1.sp,
                              endIndent: 10.sp,
                              indent: 1.sp,
                            ),
                          ),
                          DefaultText(
                            text: "OR",
                            textFontSize: 15.sp,
                            textColor: global.colorMap['login_screen_OR'],
                          ),
                          SizedBox(
                            width: 40.w,
                            child: Divider(
                              color: global.colorMap[
                                  'login_screen_social_media_divider'],
                              thickness: 1.sp,
                              endIndent: 1.sp,
                              indent: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 21.sp,
                            child: Material(
                              elevation: 7.sp,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.sp),
                                  side: BorderSide.none),
                              color: global.colorMap['white'],
                              // Button color
                              child: InkWell(
                                splashColor: global.colorMap[
                                    'login_screen_social_media_divider'],
                                // Splash color
                                onTap: () {},
                                child: SizedBox(
                                    width: 20.w,
                                    height: 20.h,
                                    child: Image.asset(
                                      "assets/images/f.png",
                                      isAntiAlias: true,
                                      fit: BoxFit.contain,
                                    )),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 25.sp,
                            child: Material(
                              elevation: 7.sp,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.sp),
                                  side: BorderSide.none),
                              color: global.colorMap['white'],
                              // Button color
                              child: InkWell(
                                splashColor: global.colorMap[
                                    'login_screen_social_media_divider'],
                                // Splash color
                                onTap: () {},
                                child: SizedBox(
                                    width: 20.w,
                                    height: 20.h,
                                    child: Image.asset(
                                      "assets/images/ios 2.png",
                                      isAntiAlias: true,
                                      fit: BoxFit.scaleDown,
                                    )),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 21.sp,
                            child: Material(
                              elevation: 7.sp,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.sp),
                                  side: BorderSide.none),
                              color: global.colorMap['white'],
                              // Button color
                              child: InkWell(
                                splashColor: global.colorMap[
                                    'login_screen_social_media_divider'],
                                // Splash color
                                onTap: () {},
                                child: SizedBox(
                                    width: 20.w,
                                    height: 20.h,
                                    child: Image.asset(
                                      "assets/images/Google__G__Logo 2.png",
                                      isAntiAlias: true,
                                      fit: BoxFit.contain,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
