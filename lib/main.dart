import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kid_demo/features/home/cubit/home_cubit.dart';
import 'package:kid_demo/features/home/cubit/view_kid_cubit.dart';
import 'package:kid_demo/features/home/home_page.dart';

import 'core/dependency_injection/injection_container.dart';

void main() async {
  configureDependencies();

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
          BlocProvider(create: (_) => sl<HomeCubit>()),
          BlocProvider(create: (_) => sl<ViewKidCubit>()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
