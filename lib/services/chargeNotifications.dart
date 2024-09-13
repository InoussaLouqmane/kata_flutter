import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:kata_mobile_frontui/Interceptors/interceptors.dart';
import 'package:kata_mobile_frontui/models/AccountRequestModel.dart';
import 'package:kata_mobile_frontui/constants/app_strings.dart';

Future<List<AccountRequestModel>> fetchAccountRequestList() async {
  try {
    final client = InterceptedClient.build(interceptors: [AddBearer()]);
    final url = Uri.http(AppConstants.SERVER_API_URL, AppConstants.ACCOUNT_REQUEST_FETCH_LIST);

    final response = await client.get(url, headers: AppConstants.requestHeader);

    if (response.statusCode == 200) {
      final response = await client.get(url, headers: AppConstants.requestHeader);
      final Map<String, dynamic> parsedJson = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> parsedJsonList = parsedJson['data']['data'] as List;
      final List<AccountRequestModel> accountRequests = parsedJsonList.map(
              (json) => AccountRequestModel.fromJson(json as Map<String, dynamic>)
      ).toList();
      if (kDebugMode) {
        print(response.body);
      }

      return accountRequests;
    } else {
      throw Exception('Failed to fetch account requests');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching account requests: $e');
    }
    return [];
  }
}
