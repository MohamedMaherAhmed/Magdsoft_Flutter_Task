import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    CacheHelper.getDataFromSharedPreference(key: 'loggedIn') == true
        ? Future.delayed(const Duration(seconds: 2), () async {
            Navigator.pushNamedAndRemoveUntil(
                context, 'VerifyScreen', (route) => false);
          })
        : Future.delayed(const Duration(seconds: 2), () async {
            Navigator.pushNamedAndRemoveUntil(
                context, 'LoginScreen', (route) => false);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash_screen.png',
            width: 100.w,
            height: 100.h,
            fit: BoxFit.fill,
            alignment: Alignment.center,
            repeat: ImageRepeat.noRepeat,
            isAntiAlias: true,
          ),
        ],
      ),
    );
  }
}
