class AppConstants{
  final String token;
  AppConstants({required this.token}){}

  static const String SERVER_API_URL = "10.0.2.2:8000";

  static const requestHeader = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  static const authorizationRequestHeader = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  static const authorizedRequestHeader = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

  static const String LOGIN_URL = '/api/login';

  static const String ACCOUNT_REQUEST_POSTULATE = '/api/ac-postulate';

  static const String ACCOUNT_REQUEST_FETCH_LIST = "/api/ac-list";
}