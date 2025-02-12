import 'dart:convert';

import '/core/class/status_request.dart';
import 'package:dartz/dartz.dart';
import '/core/service/app_links.dart';
import 'check_net.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkUrl, Map data, Map<String, String> header) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkUrl),
          body: jsonEncode(data),
          headers: header,
        );

        print(response);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      print(_);
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(
    String linkUrl,
    Map data,
  ) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(
          Uri.parse(linkUrl),
          headers: AppLink().getHeaderToken(),
        );
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        print("response.StatusCode is ${response.statusCode}");
        print("response.Body is $responseBody");

        if (response.statusCode == 200 || response.statusCode == 201) {
          //setMyUser(UserModel.fromjson(responseBody));
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
