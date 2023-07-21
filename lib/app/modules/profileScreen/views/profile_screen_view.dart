import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zesdro/app/utils/colors.dart';
import 'package:zesdro/app/utils/globalVariables.dart';

import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  ProfileScreenView({Key? key}) : super(key: key);

  double continerSize = Get.width - 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(height: 30,width: Get.width,),
              Container(
                      padding: (GlobalVariables.instance.user!.photoURL != "")
                          ? const EdgeInsets.all(80)
                          : const EdgeInsets.all(60),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ProjectColors.platinum,
                          image: (GlobalVariables.instance.user!.photoURL != "")
                              ? DecorationImage(
                                  image: NetworkImage(
                                      GlobalVariables.instance.user!.photoURL))
                              : null),
                      child: (GlobalVariables.instance.user!.photoURL != "")
                          ? Container()
                          : Text(
                              GlobalVariables.instance.user!.displayName[0],
                              style: TextStyle(
                                  fontSize: 100,
                                  fontWeight: FontWeight.bold,
                                  color: ProjectColors.richBlack),
                            ),
                    ),
              const SizedBox(height: 20,),
              Text(
                              GlobalVariables.instance.user!.displayName,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: ProjectColors.richBlack),
                            ),
              Text(
                              GlobalVariables.instance.user!.email,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: ProjectColors.richBlack),
                            ),
              const SizedBox(height: 20,),
              ...List.generate(100~/3, (index) => Row(
                children: [
                  Container(
                    width: continerSize/3,
                    height: continerSize/3,
                    decoration: BoxDecoration(
                      color: ProjectColors.platinum,
                      border: Border.all(color: ProjectColors.white)
                    ),
                  ),
                  Container(
                    width: continerSize/3,
                    height: continerSize/3,
                    decoration: BoxDecoration(
                      color: ProjectColors.platinum,
                      border: Border.all(color: ProjectColors.white)
                    ),
                  ),
                  Container(
                    width: continerSize/3,
                    height: continerSize/3,
                    decoration: BoxDecoration(
                      color: ProjectColors.platinum,
                      border: Border.all(color: ProjectColors.white)
                    ),
                  ),
                ],
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
