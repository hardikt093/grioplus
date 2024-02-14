class ChangePasswordModel {
  final int? userId;
  final String? oldPassword;
  final String? password;

  ChangePasswordModel({
    this.userId,
    this.oldPassword,
    this.password,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
        userId: json["userId"],
        oldPassword: json["oldPassword"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "oldPassword": oldPassword,
        "password": password,
      };
}
