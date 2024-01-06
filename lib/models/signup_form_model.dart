class SignUpFormModel {
  String? name;
  String? email;
  String? password;
  String? pin;
  String? ktp;
  String? profilePicture;

  SignUpFormModel({
    this.name,
    this.email,
    this.password,
    this.pin,
    this.ktp,
    this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "pin": pin,
      "ktp": ktp,
      "profile_picture": profilePicture,
    };
  }

  SignUpFormModel copyWith({
    String? name,
    String? email,
    String? password,
    String? pin,
    String? ktp,
    String? profilePicture,
  }) =>
      SignUpFormModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        pin: pin ?? this.pin,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
      );
}
