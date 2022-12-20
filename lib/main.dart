import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kid_demo/features/home/cubit/home_cubit.dart';
import 'package:kid_demo/features/home/cubit/view_kid_cubit.dart';
import 'package:kid_demo/features/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KID Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HomeCubit()),
          BlocProvider(create: (_) => ViewKidCubit()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
