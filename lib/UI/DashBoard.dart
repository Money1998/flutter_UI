import 'package:dribble/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Common/API_Repository.dart';
import '../Common/Global.dart';
import '../utils/AppColors.dart';
import '../utils/appTextStyle.dart';
import '../utils/sessionManager.dart';
import '../utils/stringConstant.dart';
import 'profileScreen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(StringConstant.dribbleImageURL),
            fit: BoxFit.cover,
          ),
        ),
        //color: AppColors.blackColor,
        child: Column(
          children: [
            Expanded(flex: 5, child: Container()),
            Expanded(
                flex: 0,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Align(
                        alignment: FractionalOffset.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'spider.',
                            style: AppTextStyle.txt28WBTextStyle,
                          ),
                        )),
                  ),
                ])),
            Expanded(
                flex: 1,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Align(
                        alignment: FractionalOffset.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            StringConstant.dashContent,
                            style: AppTextStyle.normalStyle,
                          ),
                        )),
                  ),
                ])),
            Expanded(
              child: InkWell(
                onTap: () {
                  Global()
                      .isInternetConnectivityAvailable()
                      .then((internet) async {
                    if (internet) {
                      bool? isLogin = await SessionManager().getIsLogin();
                      //APIModuleRepository().initialCallAPI(context);
                      if (isLogin!) {
                        Get.to(const ProfileScreen());
                      } else {
                        APIModuleRepository().offlineCallAPI(context);
                      }
                    } else {
                      Global.showSnackBarMsg(
                          context, StringConstant.noInternetAvailable);
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    width: SizeConfig.screenWidth! * 0.85,
                    height: 60,
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Text(StringConstant.getStarted,
                          style: AppTextStyle.txt16WTextStyle),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
