class UserModel {
  int? id;
  String? name;
  String? email;
  String? username;
  String? profilPicture;
  String? password;
  String? ktp;
  int? verified;
  String? cardNumber;
  String? pin;
  int? balance;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.ktp,
    this.profilPicture,
    this.password,
    this.verified,
    this.cardNumber,
    this.pin,
    this.balance,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        profilPicture: json["profile_picture"],
        ktp: json["ktp"],
        verified: json["verified"],
        cardNumber: json["card_number"],
        pin: json["pin"],
        balance: json["balance"],
        token: json["token"],
      );

  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        username: username ?? this.username,
        ktp: ktp,
        profilPicture: profilPicture,
        password: password ?? this.password,
        verified: verified,
        cardNumber: cardNumber,
        pin: pin ?? this.pin,
        balance: balance ?? this.balance,
        token: token,
      );
}
