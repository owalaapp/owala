class User {


}


String userName = '';
int userPhoneNumber = 1234567890;
String productChoosed = 'vegetable';


// Location
double userLatitude =   0.0;
double userLongitude = 0.0;
String userPincode = '';
String userCountry = '';
String userCity = '';
String userSubLocality = '';
String userStreet = '';
bool notEvenSingleOrderYet = true;

String userAddressFirstLineInput = '';
String userAddressSecondLineInput = '';
String userLandmarkInput = '';

// Order
int userRecentOrderId = 654321;
String userRecentOrderDate = '';

String userCompleteAddress = '$userStreet, $userSubLocality, $userCity, $userPincode, $userCountry';
String userDeliveryArea = '$userStreet, $userSubLocality, $userCity, $userPincode...';
String addAddressTopLocation = '$userStreet, $userSubLocality';


String userFinalComplteAddress = '$userAddressFirstLineInput, $userAddressSecondLineInput, Near $userLandmarkInput,  $userSubLocality, $userCity, $userPincode, $userCountry';


