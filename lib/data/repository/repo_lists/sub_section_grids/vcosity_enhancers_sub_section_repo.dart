import 'package:get/get.dart';
import 'package:theblue_crown/data/api/api_client.dart';
import 'package:theblue_crown/utils/app_constants.dart';

class ViscosityEnhancersSubSectionRepo extends GetxService{
  final ApiClient apiClient;


  ViscosityEnhancersSubSectionRepo({required this.apiClient});

  Future<Response> getViscosityEnhancersSubSectionList() async {
    return await apiClient.getData(AppConstants.VISCOSITYENHANCERSSUBSECTION_URI);
  }
}