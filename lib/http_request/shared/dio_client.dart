///  `validateStatus` 决定http响应状态码是否被dio视为请求成功， 返回`validateStatus`
///  返回`true` , 请求结果就会按成功处理，否则会按失败处理.
import 'package:connectivity/connectivity.dart';

///dart:convert - 解码和编码JSON、UTF-8等等
import 'package:dio/dio.dart';
import './dio_config.dart';
import 'dart:convert';
import '../interceptors/error_handle.dart';
import 'package:my_router_flutter/http/dio/dio_config/error_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_router_flutter/mainApp/local_storage/local_storage.dart';
import 'package:my_router_flutter/http_request/interceptors/token_interceptor.dart';
import 'package:my_router_flutter/http_request/interceptors/company_id_interceptor.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class DioClient {
  static final Dio _dio = DioClient._createInstance();
  static Map<String, dynamic> httpHeaders = {
    'Accept': 'application/json, text/plain, */*',
    'Content-Type': 'application/json;charset=UTF-8',
    'tocy': 'application/json;charset=UTF-8',
  };
  static BaseOptions options = BaseOptions(
    connectTimeout: DioConfig.CONNECTTIMEOUT,
    receiveTimeout: DioConfig.RECEIVETIMEOUT,
    sendTimeout: DioConfig.SENDTIMEOUT,
    responseType: ResponseType.json,
    validateStatus: (status) => true,
    headers: httpHeaders,
    baseUrl: DioConfig.BASEURL,
  );

  static _createInstance() {
    var dio = new Dio(options);
    dio.transformer = DefaultTransformer(
      jsonDecodeCallback: (String responseBody) {
        return json.decode(responseBody);
      },
    );
    return dio;
  }

  // 清空 dio 对象
  // static clear() {
  //   _dio = null;
  // }
  /* static final DioClient _dioManager = DioClient._instance();
   factory DioClient() => _dioManager;

  //3.私有的命名式构造方法
  DioClient._instance() {
    _dio.interceptors
      ..add(HeadersInterceptors())
      ..add(LogsInterceptor())
      ..add(ResponseInterceptors());
  }*/

  static Future request<T>(
    String method,
    String path, {
    data,
    Map<String, dynamic> queryParameters,
//  CancelToken cancelToken,
    Options options,
//  ProgressCallback onSendProgress,
//  ProgressCallback onReceiveProgress,
//  bool isShowProgress = true
  }) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _onError(ExceptionHandle.net_error, '网络异常，请检查你的网络！');
      return;
    }
    if (options == null) {
      options = new Options();
    }
    options.method = method;
    if (_dio.interceptors == null || _dio.interceptors.isEmpty) {
      await _addInterceptors();
    }

    print('555${_dio.options.headers}');
    try {
      // 暂时解决因viewModel加载数据时报不能在build中执行pushPage的相关操作的问题
      // Future.delayed(Duration(microseconds: 100), () => locator<DialogService>().showProgressDialog(isShowProgress));
      Response response = await _dio.request(
        path,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      if (response == null) _onError(ExceptionHandle.unknown_error, '未知错误');
      return response.data;
    } on DioError catch (dioErr) {
      if (dioErr.response != null) {
        var errorResponse = dioErr.response;
        var statusCode = errorResponse.statusCode;
        var errorCode = ErrorCode.ERROR_CODE_UNKNOWN;
        var errorMsg = errorResponse.toString();
        if (statusCode == 404) {
          errorMsg = "Request not found";
        } else if (statusCode == 401 || statusCode == 403) {
          errorCode =
              errorResponse.data['errorCode'] ?? errorResponse.data['code'];
          errorMsg = errorResponse.data['errorMessage'] ??
              errorResponse.data['message'] ??
              errorResponse.data['error'];
//          locator<NavigationService>().pushNamedAndRemoveUntil(LoginPageRoute, (route) => false);
        } else {
          errorCode =
              errorResponse.data['errorCode'] ?? errorResponse.data['code'];
          errorMsg = errorResponse.data['errorMessage'] ??
              errorResponse.data['message'] ??
              errorResponse.data['error'];
        }

        Fluttertoast.showToast(msg: errorCode.toString());
//        throw HttpRequestException(statusCode, errorCode, errorMsg);
      }
      Fluttertoast.showToast(msg: dioErr.toString());
//      throw Exception("test exception");
      /*final NetError netError = ExceptionHandle.handleException(e);
      _onError(netError.code, netError.msg);*/
    }
  }

 /* void updateAccessUrl(String facilityAccessUrl) {
    AccessUrlInterceptor oldInterceptor;
    _dio.interceptors.forEach((interceptor) {
      if (interceptor is AccessUrlInterceptor) {
        oldInterceptor = interceptor;
      }
    });

    if (oldInterceptor != null) {
      _dio.interceptors.remove(oldInterceptor);
      _dio.interceptors.add(AccessUrlInterceptor(facilityAccessUrl));
    }
  }

  void updateFacilityId(String facilityId) {
    FacilityInterceptor oldInterceptor;
    _dio.interceptors.forEach((interceptor) {
      if (interceptor is FacilityInterceptor) {
        oldInterceptor = interceptor;
      }
    });

    if (oldInterceptor != null) {
      _dio.interceptors.remove(oldInterceptor);
      _dio.interceptors.add(FacilityInterceptor(facilityId));
    }
  }*/

  void updateCompanyId(String companyId) {
    CompanyIdInterceptor oldInterceptor;
    _dio.interceptors.forEach((interceptor) {
      if (interceptor is CompanyIdInterceptor) {
        oldInterceptor = interceptor;
      }
    });

    if (oldInterceptor != null) {
      _dio.interceptors.remove(oldInterceptor);
      _dio.interceptors.add(CompanyIdInterceptor(companyId));
    }
  }

  void updateToken(String token) {
    TokenInterceptor oldInterceptor;
    _dio.interceptors.forEach((interceptor) {
      if (interceptor is TokenInterceptor) {
        oldInterceptor = interceptor;
      }
    });
    if (oldInterceptor != null) {
      _dio.interceptors.remove(oldInterceptor);
      _dio.interceptors.add(TokenInterceptor(token));
    }
  }

  static _addInterceptors() async {
    _dio.interceptors
      ..add(TokenInterceptor(await LocalStorage.getToken()))
      ..add(CompanyIdInterceptor(await LocalStorage.getCompanyId()))
      ..add(LogInterceptor(responseBody: false));
  }
}

void _onError(int code, String msg) {
  if (code == null) {
    code = ExceptionHandle.unknown_error;
    msg = '未知异常';
  }
}

enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }
//使用：MethodValues[Method.POST]
const MethodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};
