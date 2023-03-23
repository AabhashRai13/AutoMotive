import 'package:auto_motive/app/di.dart';
import 'package:auto_motive/presentation/car_license_plate/cubit/car_license_cubit.dart';
import 'package:auto_motive/presentation/login/screen_switch_bloc/switch_screen_bloc.dart';
import 'package:auto_motive/presentation/otp_verification/cubit/otp_verification_cubit.dart';
import 'package:auto_motive/presentation/selection_button/selectionButtonCubit/selection_button_cubit.dart';
import 'package:auto_motive/presentation/signup/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/resources/routes_manager.dart';
import 'presentation/resources/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CarLicenseCubit>(
          create: (BuildContext context) => CarLicenseCubit(),
        ),
        BlocProvider<SignUpBloc>(
          create: (_) => sl<SignUpBloc>(),
        ),
        // BlocProvider<SignInBloc>(
        //   create: (_) => sl<SignInBloc>(),
        // ),
        BlocProvider<OtpVerificationCubit>(
          create: (_) => sl<OtpVerificationCubit>(),
        ),
        BlocProvider<SelectionButtonCubit>(
          create: (_) => sl<SelectionButtonCubit>(),
        ),
        BlocProvider<ScreenSwitchBloc>(
          create: (_) => sl<ScreenSwitchBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: theme(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        navigatorKey: navigatorKey,
        initialRoute: Routes.initialScreenRoute,
      ),
    );
  }
}
