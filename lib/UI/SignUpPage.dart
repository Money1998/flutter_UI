import 'package:dribble/UI/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Common/Global.dart';
import '../Widget/EditTextWithSuffix.dart';
import '../utils/AppColors.dart';
import '../utils/appTextStyle.dart';
import '../utils/screen.dart';
import '../utils/stringConstant.dart';

class SignUPPage extends StatefulWidget {
  const SignUPPage({Key? key}) : super(key: key);

  @override
  State<SignUPPage> createState() => _SignUPPageState();
}

class _SignUPPageState extends State<SignUPPage> {
  bool sendOTP = false;
  final TextEditingController _emailController = TextEditingController(),
      _fullNameController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode(),
      fullNameController = FocusNode(),
      phoneNumberController = FocusNode(),
      passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SizedBox(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Create new Account",
                      style: AppTextStyle.txt20WBBTextStyle,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Please fill in the form to continue",
                      style: AppTextStyle.normalBG14Style,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: EditTextWithSuffix(
                      controller: _fullNameController,
                      focusNode: fullNameController,
                      hintText: 'Full Name',
                      isObscure: false,
                      icon: Icons.account_circle,
                      onChanged: (val) {},
                      validator: (args) {
                        if (args.toString().isEmpty) {
                          return 'Full Name is required';
                        } else {
                          return "";
                        }
                      },
                      onSubmit: (v) {
                        FocusScope.of(context).requestFocus(fullNameController);
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: EditTextWithSuffix(
                      controller: _emailController,
                      focusNode: emailFocusNode,
                      hintText: 'Email Address',
                      isObscure: false,
                      icon: Icons.email_outlined,
                      onChanged: (val) {},
                      validator: (args) {
                        if (args.toString().isEmpty) {
                          return 'Email Id is required';
                        } else if (isEmail(args!) == false) {
                          return 'Please Enter valid email id';
                        } else {
                          return "";
                        }
                      },
                      onSubmit: (v) {
                        FocusScope.of(context).requestFocus(emailFocusNode);
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: EditTextWithSuffix(
                      controller: _phoneNumberController,
                      focusNode: phoneNumberController,
                      hintText: 'Phone Number',
                      isObscure: false,
                      icon: Icons.phone,
                      onChanged: (val) {},
                      validator: (args) {
                        if (args.toString().isEmpty) {
                          return 'Phone Number is required';
                        } else if (validateMobile(args!) == false) {
                          return 'Please Enter valid Phone Number';
                        } else {
                          return "";
                        }
                      },
                      onSubmit: (v) {
                        FocusScope.of(context)
                            .requestFocus(phoneNumberController);
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: EditTextWithSuffix(
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      hintText: 'Password',
                      isObscure: false,
                      icon: Icons.password,
                      onChanged: (val) {},
                      validator: (args) {
                        if (args.toString().isEmpty) {
                          return 'Password must be required';
                        } else {
                          return "";
                        }
                      },
                      onSubmit: (v) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {

                        }
                      },
                      child: Container(
                        width: SizeConfig.screenWidth! * 0.85,
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Text(StringConstant.signUnButton,
                              style: AppTextStyle.txt16WTextStyle),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 30),
                    child: Row(
                      children: [
                        Text(
                          "Have an Account? ",
                          style: AppTextStyle.normalBG14Style,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const LoginPage());
                          },
                          child: Text(
                            StringConstant.signInButton,
                            style: AppTextStyle.normalBB14Style,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }

  bool isEmail(String str) {
    return Global.email.hasMatch(str.toLowerCase());
  }
}
