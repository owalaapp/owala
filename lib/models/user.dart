class User {
  String id;
  final String userFullName;
  final String userPhoneNumber;
  final String userCountry;
  final String userPinCode;
  final String userCity;
  final String userDateJoined;

  User(
      {required this.userCountry,
      required this.userPinCode,
      required this.userCity,
      required this.userDateJoined,
      required this.userPhoneNumber,
      this.id = '',
      required this.userFullName});

  Map<String, dynamic> toJson() => {
        'id': id,
        'full-name': userFullName,
        'phone-number': userPhoneNumber,
        'date-joined': userDateJoined,
        'city': userCity,
        'pincode': userPinCode,
        'country': userCountry,
      };
}
