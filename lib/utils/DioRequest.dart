import 'package:dio/dio.dart';
import 'package:hm_shop/contants/index.dart';

class Diorequest {
  final _dio = Dio();
  Diorequest() {
    _dio.options
      ..baseUrl = GolbalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GolbalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GolbalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GolbalConstants.TIME_OUT);
    _addInterceptors();
  }
  // 拦截器
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        // 请求拦截器
        onRequest: (reuest, handler) {
          handler.next(reuest);
        },
        // 响应拦截器
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        // 错误拦截器
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  // 封装 get 方法
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      dynamic res = await task;
      final data = res.data as Map<String, dynamic>; // data 是结构返回的数据
      if (data['code'] != GolbalConstants.SUCCESS_CODE) {
        throw Exception("数据加载异常");
      }
      return data['result'] as dynamic; // 返回数据
    } catch (e) {
      throw Exception("数据加载异常");
    }
  }
}

final diorequest = Diorequest();
