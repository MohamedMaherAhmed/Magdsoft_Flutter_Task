import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart'
    as global;
import 'package:sizer/sizer.dart';
import 'default_text.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.func, required this.text}) : super(key: key);

  final void Function()? func;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        width: 100.w,
        height: 6.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.sp),
          image: const DecorationImage(
            image: AssetImage("assets/images/Rectangle 29.png"),
            isAntiAlias: true,
            fit: BoxFit.contain,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: DefaultText(
            text: text,
            textFontSize: 25,
            textColor: global.colorMap['white'],
          ),
        ),
      ),
    );
  }
}
