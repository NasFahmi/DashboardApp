import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Pawonkoe/app/theme/colors.dart';

class TextFormFieldComponent extends StatelessWidget {
  final String? validationForm;
  final TextEditingController? controllerForm;
  final String? hintTextField;
  RegExp? regex;
  TextFormFieldComponent(
      {required this.validationForm,
      required this.controllerForm,
      required this.hintTextField,
      required this.regex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationForm;
        }
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(regex!),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controllerForm,
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.0),
        filled: true,
        fillColor: Color.fromARGB(255, 245, 245, 245),
        hintText: hintTextField,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blueColorPrimary,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade400,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
      ),
    );
  }
}
