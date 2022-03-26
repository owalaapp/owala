class User {
  String id;
  final String userFullName;
  final String userPhoneNumber;
  final String userCountry;
  final String userPinCode;
  final String userDateJoined;
  final String recentOrderItem;
  final String recentOrderDateTime;
  final int recentOrderPrice;
  final String recentOrderStatus;
  final String deliveryAddress;
  // final bool accountCreatedSuccessfully;
  final bool lastOrderSuccessful;

  User(
      {required this.deliveryAddress,
      required this.userCountry,
      required this.userPinCode,
      required this.recentOrderItem,
      required this.recentOrderDateTime,
      required this.recentOrderPrice,
      // required this.accountCreatedSuccessfully,
      required this.userDateJoined,
      required this.recentOrderStatus,
      required this.userPhoneNumber,
      required this.lastOrderSuccessful,
      this.id = '',
      required this.userFullName});

  Map<String, dynamic> toJson() => {
        'id': id,
        'full-name': userFullName,
        'phone-number': userPhoneNumber,
        'date-joined': userDateJoined,
        // 'account-created-succesfully': accountCreatedSuccessfully,
        'last-order-succeed': lastOrderSuccessful,
        'pincode': userPinCode,
        'recent-order-price': recentOrderPrice,
        'country': userCountry,
        'recent-order-item': recentOrderItem,
        'recent-order-date': recentOrderDateTime,
        'recent-order-status': recentOrderStatus,
        'delivery-address': deliveryAddress
      };
}
