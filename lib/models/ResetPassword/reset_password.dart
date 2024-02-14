class ResetPasswordModel {
  final String? email;

  ResetPasswordModel({
    this.email,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
