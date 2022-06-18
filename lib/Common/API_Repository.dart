import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dribble/Model/LoginModel/LoginResponse.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UI/LoginPage.dart';
import '../UI/profileScreen.dart';
import '../utils/sessionManager.dart';
import '../utils/stringConstant.dart';
import 'Global.dart';

BaseOptions dioBaseOptions = BaseOptions(
  baseUrl: StringConstant.baseUrl,
  headers: {"Content-Type": "application/json"},
  connectTimeout: 10000,
  receiveTimeout: 10000,
);

class APIModuleRepository {
  Dio dio = Dio(dioBaseOptions);

  Future<dynamic> initialCallAPI(BuildContext context) async {
    String uri = 'bins/gbt5';
    try {
      var response = await dio.get(uri);
      if (kDebugMode) {
        print(response.data);
        var responseDetails = (json.decode(response.data));
        LoginData service = LoginData.fromJson(responseDetails);
        if (service.data != null) {
          SessionManager().setProfileImage(service.data!.profilePic!);
          SessionManager().setName(service.data!.name!);
          SessionManager().setEmailID(service.data!.emailId!);
          Get.to(const LoginPage());
        } else {}
      }
    } catch (e) {
      e.toString();
    }
  }

//initialCallAPI//
  Future<dynamic> offlineCallAPI(BuildContext context) async {
    var data =
        '{"data":{"profile_pic":"https://images.pexels.com/photos/10012559/pexels-photo-10012559.jpeg","name":"technource","email_id":"technource@gmail.com"}}';
    try {
      var responseDetails = (json.decode(data));
      LoginData service = LoginData.fromJson(responseDetails);
      if (service.data != null) {
        SessionManager().setProfileImage(service.data!.profilePic!);
        SessionManager().setName(service.data!.name!);
        SessionManager().setEmailID(service.data!.emailId!);
        Get.to(const LoginPage());
      } else {}
    } catch (e) {
      e.toString();
    }
  }

//offlineCallAPI//

  Future<String> checkCredentialAPI(
      String currentEmail, BuildContext context) async {
    var saveEmail = await SessionManager().getEmailID();
    if (currentEmail.isNotEmpty && currentEmail == saveEmail) {
      SessionManager().setIsLogin(true);
      Global.showSnackBarMsg(context, StringConstant.successMsg);
      Get.to(const ProfileScreen());
    } else {
      Global.showSnackBarMsg(context, StringConstant.errorMsg);
    }

    return "response.body";
  }

//otpVerify API//

}
