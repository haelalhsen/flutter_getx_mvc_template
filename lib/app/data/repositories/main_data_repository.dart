import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';

import '../../../config/translations/strings_enum.dart';
import '../../../utils/app_constants.dart';
import '../models/failures.dart';
import '../models/pokemon_page.dart';
import '../models/success.dart';
import 'init_settings_repository.dart' as init_settings_repo;

class MainDataRepository{
  dio.Dio client = dio.Dio();

  Future<Either<Failure, PokemonPage>> getPokemons({String? path}) async {
    try {
      bool isConnected = await checkInternetConnection();
      if (!isConnected) {
        return Left(Failure(-1, Strings.checkInternetConnection));
      }
      final String url = path ?? 'https://pokeapi.co/api/v2/pokemon';
      final response = await client.get(url,);
      if (response.statusCode == 200) {
        return Right(PokemonPage.fromJson(response.data));
      } else {
        return Left(Failure(-1, Strings.unKnownErrorOccurred));
      }
    } catch (e) {
      return Left(Failure(-1, Strings.unKnownErrorOccurred));
    }
  }

  /// general functions

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
  String getServerApiUrl(apiName) {
    return '${AppConstants.serverApiPath}$apiName';
  }

}
