import 'package:get/get.dart';

import '../base/base_response.dart';
import '../base/base_service.dart';
import '../core/constant/endpoints.dart';
import '../helper/network_manager.dart';
import '../model/request/user_login_request.dart';
import '../model/request/user_register_request.dart';
import '../model/response/user_login_response.dart';
import '../model/response/user_register_response.dart';

class AuthRepository extends BaseService {
  final NetworkManager _networkManager = Get.find();

  AuthRepository();

  Future<UserLoginResponse?> login(UserLoginRequest request) async {
    final response =
        await _networkManager.post(Endpoints.LOGIN, body: request.toJson());
    BaseResponse<UserLoginResponse> baseResponse = BaseResponse.fromJson(
        response.data, (json) => UserLoginResponse.fromJson(json));
    return baseResponse.data;
  }

  Future<UserRegisterResponse?> register(UserRegisterRequest request) async {
    final response =
        await _networkManager.post(Endpoints.REGISTER, body: request.toJson());
    BaseResponse<UserRegisterResponse> baseResponse = BaseResponse.fromJson(
        response.data, (json) => UserRegisterResponse.fromJson(json));
    return baseResponse.data;
  }
}
