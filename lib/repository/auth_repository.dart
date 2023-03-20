import 'package:pdfclass/data/api_url.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future signIn(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(ApiUrl.signInEndpoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future signUp(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(ApiUrl.signupEndpoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
