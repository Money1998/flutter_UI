import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String isLoginKey = "isLogin";
  final String email = "email";
  final String profileUrl = "profileUrl";
  final String userName = "userName";

//set Login Flag
  Future<void> setIsLogin(bool isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLoginKey, isLogin);
  }

//get Login Flag
  Future<bool?> getIsLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLogin;
    isLogin = pref.getBool(isLoginKey) ?? false;
    return isLogin;
  }

//set EmailID
  Future<void> setEmailID(String emailId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(email, emailId);
  }

//get EmailID
  Future<String?> getEmailID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? emailId;
    emailId = pref.getString(email) ?? '';
    return emailId;
  }

  //set Profile URl
  Future<void> setProfileImage(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(profileUrl, url);
  }

  //get Profile URl
  Future<String?> getProfileImage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? url;
    url = pref.getString(profileUrl) ?? '';
    return url;
  }

  //set user Name
  Future<void> setName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userName, name);
  }

  //get user Name
  Future<String?> getName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? name;
    name = pref.getString(userName) ?? '';
    return name;
  }
}
