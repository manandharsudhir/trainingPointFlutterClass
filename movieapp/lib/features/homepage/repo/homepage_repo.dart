import 'package:dio/dio.dart';
import 'package:movieapp/core/constants/api_constants.dart';
import 'package:movieapp/core/services/network_services.dart';
import 'package:movieapp/features/shared/model/movie_model.dart';

class HomepageRepo {
  HomepageRepo._();

  static HomepageRepo get instance => HomepageRepo._();

  Future<List<MovieModel>> getTrendingMovies() async {
    try {
      final response = await NetworkServices.instance.get(
        ApiConstants.popular,
      );

      final result = (response["results"] as List);
      return result.map((e) => MovieModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
