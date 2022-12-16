import 'package:get/get.dart';
import 'package:theblue_crown/data/api/api_client.dart';
import 'package:theblue_crown/utils/app_constants.dart';

class MalaysiaTexaponRepo extends GetxService{
  final ApiClient apiClient;


  MalaysiaTexaponRepo({required this.apiClient});

  Future<Response> getMalaysiaTexaponList() async {
    return await apiClient.getData(AppConstants.MALAYSIA_TEXAPON_URI);
  }
}