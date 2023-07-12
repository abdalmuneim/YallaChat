import 'package:yalla_chat/core/util/fields.dart';
import 'package:yalla_chat/features/auth_feature/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthCollectionsFireStore {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection(Fields.users);

  Future<void> addUserDataToFireStore(UserModel userModel) async {
    return await _userCollectionReference
        .doc(userModel.userId.toString())
        .set(userModel.toMap());
  }

  String getUserData(String uid) {
    return _userCollectionReference.doc(uid).get().toString();
  }

  Future<void> updateUserDataToFireStore(UserModel userModel) async {
    return await _userCollectionReference
        .doc(userModel.userId.toString())
        .update(userModel.toMap());
  }
}
