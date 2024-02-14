class UserInfoModel {
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  int? id;
  String? profileImage;

  UserInfoModel({
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.id,
    this.profileImage,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
    mobile: json["mobile"],
        id: json["id"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "mobile": mobile,
        "id": id,
        "profileImage": profileImage,
      };
}
