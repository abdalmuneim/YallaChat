import 'dart:convert';

import 'package:yalla_chat/core/util/fields.dart';
import 'package:yalla_chat/features/auth_feature/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    super.userId,
    super.userName,
    super.userPhone,
    super.createdAt,
    super.userImage,
    super.aboutMe,
    super.chattingWith,
    super.updateAt,
    super.blockedChats,
    super.blockedVoiceCall,
    super.blockedVideoCall,
    this.token,
  });

  final String? token;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Fields.userId: userId,
      Fields.userName: userName,
      Fields.userPhone: userPhone,
      Fields.userImage: userImage,
      Fields.createdAt: createdAt,
      Fields.aboutMe: aboutMe,
      Fields.chattingWith: chattingWith,
      Fields.updateAt: updateAt,
      Fields.blockedChats: blockedChats,
      Fields.blockedVideoCall: blockedVideoCall,
      Fields.blockedVoiceCall: blockedVoiceCall,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map[Fields.userId] as String,
      userName: map[Fields.userName] as String,
      userPhone: map[Fields.userPhone] as String,
      userImage: map[Fields.userImage] as String,
      token: map[Fields.token] != null ? map[Fields.token] as String : null,
      createdAt: map[Fields.createdAt] as String,
      aboutMe: map[Fields.aboutMe] as String,
      chattingWith: map[Fields.chattingWith] as String,
      updateAt: map[Fields.updateAt] as String,
      blockedChats: map[Fields.blockedChats] as bool,
      blockedVideoCall: map[Fields.blockedVideoCall] as bool,
      blockedVoiceCall: map[Fields.blockedVoiceCall] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
