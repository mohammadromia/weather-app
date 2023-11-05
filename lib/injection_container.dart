import 'package:get_it/get_it.dart';
import 'package:weather/presentation/bloc/weather_bloc.dart';
import 'data/data_sources/remote_data_source.dart';
import 'data/repositories/weather_repository.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_current_weather.dart';
import 'package:http/http.dart' as http;

final di = GetIt.instance;

void init() {

  di.registerFactory(() => WeatherBloc(di()));

  di.registerLazySingleton(() => GetCurrentWeatherUseCase(di()));

  di.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      weatherRemoteDataSource: di()
    ),
  );

  di.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      client: di(),
    ),
  );
  
  di.registerLazySingleton(() => http.Client());

  
  
}