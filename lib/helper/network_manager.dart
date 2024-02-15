
import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/get_utils.dart';

import '../base/base_service.dart';
import '../core/constant/endpoints.dart';
import '../core/constant/storage.dart';
import 'storage_manager.dart';

class NetworkManager extends BaseService {
  final StorageManager _storageManager = Get.find();
  static final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    _dio.options.baseUrl = Endpoints.API_BASE_URL;
    _dio.options.sendTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.interceptors.add(_interceptorsWrapper());
  }

  InterceptorsWrapper _interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        String? token = _storageManager.getData(StorageConstant.AUTH_KEY);
        options.headers.addAll({
          "Authorization": "Bearer $token",
          "Accept-Language": Get.locale,
        });
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        return handler.next(e);
      },
    );
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool authorization = false,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Response> post(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool authorization = false,
  }) async {
    final response =
        await _dio.post(url, data: body, options: Options(headers: headers));
    return response;
  }

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
    bool authorization = false,
  }) async {
    try {
      // print('[API Dio Helper - POST] Server Request: $body');

      final response = await _dio.delete(
        url,
        data: body,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - POST] Server Response: ' + res);

      return response;
    } on DioException catch (e) {
      // print('[API Dio Helper - POST] Connection Exception => ' + e.message);

      // if (e.response.statusCode == 401) {
      //   Modular.to.pushReplacementNamed(Routers.userLogin);
      // }

      if (e.response?.data != null) throw Exception(e.response!.data);

      throw Exception(e.message);
    }
  }

  Future<Response> put(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool authorization = false,
  }) async {
    try {
      // print('[API Dio Helper - POST] Server Request: $body');

      final response =
          await _dio.put(url, data: body, options: Options(headers: headers));

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - POST] Server Response: ' + res);

      return response;
    } on DioException catch (e) {
      // print('[API Dio Helper - POST] Connection Exception => ' + e.message);

      // if (e.response.statusCode == 401) {
      //   Modular.to.pushReplacementNamed(Routers.userLogin);
      // }

      if (e.response?.data != null) throw Exception(e.response!.data);

      throw Exception(e.message);
    }
  }

  // String? _exceptionHandler(DioException e) {
  //   if (e.response == null) {
  //     if (e.type == DioExceptionType.connectionTimeout) {
  //       return "İstek zaman aşımına uğradı. Lütfen daha sonra tekrar deneyin.";
  //     } else if (e.type == DioExceptionType.sendTimeout) {
  //       return "Lütfen internet bağlantınızı kontrol ederek tekrar deneyin";
  //     } else if (e.type == DioExceptionType.receiveTimeout) {
  //       return "Sunuculardaki yoğunluk sebebiyle şu an işleminize cevap veremiyoruz.\nLütfen daha sonra tekrar deneyin.";
  //     } else {
  //       return "Bilinmeyen bir hata oluştu";
  //     }
  //   } else if (e.response?.data['messages'] == null) {
  //     switch (e.response?.statusCode) {
  //       case HttpStatus.unauthorized:
  //         return "Bu bilgiler ile giriş yapılamıyor.\nLütfen tekrar giriş yapmayı deneyin veya şirenizi unuttuysanız\nşifremi sıfırla seçeneği ile şifrenizi sıfırlayabilirsiniz. ";
  //       case HttpStatus.forbidden:
  //         return "Bu alana erişim yetkiniz bulunmamaktadır.\nHesabınızın doğrulandığından emin olun.\nEğer sorun devam ederse bizimle iletişime geçebilirsiniz.";
  //       case HttpStatus.badRequest:
  //         return "Lütfen bilgilerinizi kontrol ederek tekrar deneyin";
  //       case HttpStatus.notFound:
  //         return "Erişmek istediğiniz sayfa bulunamadı.";
  //       default:
  //         return "Bilinmeyen bir hata oluştu";
  //     }
  //   } else {
  //     try {
  //       String? error;
  //       BaseResponse response =
  //           BaseResponse.fromJson(e.response!.data, (json) => null);
  //       response.messages?.forEach((element) {
  //         if (error == null) {
  //           error = element;
  //         } else {
  //           error = "$error\n$element";
  //         }
  //       });
  //       return error ?? (throw Exception());
  //     } catch (e) {
  //       return "Bilinmeyen bir hata oluştu";
  //     }
  //   }
  // }
}
