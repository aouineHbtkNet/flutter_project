class AdminLoginResponse {


  int id = 0;
  String name = '';
  String email = '';
  String token = '';

  AdminLoginResponse();

  factory AdminLoginResponse.fromJson(Map<String, dynamic> json) {
    AdminLoginResponse adminLoginResponse =
    AdminLoginResponse();
    adminLoginResponse.id = json["user"]["id"];
    adminLoginResponse.name = json["user"]["name"];
    adminLoginResponse.email = json["user"]["email"];
    adminLoginResponse.token = json["token"];

    return adminLoginResponse;
  }
}
