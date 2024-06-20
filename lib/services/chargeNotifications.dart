


import 'package:flutter/foundation.dart';

import '../constants/app_strings.dart';

fetchAccountRequestList(){
  final url = Uri.http(AppConstants.SERVER_API_URL, AppConstants.ACCOUNT_REQUEST_FETCH_LIST);
try{

}catch(e){
  if (kDebugMode) {
    print(e);
  }
}
}