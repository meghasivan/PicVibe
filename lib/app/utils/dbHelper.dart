import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:picvibe/app/utils/globalVariables.dart';

import '../model/imageFiles.dart';
import '../model/userDBModel.dart';
import '../../objectbox.g.dart';

class ObjectBox {
  late final Store _store;

  late final Box<UserDetails> _userDetailsBox;
  late final Box<ImageFiles> _imageFileBox;

  ObjectBox._create(this._store) {
    _userDetailsBox = Box<UserDetails>(_store);
    _imageFileBox = Box<ImageFiles>(_store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final store = await openStore(
        directory: p.join(
            (await getApplicationDocumentsDirectory()).path, "obx-picvibe"));
    return ObjectBox._create(store);
  }

  Stream<List<ImageFiles>> getImages() {
    final builder = _imageFileBox
        .query(ImageFiles_.uid.equals(GlobalVariables.instance.user!.uid))
        .order(ImageFiles_.id, flags: Order.descending);

    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Future<void> addImage(ImageFiles imageFiles) =>
      _imageFileBox.putAsync(imageFiles);
  updateImage(ImageFiles imageFiles) => _imageFileBox.put(imageFiles);
  Future<void> removeImage(int id) => _imageFileBox.removeAsync(id);
  Future<int> addUser(UserDetails userDetails) =>
      _userDetailsBox.putAsync(userDetails);
  checkUserExist(String email) {
    final builder = _userDetailsBox.query(UserDetails_.email.equals(email));
    var data = builder.build().find();
    if (data.isEmpty) {
      return 0;
    } else {
      return data[0].id;
    }
  }
}
