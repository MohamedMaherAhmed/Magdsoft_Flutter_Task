import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/bloc_observer.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/verify_cubit/verify_cubit.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';
import './presentation/styles/colors.dart' as global;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: ((context) => LoginCubit()),
          ),
          BlocProvider(
            create: ((context) => VerifyCubit()),
          ),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: "SplashScreen",
              onGenerateRoute: appRouter.onGenerateRoute,
              theme: ThemeData(
                fontFamily: 'cairo',
                //scaffoldBackgroundColor: AppColors.white,
                appBarTheme: AppBarTheme(
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: global.colorMap['transparent'],
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
