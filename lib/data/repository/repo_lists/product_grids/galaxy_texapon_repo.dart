import 'package:get/get.dart';
import 'package:theblue_crown/data/api/api_client.dart';
import 'package:theblue_crown/utils/app_constants.dart';

class GalaxyTexaponRepo extends GetxService{
  final ApiClient apiClient;


  GalaxyTexaponRepo({required this.apiClient});

  Future<Response> getGalaxyTexaponList() async {
    return await apiClient.getData(AppConstants.GALAXY_TEXAPON_URI);
  }
}