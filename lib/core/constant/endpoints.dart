// ignore_for_file: constant_identifier_names

class Endpoints {
  Endpoints._();
  static const String API_BASE_URL = TEST_BASE;
  static const String TEST_BASE = "http://localhost:8080/api/v1/";
  static const String PRODUCTION_BASE = "https://xxx.com/api/v1/";
  static const String SOCKET_URL = "http://localhost:6666";
  ////////----------------*********----------------////////
  ////////----------------*********----------------////////
  static const String LOGIN = "/auth/login";
  static const String REGISTER = "/auth/register";
}
