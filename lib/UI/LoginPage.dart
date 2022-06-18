import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Common/API_Repository.dart';
import '../Common/Global.dart';
import '../Widget/EditTextWithSuffix.dart';
import '../utils/AppColors.dart';
import '../utils/appTextStyle.dart';
import '../utils/screen.dart';
import '../utils/stringConstant.dart';
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode(), passwordFocusNode = FocusNode();
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
            autovalidateMode: AutovalidateMode.disabled,
            child: SizedBox(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Welcome Back!",
                      style: AppTextStyle.txt20WBBTextStyle,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Please sign in to your account",
                      style: AppTextStyle.normalBG14Style,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(
                      "Forgot Password?",
                      style: AppTextStyle.normalBG14Style,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: InkWell(
                      onTap: () {
                        Global()
                            .isInternetConnectivityAvailable()
                            .then((internet) async {
                          if (internet) {
                            APIModuleRepository().checkCredentialAPI(
                                _emailController.text.trim(), context);
                          } else {
                            Global.showSnackBarMsg(
                                context, StringConstant.noInternetAvailable);
                          }
                        });
                      },
                      child: Container(
                        width: SizeConfig.screenWidth! * 0.85,
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Text(StringConstant.signInButton,
                              style: AppTextStyle.txt16WTextStyle),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: SizeConfig.screenWidth! * 0.85,
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.facebook, size: 30),
                            SizedBox(width: SizeConfig.screenWidth! * 0.05),
                            Text(StringConstant.signInWithFacebook,
                                style: AppTextStyle.normalN16Style),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 30),
                    child: Row(
                      children: [
                        Text(
                          "Don't have an Account? ",
                          style: AppTextStyle.normalBG14Style,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const SignUPPage());
                          },
                          child: Text(
                            StringConstant.signUnButton,
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
