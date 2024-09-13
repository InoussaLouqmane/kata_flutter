import 'package:http_interceptor/http_interceptor.dart';
import 'package:kata_mobile_frontui/configs/sharedpreferences.dart';


class AddBearer implements InterceptorContract{

  final pos = SessionService();
  @override
  Future <BaseRequest> interceptRequest ({required  BaseRequest request}) async{
    try {
      String? token = await pos.getToken();
      request.headers['Authorization']= 'Bearer $token';
    } catch(e){
      print(e);
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) {
    // TODO: implement interceptResponse
    throw UnimplementedError();
  }

  @override
  Future<bool> shouldInterceptRequest()  {
     return  Future.value(true);
  }

  @override
  Future<bool> shouldInterceptResponse() {
    // TODO: implement interceptResponse
    return  Future.value(false);
  }
}