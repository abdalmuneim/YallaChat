import 'package:yalla_chat/core/error/exceptions.dart';
import 'package:yalla_chat/core/util/fields.dart';
import 'package:yalla_chat/features/auth_feature/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:get_storage/get_storage.dart';

abstract class BaseAuthLocalDataSource {
  Future<UserModel> readUser();
  Future<Unit> writeUser({required UserModel user});
  Future<Unit> removeUser();
  Future<String> readToken();

  Future<Unit> writeToken({required String? token});
  Future<Unit> removeToken();
}

class AuthLocalDataSource implements BaseAuthLocalDataSource {
  final GetStorage getStorage;
  final FlutterSecureStorage flutterSecureStorage;

  AuthLocalDataSource({
    required this.getStorage,
    required this.flutterSecureStorage,
  });

  @override
  Future<UserModel> readUser() async {
    try {
      final data = await getStorage.read(Fields.userStorage);
      return Future.value(UserModel.fromJson(data));
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> removeUser() async {
    await getStorage.remove(Fields.userStorage);

    return Future.value(unit);
  }

  @override
  Future<Unit> writeUser({required UserModel user}) async {
    try {
      await getStorage.write(Fields.userStorage, user.toJson());
      return Future.value(unit);
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> removeToken() async {
    await flutterSecureStorage.delete(key: Fields.userStorage);

    return Future.value(unit);
  }

  @override
  Future<Unit> writeToken({required String? token}) async {
    try {
      await flutterSecureStorage.write(key: Fields.userStorage, value: token);
      return Future.value(unit);
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<String> readToken() async {
    try {
      final data = await flutterSecureStorage.read(key: Fields.userStorage);

      return Future.value(data);
    } catch (e) {
      throw UnauthorizedException();
    }
  }
}
