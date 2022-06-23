import 'dart:async';
import 'dart:convert';
import 'package:split_flap_tv/models/devices/device.dart';
import 'package:split_flap_tv/models/pages/page.dart';
import 'package:split_flap_tv/models/script/script.dart';

import 'api_caller.dart';
import 'api_response.dart';

class ApiCalls {
  //* STAGING ENVIRONMENT */
  static const _baseUrl = "https://demo.fixthings.com.ng/mob_app_apis";

  static _getCommonHeaders() async {
    Map<String, String> headers = {};
    return headers;
  }

//* DEVICES *//

  static Future<ApiResponse> getDevices() async {
    try {
      return ApiCaller.getRequest(
          _baseUrl + "/displays/select.php", await _getCommonHeaders());
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> insertDevice({required Device device}) async {
    try {
      var payload = <String, dynamic>{};
      payload['UserID'] = int.parse(device.userId!);
      payload['Orientation'] = int.parse(device.orientation!);
      payload['RefreshRate'] = int.parse(device.refreshRate!);
      payload['DisplayName'] = device.displayName;
      payload['GUID'] = device.guid;
      payload['Timezone'] = device.timezone;
      payload['Brand'] = device.brand;
      payload['Model'] = device.model;
      payload['SerialNumber'] = device.serialNumber;

      return ApiCaller.jsonRequest(_baseUrl + '/displays/insert.php',
          _getCommonHeaders(), jsonEncode(payload));
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> updateDevice({required Device device}) async {
    try {
      var payload = <String, dynamic>{};
      payload['DisplayID'] = int.parse(device.displayId!);
      payload['UserID'] = int.parse(device.userId!);
      payload['Orientation'] = int.parse(device.orientation!);
      payload['RefreshRate'] = int.parse(device.refreshRate!);
      payload['DisplayName'] = device.displayName;
      payload['GUID'] = device.guid;
      payload['Timezone'] = device.timezone;
      payload['Brand'] = device.brand;
      payload['Model'] = device.model;
      payload['SerialNumber'] = device.serialNumber;

      return ApiCaller.jsonRequest(_baseUrl + '/displays/update.php',
          _getCommonHeaders(), jsonEncode(payload));
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> deleteDevice({required String deviceId}) async {
    try {
      return ApiCaller.getRequest(
          _baseUrl + '/displays/delete.php?id=' + deviceId,
          _getCommonHeaders());
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  //* SCRIPT *//

  static Future<ApiResponse> getScripts() async {
    try {
      return ApiCaller.getRequest(
          _baseUrl + "/scripts/select.php", await _getCommonHeaders());
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> insertScript({required Script script}) async {
    try {
      var payload = <String, dynamic>{};
      payload['UserID'] = int.parse(script.userId!);
      payload['Rows'] = int.parse(script.rows!);
      payload['Columns'] = int.parse(script.columns!);
      payload['Silent'] = script.silent;
      payload['ScriptName'] = script.scriptName;

      return ApiCaller.jsonRequest(_baseUrl + '/scripts/insert.php',
          _getCommonHeaders(), jsonEncode(payload));
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> updateScript({required Script script}) async {
    try {
      var payload = <String, dynamic>{};
      payload['ScriptID'] = int.parse(script.scriptId!);
      payload['UserID'] = int.parse(script.userId!);
      payload['Rows'] = int.parse(script.rows!);
      payload['Columns'] = int.parse(script.columns!);
      payload['Silent'] = script.silent;
      payload['ScriptName'] = script.scriptName;

      return ApiCaller.jsonRequest(_baseUrl + '/scripts/update.php',
          _getCommonHeaders(), jsonEncode(payload));
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> deleteScript({required String scriptId}) async {
    try {
      return ApiCaller.getRequest(
          _baseUrl + '/scripts/delete.php?id=' + scriptId, _getCommonHeaders());
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  //* PAGE *//

  static Future<ApiResponse> getPages() async {
    try {
      return ApiCaller.getRequest(
          _baseUrl + "/scriptpages/select.php", await _getCommonHeaders());
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> insertPage({required Page page}) async {
    try {
      var payload = <String, dynamic>{};
      payload['ScriptID'] = int.parse(page.scriptId!);
      payload['Sequence'] = int.parse(page.sequence!);
      payload['Duration'] = int.parse(page.duration!);
      payload['Messages'] = page.messages;
      payload['Attributes'] = page.attributes;

      return ApiCaller.jsonRequest(_baseUrl + '/scriptpages/insert.php',
          _getCommonHeaders(), jsonEncode(payload));
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> updatePage({required Page page}) async {
    try {
      var payload = <String, dynamic>{};
      payload['ScriptPageID'] = int.parse(page.scriptPageId!);
      payload['ScriptID'] = int.parse(page.scriptId!);
      payload['Sequence'] = int.parse(page.sequence!);
      payload['Duration'] = int.parse(page.duration!);
      payload['Messages'] = page.messages;
      payload['Attributes'] = page.attributes;

      return ApiCaller.jsonRequest(_baseUrl + '/scriptpages/update.php',
          _getCommonHeaders(), jsonEncode(payload));
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> deletePage({required String pageId}) async {
    try {
      return ApiCaller.getRequest(
          _baseUrl + '/scriptpages/delete.php?id=' + pageId,
          _getCommonHeaders());
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }
}
