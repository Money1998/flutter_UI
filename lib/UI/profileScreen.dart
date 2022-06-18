import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Common/Global.dart';
import '../utils/AppColors.dart';
import '../utils/appTextStyle.dart';
import '../utils/screen.dart';
import '../utils/sessionManager.dart';
import '../utils/stringConstant.dart';
import 'LoginPage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double rating = 3.5;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  String? image;

  @override
  void initState() {
    super.initState();
    setTextFormFieldData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          profileUp(context),
          SingleChildScrollView(
            child: profileDetails(),
          ),
        ],
      ),
    );
  }

  Widget profileUp(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight! / 2,
        decoration: BoxDecoration(color: AppColors.blackColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.15,
            ),
            image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      image!,
                      height: 100.0,
                      width: 100.0,
                    ),
                  )
                : const CircularProgressIndicator(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.02,
            ),
            Text(firstNameController.text, style: AppTextStyle.txt28NTextStyle),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: SizeConfig.screenWidth! * 0.85,
                height: 60,
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(20.0)),
                child: InkWell(
                  onTap: () {
                    print("Click");
                    Global()
                        .isInternetConnectivityAvailable()
                        .then((internet) async {
                      if (internet) {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.clear();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (Route<dynamic> route) => false);
                      } else {
                        Global.showSnackBarMsg(
                            context, StringConstant.noInternetAvailable);
                      }
                    });
                  },
                  child: Center(
                    child: Text(StringConstant.logOutButton,
                        style: AppTextStyle.txt20WBTextStyle),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget profileDetails() {
    return Container(
      transform:
          Matrix4.translationValues(0, SizeConfig.screenHeight! / 2.3, 0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 10,
          color: AppColors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Details", style: AppTextStyle.txt22TextStyle),
                    const Icon(Icons.edit_note_sharp, size: 30),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(05.0),
                width: 320,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: AppColors.greyColor,
                  width: 1.0,
                ))),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "User Name",
                    style: AppTextStyle.normalBG14Style,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.50,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              SizedBox(
                height: 20,
                width: 320,
                child: TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  style: AppTextStyle.normalN16Style,
                  controller: firstNameController, //or null
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Email ID",
                    style: AppTextStyle.normalBG14Style,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.55,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              SizedBox(
                height: 20,
                width: 320,
                child: TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  style: AppTextStyle.normalN16Style,
                  controller: emailAddressController, //or null
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setTextFormFieldData() async {
    image = await SessionManager().getProfileImage();
    firstNameController.text = (await SessionManager().getName())!;
    emailAddressController.text = (await SessionManager().getEmailID())!;
    setState(() {});
  }
}
