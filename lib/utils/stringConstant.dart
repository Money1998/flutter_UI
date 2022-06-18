class StringConstant {
  static int? userID;
  static String baseUrl = 'https://myjson.dit.upm.es/api/';

  //baseUrl set//
  static String dashContent =
      "Watch your favorite movies or series on\n   only one platform. You can watch it\n             anytime and anywhere.";
  static String signInButton = "Sign In";
  static String signUnButton = "Sign Up";
  static String logOutButton = "Log Out";
  static String signInWithFacebook = "Sign In with Facebook";
  static String getStarted = "Get Started";

  static String pushToken = '';
  static String dribbleImageURL = 'assets/spider.jpg';
  static String splashImageURL = 'assets/spider_splash.jpg';

  //bottom bar body text //
  static String noRequestAvailable = "No Request available";
  static String noInternetAvailable = "NO Internet available";
  static String errorMsg = "Chek your Email or Password";
  static String successMsg = "Credential Match";
  static String enterPhoneNumber = 'Phone Number';

  static String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return '';
  }
}
