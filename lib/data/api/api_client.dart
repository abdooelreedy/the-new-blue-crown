import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theblue_crown/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late SharedPreferences sharedPreferences;

  ApiClient({
    required this.appBaseUrl, required this.sharedPreferences,
   }){
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 20);
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? "";
    _mainHeaders = {
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token',
      'Connection' : 'Keep-Alive',
      "HttpHeaders.contentTypeHeader": "application/json",
      "Accept": "application/json"
    };
  }

  void updateHeader(String token){
    _mainHeaders = {
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token',
      'Connection' : 'Keep-Alive',
      "HttpHeaders.contentTypeHeader": "application/json",
      "Accept": "application/json"
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers})async{
    try{
      Response response = await get(
        uri,
        // contentType: contentType,
        // query: query,
        headers: headers ?? _mainHeaders,
        // headers: {
        //   'Content-type' : 'application/json; charset=UTF-8',
        //   'Authorization' : 'Bearer $token',
        // },
        // decoder: decoder,
      );
      print("here in api_client" + response.body.toString());
      // response = handleResponse(response);
      return response;
    }catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    print(body.toString());
    try{
      Response response = await post(uri, body, headers: _mainHeaders);
      // response = handleResponse(response);
      print("here in api_client postData : " + response.toString());
      print("++++++++++++++++++++ token is : " + token.toString());
      return response;
    }catch(e){
      print("here in api_client postData in else: " + e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // Future<Object> postLike(int id) async {
  //   try{
  //     var response =  http.post(
  //         Uri.parse('http://192.168.1.6:8000/api/v1/post/comment/like/$id'),
  //         headers: _mainHeaders
  //     );
  //     return response;
  //   }catch(e){
  //     return Response(statusCode: 1, statusText: e.toString());
  //   }
  // }

}