///  `validateStatus` 决定http响应状态码是否被dio视为请求成功， 返回`validateStatus`
///  返回`true` , 请求结果就会按成功处理，否则会按失败处理.
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
///dart:convert - 解码和编码JSON、UTF-8等等
import 'package:dio/dio.dart';
import './dio_config/dio_config.dart';
import 'dart:async';
import './interceptors/error_handle.dart';
import 'file:///E:/my_router_flutter/lib/http/dio/http_request_exception.dart';
import 'package:my_router_flutter/http/dio/dio_config/error_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class DioClient {
  static Dio _dio;
  static Map<String, dynamic> httpHeaders =  {
    'Accept': 'application/json,*/*',
    'Content-Type': 'application/json',
    'token': ''
  };
  static BaseOptions options = BaseOptions(
    connectTimeout: DioConfig.CONNECTTIMEOUT,
    receiveTimeout: DioConfig.RECEIVETIMEOUT,
    sendTimeout: DioConfig.SENDTIMEOUT,
    responseType: ResponseType.json,
    validateStatus: (status) => true,
    headers:httpHeaders,
    baseUrl:DioConfig.BASEURL,
  );
  static Dio createInstance(){
    if(_dio==null){
      _dio = new Dio(options);
    }
    return _dio;
  }
  // 清空 dio 对象
  static clear() {
    _dio = null;
  }

/** 请求，返回参数为 T
    method：请求方法，Method.POST等
    path：请求地址
    params：请求参数
    success：请求成功回调
    error：请求失败回调
 */
  /**
   * Future来处理一个异步操作呢，promise很像=原来dart:async提供了Completer类
      Future openImagePicker () {
      Complete completer = new Completer();

      // ImagePicker 是一个图片选择插件
      ImagePicker.singlePicker(
      context,
      singleCallback: (data) {
      completer.complete(data);
      },
      failCallback:(err) {
      completer.catchError(err);
      }
      );

      return completer.future;
      }

      openImagePicker().then((data) {}).catchError((err){});

      返回completer生成的future，通过completer.complete方法去控制completer.future的成功状态，通过completer.catchError去控制completer.future的失败状态。
      completer.complete和completer.catchError方法的参数就是future的返回值。

      completer.complete就相当于promise的resolve，completer.catchError相当于promise中的reject()

      通过Completer可以得心应手的控制Future的状态。
   */

static Future request<T>(String method, String path, dynamic params,{
//  Map<String, dynamic> queryParameters,
//  CancelToken cancelToken,
  Options options,
//  ProgressCallback onSendProgress,
//  ProgressCallback onReceiveProgress,
//  bool isShowProgress = true
}) async{
    try{
      var connectivityResult = await (new Connectivity().checkConnectivity());
     if(connectivityResult == ConnectivityResult.none) {
       _onError(ExceptionHandle.net_error, '网络异常，请检查你的网络！');
       return;
     }
      Dio _dio = createInstance();
      if (options == null) {
        options = new Options();
      }
      options.method = method;
      Response response = await _dio.request(
          path,
          data: params,
          options: options,
         );
      if(response==null ) _onError(ExceptionHandle.unknown_error, '未知错误');
      return response.data;
//      else success(response.data);

    }on DioError catch(dioErr){
      if (dioErr.response != null) {
        var errorResponse = dioErr.response;
        var statusCode = errorResponse.statusCode;
        var errorCode = ErrorCode.ERROR_CODE_UNKNOWN;
        var errorMsg = errorResponse.toString();
        if (statusCode == 404) {
          errorMsg = "Request not found";
        } else if (statusCode == 401 || statusCode == 403) {
          errorCode = errorResponse.data['errorCode'] ?? errorResponse.data['code'];
          errorMsg = errorResponse.data['errorMessage'] ?? errorResponse.data['message'] ?? errorResponse.data['error'];
//          locator<NavigationService>().pushNamedAndRemoveUntil(LoginPageRoute, (route) => false);
        } else {
          errorCode = errorResponse.data['errorCode'] ?? errorResponse.data['code'];
          errorMsg = errorResponse.data['errorMessage'] ?? errorResponse.data['message'] ?? errorResponse.data['error'];
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