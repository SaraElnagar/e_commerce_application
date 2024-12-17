import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';

/// message : "success"
/// user : {"name":"Amira","email":"amira155@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZmU1YjM5ZjlkNDk2Nzc4MjlhZDZmZSIsIm5hbWUiOiJBbWlyYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI3OTQ1NTMwLCJleHAiOjE3MzU3MjE1MzB9.TDxeaSdNg2MRUeGCjDVwFeaPvPX0-AG11x8jcp5ElyY"

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
    super.message,
    super.statusMsg,
    super.user,
    super.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? LoginUserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

/// name : "Amira"
/// email : "amira155@gmail.com"
/// role : "user"

class LoginUserDto extends LoginUserEntity {
  LoginUserDto({
    super.name,
    super.email,
    this.role,
  });

  LoginUserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
