import 'package:auto_motive/app/network/network_info.dart';
import 'package:auto_motive/data/network/superbase/superbase_manager.dart';
import 'package:auto_motive/data/repositories/authentication_repositories_impl.dart';
import 'package:auto_motive/domain/repositories/authentication_repository.dart';
import 'package:auto_motive/domain/usecases/sigin_in_with_otp_usecase.dart';
import 'package:auto_motive/domain/usecases/sign_in_usecase.dart';
import 'package:auto_motive/domain/usecases/sign_up_usecase.dart';
import 'package:auto_motive/domain/usecases/verify_otp_usecase.dart';
import 'package:auto_motive/presentation/car_license_plate/cubit/car_license_cubit.dart';
import 'package:auto_motive/presentation/login/bloc/sign_in_bloc.dart';
import 'package:auto_motive/presentation/login/screen_switch_bloc/switch_screen_bloc.dart';

import 'package:auto_motive/presentation/otp_verification/cubit/otp_verification_cubit.dart';
import 'package:auto_motive/presentation/selection_button/selectionButtonCubit/selection_button_cubit.dart';
import 'package:auto_motive/presentation/signup/bloc/sign_up_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';

import '../presentation/obsecure_cubit/cubit/obscure_cubit_cubit.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
// superbase
  sl.registerLazySingleton<SuparbaseManager>(() => SuparbaseManager());

  ///Connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //repository

  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticaionRepositoryImpl(sl(), sl()));
// UseCases
  sl.registerLazySingleton<SignUpUsecase>(() => SignUpUsecase(sl()));
  sl.registerLazySingleton<SignInUsecase>(() => SignInUsecase(sl()));
  sl.registerLazySingleton<SignInWithNumberUsecase>(
      () => SignInWithNumberUsecase(sl()));
  sl.registerLazySingleton<VerifyOtpUsecase>(() => VerifyOtpUsecase(sl()));

  // Bloc
  sl.registerFactory<SignUpBloc>(() => SignUpBloc(sl()));
  sl.registerFactory<SignInBloc>(() => SignInBloc(sl(), sl()));
  sl.registerFactory<OtpVerificationCubit>(() => OtpVerificationCubit(sl()));
  sl.registerFactory<SelectionButtonCubit>(() => SelectionButtonCubit());
  sl.registerFactory<ScreenSwitchBloc>(() => ScreenSwitchBloc());
  sl.registerFactory<ObscureCubit>(() => ObscureCubit());
  sl.registerFactory<CarLicenseCubit>(() => CarLicenseCubit());
}
