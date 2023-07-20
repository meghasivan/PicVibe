import 'package:zesdro/app/model/userModel.dart';

class GlobalVariables{

  UserModel? user;

  GlobalVariables._();
  static final instance = GlobalVariables._();
}