import 'package:flutter/material.dart';
import 'package:flutter_grocery/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_grocery/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_grocery/data/model/response/base/api_response.dart';
import 'package:flutter_grocery/utill/app_constants.dart';

class BannerTwoRepo {
  final DioClient dioClient;
  BannerTwoRepo({@required this.dioClient});

  Future<ApiResponse> getBannerTwoList() async {
    try {
      final response = await dioClient.get(AppConstants.BANNERTWO_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Future<ApiResponse> getBannerDetails(String brandID) async {
  //   try {
  //     final response =
  //         await dioClient.get('${AppConstants.BANNERTWO_URI}$brandID');
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
}
