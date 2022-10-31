import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart'
as global;

class MyButtons extends StatelessWidget {
  final String? buttonText;
  final VoidCallback buttonTapped;
  /// If imgPath is non-null , buttonText is ignored
  final String? imgPath;

  const MyButtons(
      {Key? key,
      required this.buttonText,
      required this.buttonTapped,
      this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.sp),
          child: Center(
              child: imgPath == null
                  ? Text(
                      buttonText!,
                      style: TextStyle(
                        color: global.colorMap[
                        'verify_screen_keyboard_buttons_text'],
                        fontSize: 25.sp,
                      ),
                    )
                  : Image.asset(
                      'assets/images/keyboard_delete.png',
                      width: 8.w,
                      height: 8.h,
                      fit: BoxFit.contain,
                    )),
        ),
      ),
    );
  }
}
