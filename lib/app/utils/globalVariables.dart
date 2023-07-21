import 'package:google_sign_in/google_sign_in.dart';
import 'package:zesdro/app/model/userModel.dart';
import 'package:zesdro/app/utils/dbHelper.dart';

class GlobalVariables{

  UserModel? user;
  late ObjectBox objectbox;
  GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

  GlobalVariables._();
  static final instance = GlobalVariables._();
}