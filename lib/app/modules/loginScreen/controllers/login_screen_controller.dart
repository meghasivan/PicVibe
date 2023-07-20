import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zesdro/app/model/userModel.dart';
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
        user = UserModel(
          data.displayName ?? "",
          data.email,
          data.id,
          data.photoUrl ?? "",
        );
        GetStorage().write(TextData.user, user!.toMap());
        GlobalVariables.instance.user = user;
      }
    } catch (error) {
      print(error);
    }
  }
}
