import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

/// message : "success"
/// user : {"name":"Amira","email":"amira155@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZmU1YjM5ZjlkNDk2Nzc4MjlhZDZmZSIsIm5hbWUiOiJBbWlyYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI3OTQ1NTMwLCJleHAiOjE3MzU3MjE1MzB9.TDxeaSdNg2MRUeGCjDVwFeaPvPX0-AG11x8jcp5ElyY"

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
    super.message,
    super.statusMsg,
    super.user,
    super.token,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

/// name : "Amira"
/// email : "amira155@gmail.com"
/// role : "user"

class UserDto extends UserEntity {
  UserDto({
    super.name,
    super.email,
    this.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
