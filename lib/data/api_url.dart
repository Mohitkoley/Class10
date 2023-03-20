class ApiUrl {
  static var baseUrl = "https://classten.onrender.com";

  static var signInEndpoint = "$baseUrl/api/signin"; //1
  static var signupEndpoint = "$baseUrl/api/signup"; //2
  static var getAllCategoryEndPoint = "$baseUrl/api/getAllCategory"; //3
  static var getChildCategoryEndPoint = "$baseUrl/api/getChildByCategory/"; //4
  static var getResourceByChildEndPoint =
      "$baseUrl/api/getResourceByChild/"; //4
}
