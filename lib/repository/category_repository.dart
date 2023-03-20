import "export_headers.dart";

class CategoryRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> getAllCategories() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(ApiUrl.getAllCategoryEndPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getSubjectByCategory(String catId) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(ApiUrl.getChildCategoryEndPoint + catId);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getChapterBySubject(String resId) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(ApiUrl.getResourceByChildEndPoint + resId);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
