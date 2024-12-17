/// message : "success"
/// user : {"name":"Amira","email":"amira156@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZmU0YTg0YzVjYzdkNmNjYTEzYmY5ZiIsIm5hbWUiOiJBbWlyYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI3OTQxMjUzLCJleHAiOjE3MzU3MTcyNTN9.oLwqaF6an6xs_G01PfcAXPBJd99bAMbTvkOq7JJ1I5Y"

class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.statusMsg,
    this.user,
    this.token,
  });

  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;
}

/// name : "Amira"
/// email : "amira156@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
