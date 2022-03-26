int userPhoneNumber = 1234567890;
String productChoosed = 'vegetable';
String userJoinedDateStart = '';

// LOCATION
double userLatitude = 0.0;
double userLongitude = 0.0;
String userPincode = '';
String userCountry = '';
String userCity = '';
String userSubLocality = '';
String userStreet = '';

// ADDRESS
// add address details screen
String addAddressTopLocation1 = '$userStreet, $userSubLocality';
String addAddressTopLocation2 =
    '$userStreet, $userSubLocality, $userCity, $userPincode, $userCountry';
// address screen inputs
String userAddressFirstLineInput = '';
String userAddressSecondLineInput = '';
String userLandmarkInput = '';
// data passing between screens
String userDeliveryArea =
    '$userStreet, $userSubLocality, $userCity, $userPincode...';
// main address for us to delivery
String userDeliveryAddressImp = '';

// ORDERS
bool notEvenSingleOrderYet = true;
String userRecentOrderDate = '';
int userRecentOrderId = 654321;
