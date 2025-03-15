import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/dl/Dependency_Injection.dart';
import 'feature/Azkar/presention/Bloc/AzkarBloc.dart';
import 'feature/Payer/presention/Bloc/WeatherBloc.dart';
import 'feature/home.dart';

void main() {
  intl();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (BuildContext context)=>sl<PayerCubit>(),),
      BlocProvider(
        create: (BuildContext context)=>sl<AzkarCubit>(),),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: [
          Locale('ar', ''), // Arabic
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor:Color(0xFFD9C3B6),
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          colorScheme: const ColorScheme(
            //ff795548 brown
            //0xffd7ccc8 container of am_or_pm
            //Colors.black onContainer of am_or_pm
            //Colors.brown description of Container of am_or_pm
            //0xff8d6e63 pale color of circle on container
            primary: Color(0xffbcaaa4), // Pale
            // primaryContainer: Color(0xffd7ccc8),
            secondary: Color(0xffd7ccc8), // Pale Dogwood (darker)
            // secondaryContainer: Color(0xffd34222),
            tertiary: Color(0xff8d6e63),
            background: Color(0xFFEDEDE9), // Isabelline
            surface: Color(0xFFE2DDD6), // Timberwolf
            error: Color(0xFFD7263D), // Keeping a strong red for errors
            onPrimary: Colors.black, // Contrast for readability
            onSecondary: Colors.black,
            onTertiary: Colors.white,
            outline: Colors.white,
            onBackground: Color(0xFF3F3F3F), // Dark gray for contrast
            onSurface: Color(0xFF2D2D2D), // Slightly softer dark gray
            onError: Colors.white, // White for error contrast
            brightness: Brightness.light,
            shadow: Colors.black26,
          ),
          useMaterial3: true,
        ),
        home: Home(),
      ),
    );
  }
}

