

class ProfileEndpointApiResponseModel {


  String  name ='';
   String   email ='';
   int  id  = 0 ;

ProfileEndpointApiResponseModel();


factory ProfileEndpointApiResponseModel.fromJson(Map <String, dynamic> json) {
  ProfileEndpointApiResponseModel user =ProfileEndpointApiResponseModel();
  user.id = json["id"];
  user.name = json["name"];
   user.email= json["email"];


  return user;

}
  //
  // {id: 3, name: simo2, email: simo2@gmail.com, email_verified_at: null, current_team_id: null, profile_photo_path: null,
  // created_at: 2021-11-08T21:19:07.000000Z,
  // updated_at: 2021-11-08T21:19:07.000000Z, profile_photo_url: https://ui-avatars.com/api/?name=simo2&color=7F9CF5&background=EBF4FF}







  //
  // User({
  //   required  this.name,
  //   required  this.email,
  //   required this.token
  //
  //
  // });

  // factory User.fromJson(Map <String, dynamic> json) {
  //   return User(
  //     name: json["user"]["name"],
  //     email: json["user"]["email"],
  //     token : json["token"],
  //   );

//}


}