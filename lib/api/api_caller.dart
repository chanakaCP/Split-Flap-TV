import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:split_flap_tv/utills/local_db.dart';
import 'api_response.dart';
import 'api_status.dart';

const timeout = 15;

class ApiCaller {
  static Future<ApiResponse> request(
    String endpoint,
    Map<String, String>? commonHeaders, {
    String requestType = 'GET',
    String? jsonBody,
    Map<String, String>? formBody,
    Map<String, String>? headers,
    Map<String, String>? query,
  }) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Uri uriTemp = Uri.parse(endpoint);
        Uri endpointUri = Uri(
            scheme: uriTemp.scheme,
            host: uriTemp.host,
            path: uriTemp.path,
            fragment: uriTemp.fragment,
            queryParameters: query);
        final request = http.Request(requestType, endpointUri);
        request.headers["Accept"] = "*/*";
        if (commonHeaders != null && commonHeaders.isNotEmpty) {
          request.headers.addAll(commonHeaders);
        }
        if (headers != null && headers.isNotEmpty) {
          request.headers.addAll(headers);
        }
        log(request.method + " " + endpointUri.toString());
        if (jsonBody != null) {
          request.headers["Content-Type"] = "application/json";
          request.body = jsonBody;
          log("Json Request: " + jsonBody);
        } else if (formBody != null) {
          request.headers["Content-Type"] = 'application/x-www-form-urlencoded';
          request.bodyFields = formBody;
          log("Form Request: " + formBody.toString());
        }

        Map<String, String> headersPrint = {};
        headersPrint.addAll(request.headers);
        headersPrint['Authorization'] = "Bearer ***";
        log("Request Headers: " +
            headersPrint.toString().replaceAll(": ", ":"));

        final response = await http.Response.fromStream(await request.send())
            .timeout(const Duration(seconds: timeout));
        log("Response " +
            response.statusCode.toString() +
            ": " +
            response.body);
        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> requestAuth(
      String endpoint, Map<String, String> commonHeaders,
      {String requestType = 'GET',
      String? jsonBody,
      Map<String, String>? formBody,
      Map<String, String>? headers,
      Map<String, String>? query}) async {
    try {
      String? accessToken = await LocalDB.getAccessToken();
      Map<String, String> allHeaders = {};
      if (headers != null && headers.isNotEmpty) {
        allHeaders.addAll(headers);
      }
      if (accessToken != null && accessToken.isNotEmpty) {
        allHeaders["Authorization"] = "Bearer " + accessToken;
      }

      return request(endpoint, commonHeaders,
          requestType: requestType,
          jsonBody: jsonBody,
          headers: allHeaders,
          query: query);
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> multiPartRequest(
      String endpoint, Map<String, String>? commonHeaders,
      {String requestType = 'POST',
      Map<String, String>? fields,
      List<MultipartFile>? files,
      Map<String, String>? headers,
      Map<String, String>? query}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Uri uriTemp = Uri.parse(endpoint);
        Uri endpointUri = Uri(
            scheme: uriTemp.scheme,
            host: uriTemp.host,
            path: uriTemp.path,
            fragment: uriTemp.fragment,
            queryParameters: query);

        final request = http.MultipartRequest(requestType, endpointUri);
        request.headers["Accept"] = "*/*";
        request.headers["Content-Type"] = "multipart/form-data";
        if (commonHeaders != null && commonHeaders.isNotEmpty) {
          request.headers.addAll(commonHeaders);
        }
        if (headers != null && headers.isNotEmpty) {
          request.headers.addAll(headers);
        }
        log(request.method + " " + endpointUri.toString());

        if (fields != null) {
          request.fields.addAll(fields);
        }
        if (files != null && files.isNotEmpty) {
          request.files.addAll(files);
        }

        Map<String, String> headersPrint = {};
        headersPrint.addAll(request.headers);
        if (headersPrint.containsKey("Authorization")) {
          headersPrint['Authorization'] = "Bearer ***";
        }

        log("Request Headers: " +
            headersPrint.toString().replaceAll(": ", ":"));

        final response = await http.Response.fromStream(await request.send())
            .timeout(const Duration(seconds: timeout));
        log("Response " +
            response.statusCode.toString() +
            ": " +
            response.body);
        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> multiPartRequestAuth(
      String endpoint, Map<String, String>? commonHeaders,
      {String requestType = 'POST',
      Map<String, String>? fields,
      List<MultipartFile>? files,
      Map<String, String>? headers,
      Map<String, String>? query}) async {
    try {
      String? accessToken = await LocalDB.getAccessToken();
      Map<String, String> allHeaders = {};
      if (headers != null && headers.isNotEmpty) {
        allHeaders.addAll(headers);
      }
      if (accessToken != null && accessToken.isNotEmpty) {
        allHeaders["Authorization"] = "Bearer " + accessToken;
      }
      return multiPartRequest(endpoint, commonHeaders,
          requestType: requestType,
          fields: fields,
          files: files,
          headers: allHeaders,
          query: query);
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> jsonRequest(
    String endpoint,
    Map<String, String>? commonHeaders,
    String? jsonBody, {
    Map<String, String>? headers,
    Map<String, String>? query,
    String requestType = 'POST',
  }) async {
    return request(endpoint, commonHeaders,
        requestType: requestType,
        jsonBody: jsonBody,
        headers: headers,
        query: query);
  }

  static Future<ApiResponse> jsonRequestAuth(
      String endpoint, Map<String, String>? commonHeaders, String jsonBody,
      {Map<String, String>? headers,
      Map<String, String>? query,
      String requestType = 'POST'}) async {
    return requestAuth(endpoint, commonHeaders!,
        requestType: requestType,
        jsonBody: jsonBody,
        headers: headers,
        query: query);
  }

  static Future<ApiResponse> getRequest(
    String endpoint,
    Map<String, String> commonHeaders, {
    Map<String, String>? headers,
    Map<String, String>? query,
  }) async {
    return request(endpoint, commonHeaders,
        requestType: "GET", headers: headers, query: query);
  }

  static Future<ApiResponse> getRequestAuth(
    String endpoint,
    Map<String, String> commonHeaders, {
    Map<String, String>? headers,
    Map<String, String>? query,
  }) async {
    return requestAuth(endpoint, commonHeaders,
        requestType: "GET", headers: headers, query: query);
  }

  static Future<ApiResponse> formRequest(
    String endpoint,
    Map<String, String> commonHeaders,
    Map<String, String> formBody, {
    Map<String, String>? headers,
    Map<String, String>? query,
  }) async {
    return request(endpoint, commonHeaders,
        requestType: "POST",
        formBody: formBody,
        headers: headers,
        query: query);
  }

  static Future<ApiResponse> formRequestAuth(
    String endpoint,
    Map<String, String> commonHeaders,
    Map<String, String> formBody, {
    Map<String, String>? headers,
    Map<String, String>? query,
  }) async {
    return requestAuth(endpoint, commonHeaders,
        requestType: "POST",
        formBody: formBody,
        headers: headers,
        query: query);
  }
}
