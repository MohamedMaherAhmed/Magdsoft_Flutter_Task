import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart'
    as global;

class VerifyTextFormField extends StatefulWidget {
  final TextEditingController codeController;
  final FocusNode codeNode;
  final bool autoFocus;
  final String? Function(String?)? validator;
  final VoidCallback onCat;
  final VoidCallback deCat;

  const VerifyTextFormField({
    Key? key,
    required this.codeController,
    required this.codeNode,
    this.autoFocus = false,
    required this.validator,
    required this.onCat,
    required this.deCat,
  }) : super(key: key);

  @override
  State<VerifyTextFormField> createState() => _VerifyTextFormFieldState();
}

class _VerifyTextFormFieldState extends State<VerifyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 10.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: global.colorMap['white'],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(9.5.sp),
            topLeft: Radius.circular(9.5.sp),
            bottomLeft: Radius.circular(9.5.sp),
            bottomRight: Radius.circular(9.5.sp),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5.sp),
              spreadRadius: 2.sp,
              blurRadius: 5.sp,
              offset: const Offset(5, 5), // changes position of shadow
            ),
          ]),
      child: TextFormField(
        controller: widget.codeController,
        maxLines: null,
        focusNode: widget.codeNode,
        autofocus: widget.autoFocus,
        minLines: null,
        cursorColor: global.colorMap['verify_screen_input_cursor'],
        cursorHeight: 3.5.h,
        cursorWidth: 0.7.w,
        expands: true,
        showCursor: true,
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 27.sp,),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(9.5.sp),
              topLeft: Radius.circular(9.5.sp),
              bottomLeft: Radius.circular(9.5.sp),
              bottomRight: Radius.circular(9.5.sp),
            ),
            borderSide: BorderSide(color: global.colorMap['border_side']),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(9.5.sp),
              topLeft: Radius.circular(9.5.sp),
              bottomLeft: Radius.circular(9.5.sp),
              bottomRight: Radius.circular(9.5.sp),
            ),
            borderSide:
                BorderSide(color: global.colorMap['focused_border_side']),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(9.5.sp),
              topLeft: Radius.circular(9.5.sp),
              bottomLeft: Radius.circular(9.5.sp),
              bottomRight: Radius.circular(9.5.sp),
            ),
            borderSide:
                BorderSide(color: global.colorMap['login_Screen_error_border']),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(9.5.sp),
              topLeft: Radius.circular(9.5.sp),
              bottomLeft: Radius.circular(9.5.sp),
              bottomRight: Radius.circular(9.5.sp),
            ),
            borderSide:
                BorderSide(color: global.colorMap['login_Screen_error_border']),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            setState(() {
              FocusScope.of(context).nextFocus();
            });
          } else if (value.isEmpty) {
            setState(() {
              FocusScope.of(context).previousFocus();
            });
          }
        },
        onSaved: (number) {
          if (number == null) {
            widget.deCat();
          }
          widget.onCat();
        },
        keyboardType: TextInputType.none,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
