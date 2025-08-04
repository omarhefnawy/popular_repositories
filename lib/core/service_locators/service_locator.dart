import 'package:get_it/get_it.dart';
import 'package:popular_repositories/service/get_popular_repos.dart';

import '../../controllers/bloc/cubit/popularRepoCubit.dart';

final sl = GetIt.instance;

void serviceLocator() {
  sl.registerLazySingleton<PopularRepos>(() => PopularRepoImplementation(),);
  sl.registerFactory(() => PopularRepoCubit(popularRepos: sl()),);
}
