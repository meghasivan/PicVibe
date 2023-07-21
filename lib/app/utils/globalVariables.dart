import 'package:zesdro/app/model/userModel.dart';
import 'package:zesdro/app/utils/dbHelper.dart';

class GlobalVariables{

  UserModel? user;
  late ObjectBox objectbox;

  GlobalVariables._();
  static final instance = GlobalVariables._();
}