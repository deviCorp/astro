import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:tak_task/cubit/astrologer_cubit.dart';
import 'package:tak_task/cubit/location_cubit.dart';
import 'package:tak_task/cubit/panchang_cubit.dart';
import 'package:tak_task/screens/home.dart';
import 'package:tak_task/utils/meta.dart';
import 'package:tak_task/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AstrologerCubit()),
        BlocProvider(create: (context) => PanchangCubit()),
        BlocProvider(create: (context) => LocationCubit()),
      ],
      child: MaterialApp(
        title: 'Aaj-tak',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              headline1: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w700,
                  fontFamily: lato,
                  fontSize: 36),
              bodyText1: TextStyle(
                  color: brown,
                  fontWeight: FontWeight.w400,
                  fontFamily: roboto,
                  fontSize: 16)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomeScreen.routeName,
        routes: routes,
      ),
    );
  }
}
