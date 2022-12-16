import 'package:get/get.dart';
import 'package:theblue_crown/data/repository/user_repo.dart';
import 'package:theblue_crown/models/response_model.dart';
import 'package:theblue_crown/models/user_model.dart';

class UserController extends GetxController implements GetxService {

  final UserRepo userRepo;

  UserController({
    required this.userRepo
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //old one
  // late UserModel _userModel;

  // new one
  UserModel? _userInfoModel;
  UserModel? get userInfoModel => _userInfoModel;


  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    print("||||||||||||||||||||||||||||||||||||test  " + response.body.toString());
    if (response.statusCode == 200) {
      _userInfoModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, "here in UserController " + response.statusText!);
      print("come here in user controller " + response.statusText!);
    }
    //_isLoading = false;
    update();
    return responseModel;
  }
}