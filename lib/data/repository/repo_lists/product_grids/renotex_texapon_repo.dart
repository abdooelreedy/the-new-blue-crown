import 'package:get/get.dart';
import 'package:theblue_crown/data/api/api_client.dart';
import 'package:theblue_crown/utils/app_constants.dart';

class RenotexTexaponRepo extends GetxService{
  final ApiClient apiClient;


  RenotexTexaponRepo({required this.apiClient});

  Future<Response> getRenotexTexaponList() async {
    return await apiClient.getData(AppConstants.RENOTEX_TEXAPON_URI);
  }
}