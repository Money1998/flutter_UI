import 'package:flutter/material.dart';

import '../utils/AppColors.dart';
import '../utils/appTextStyle.dart';

class EditTextWithSuffix extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final String? hintText;
  final String Function(String?)? validator;
  final void Function(String)? onSubmit;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final IconData? icon;
  final double? iconSize;
  final Widget? suffixWidget;
  final bool? isObscure;
  final bool? isRead;

  const EditTextWithSuffix(
      {Key? key,
      this.controller,
      this.inputType,
      this.hintText,
      this.validator,
      this.onSubmit,
      this.textInputAction,
      this.icon,
      this.iconSize,
      this.suffixWidget,
      this.onChanged,
      this.focusNode,
      this.isObscure,
      this.isRead})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isRead != null
          ? false
          : isRead == true
              ? true
              : false,
      onChanged: onChanged,
      focusNode: focusNode,
      obscureText: isObscure!,
      keyboardType: inputType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.done,
      style: AppTextStyle.txt16WTextStyle,
      toolbarOptions: const ToolbarOptions(
          selectAll: false, cut: false, copy: false, paste: false),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        errorMaxLines: 2,
        filled: true,
        counterText: "",
        fillColor: AppColors.transparentBlue,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.textHintColor),
        suffixIcon: Container(
          width: MediaQuery.of(context).size.width * 0.1,
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: AppColors.textHintColor, width: 1))),
          child: Icon(
            icon,
            color: AppColors.textHintColor,
            size: iconSize ?? 20.0,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blackColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blackColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
      ),
      validator: validator!,
      onFieldSubmitted: onSubmit,
    );
  }
}
