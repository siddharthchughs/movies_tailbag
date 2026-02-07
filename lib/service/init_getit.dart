import 'package:get_it/get_it.dart';
import 'package:mvvm_moviecatalog_app/repository/movies_repository.dart';
import 'package:mvvm_moviecatalog_app/service/api_services.dart';
import 'package:mvvm_moviecatalog_app/service/navigation_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiServices>(() => ApiServices());
  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepository(getIt<ApiServices>()),
  );
}
