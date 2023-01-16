import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? userId;
  final String? userName;
  final String? userPhone;
  final String? userImage;
  final String? chattingWith;
  final String? aboutMe;
  final String? createdAt;
  final String? updateAt;
  final bool? blockedVoiceCall;
  final bool? blockedVideoCall;
  final bool? blockedChats;

  const User({
    this.userId,
    this.userName,
    this.userPhone,
    this.userImage,
    this.chattingWith,
    this.aboutMe,
    this.createdAt,
    this.updateAt,
    this.blockedChats,
    this.blockedVideoCall,
    this.blockedVoiceCall,
  });

  @override
  List<Object?> get props => [
        userId,
        userName,
        userPhone,
        userImage,
        chattingWith,
        aboutMe,
        createdAt,
        updateAt,
        blockedChats,
        blockedVideoCall,
        blockedVoiceCall,
      ];
}
