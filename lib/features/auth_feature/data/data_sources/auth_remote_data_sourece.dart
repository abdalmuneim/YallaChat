import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io' as io;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/app_constants.dart';
import 'package:yalla_chat/core/resources/toast_manager.dart';
import 'package:yalla_chat/core/util/fields.dart';
import 'package:yalla_chat/features/auth_feature/data/model/user_model.dart';
import 'package:yalla_chat/features/auth_feature/domain/repositories/auth_collections.dart';

abstract class BaseAuthRemoteDataSource {
  Future<void> register({
    required String userPhone,
  });
  Future<bool> verifyOTP({
    required String otp,
    required UserModel userModel,
  });
  Future<String> uploadImageFile({
    required String phone,
    required io.File userImage,
  });
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// come from firebase
  static String _verificationId = '';

  /// come from firebase
  static int? _forceResendingToken;

  /// register
  @override
  Future<void> register({
    required String userPhone,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: userPhone,
      codeSent: (String verificationId, int? forceResendingToken) {
        _verificationId = verificationId;
        _forceResendingToken = forceResendingToken;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
      timeout: const Duration(seconds: AppConstants.timeOut),
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {
        if (error.code == Fields.invalidPhoneNumber) {
          ToastManager.showError(LocaleKeys.timeOut.tr);
        } else {
          ToastManager.showError(LocaleKeys.error.tr);
        }
      },
    );
  }

  @override
  Future<bool> verifyOTP({
    required String otp,
    required UserModel userModel,
  }) async {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      ),
    );

    /// add user to collection
    if (credential.user != null) {
      //Check if already Sign Up
      final QuerySnapshot resultQuery = await FirebaseFirestore.instance
          .collection(Fields.users)
          .where(Fields.userId, isEqualTo: userModel.userId)
          .get();

      final List<DocumentSnapshot> documentSnapshot = resultQuery.docs;

      /// if not add before
      if (documentSnapshot.isEmpty) {
        ///
        await _addUserToCollection(
            uid: credential.user!.uid, userModel: userModel);
      } else {
        ToastManager.showError(LocaleKeys.welcomeBack.tr);
      }
    }
    return credential.user != null ? true : false;
  }

  /// add user to collection firebase
  _addUserToCollection({
    required String uid,
    required UserModel userModel,
  }) async {
    await AuthCollectionsFireStore().addUserDataToFireStore(
      UserModel(
        userId: uid,
        userName: userModel.userName,
        userPhone: userModel.userPhone,
        createdAt: userModel.createdAt,
        userImage: userModel.userImage,
        aboutMe: userModel.aboutMe,
        chattingWith: userModel.chattingWith,
        updateAt: userModel.updateAt,
        blockedChats: userModel.blockedChats,
        blockedVideoCall: userModel.blockedVideoCall,
        blockedVoiceCall: userModel.blockedVoiceCall,
      ),
    );
  }

  /// upload user image
  @override
  Future<String> uploadImageFile(
      {required String phone, required io.File userImage}) async {
    String? imageURL;
    try {
      String filename = DateTime.now().microsecondsSinceEpoch.toString();

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('Users Images$phone').child(filename);

      await ref.putFile(userImage);

      return await ref.getDownloadURL();
    } catch (e) {
      ToastManager.showError(LocaleKeys.error.tr);
      return '';
    }
  }
}
