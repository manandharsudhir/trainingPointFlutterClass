import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/features/homepage/repo/homepage_repo.dart';
import 'package:movieapp/features/shared/model/movie_model.dart';

final trendingProvider = FutureProvider<List<MovieModel>>(
    (ref) => HomepageRepo.instance.getTrendingMovies());
