import 'package:mvvm_architecture_with_provider_with_restapi/data/network/base_api_services.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/data/network/network_api_services.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/resources/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = _apiServices.getPostApiResponse(AppUrl.loginApiUrl, data);
      return response;
    } catch (e) {
        rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = _apiServices.getPostApiResponse(AppUrl.registerApiUrl, data);
      return response;
    } catch (e) {
        rethrow;
    }
  }
}
