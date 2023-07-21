import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zesdro/app/model/userDBModel.dart';
import 'package:zesdro/app/model/userModel.dart';
import 'package:zesdro/app/routes/app_pages.dart';
import 'package:zesdro/app/utils/dbHelper.dart';
import 'package:zesdro/app/utils/globalVariables.dart';
import 'package:zesdro/app/utils/text.dart';

class LoginScreenController extends GetxController {
  UserModel? user;

  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> handleSignIn() async {
    try {
      GoogleSignInAccount? data = await googleSignIn.signIn();
      if (data != null) {
        int id = GlobalVariables.instance.objectbox.checkUserExist(data.email);
        if(id == 0){
          id = await GlobalVariables.instance.objectbox.addUser(UserDetails(displayName : data.displayName ?? "",
          email : data.email,
          uid : data.id,
          photoURL : data.photoUrl ?? "",));
        }

        user = UserModel(
          data.displayName ?? "",
          data.email,
          data.id,
          data.photoUrl ?? "",
          id
        );
        GetStorage().write(TextData.user, user!.toMap());
        GlobalVariables.instance.user = user;

        Get.offNamed(Routes.HOME);
      } else {
        Get.showSnackbar(const GetSnackBar(title: "Something went wrong"));
      }
    } catch (error) {
      print(error);
      Get.showSnackbar(const GetSnackBar(title: "Something went wrong"));
    }
  }
}
