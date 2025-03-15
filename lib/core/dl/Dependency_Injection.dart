
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


import '../../feature/Azkar/data/DataSource/AzkarDataRemote.dart';
import '../../feature/Azkar/data/repositry/AzkarRepoImp.dart';
import '../../feature/Azkar/domain/repositry/AzkarRepo.dart';
import '../../feature/Azkar/domain/usecase/get_Azkar_usecase.dart';
import '../../feature/Azkar/presention/Bloc/AzkarBloc.dart';
import '../../feature/Payer/data/DataSource/PayerDataRemote.dart';
import '../../feature/Payer/data/repositry/PayerRepoImp.dart';
import '../../feature/Payer/domain/repositry/PayerRepo.dart';
import '../../feature/Payer/domain/usecase/get_Payer_usecase.dart';
import '../../feature/Payer/presention/Bloc/WeatherBloc.dart';
import '../data/AzkarData.dart';
import '../db/sql.dart';
import '../network/Dio.dart';
import '../network/location.dart';

final sl = GetIt.instance;

void intl() {
  //Azkar
  sl.registerLazySingleton(() => AzkarData());
  sl.registerLazySingleton(() => Azkardataremote(sl<AzkarData>()));
  sl.registerLazySingleton<Azkarrepo>(() =>AzkarRepoImp(sl<Azkardataremote>()));
  sl.registerLazySingleton(() =>GetAzkarUsecase(sl<Azkarrepo>()));
  sl.registerFactory(() =>AzkarCubit(sl<GetAzkarUsecase>()));
  //Payer
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => location());
  sl.registerLazySingleton(() => Sql());
  sl.registerLazySingleton(() => PayerDio(sl<Dio>(),sl<location>(),sl<Sql>()));
  sl.registerLazySingleton(() => PayerDataRemote(sl<PayerDio>()));
  sl.registerLazySingleton<PayerRepo>(() =>PayerRepoImp(sl<PayerDataRemote>()));
  sl.registerLazySingleton(() =>GetPayerUsecase(sl<PayerRepo>()));
  sl.registerFactory(() =>PayerCubit(sl<GetPayerUsecase>()));
//Payer
  /*sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => location());
  sl.registerLazySingleton(() => WeatherDio(sl<Dio>(),sl<location>()));
  sl.registerLazySingleton(() => WeatherDataRemote(sl<WeatherDio>()));
  sl.registerLazySingleton<WeatherRepo>(() =>WeatherRepoImp(sl<WeatherDataRemote>()));
  sl.registerLazySingleton(() =>GetWeatherUsecase(sl<WeatherRepo>()));
  sl.registerLazySingleton(() =>UpdateWeatherUsecase(sl<WeatherRepo>()));
  sl.registerLazySingleton(() =>PredictUsecase(sl<WeatherRepo>()));
  sl.registerFactory(() =>WeatherCubit(sl<GetWeatherUsecase>(),sl<UpdateWeatherUsecase>(),sl<PredictUsecase>()));*/
}