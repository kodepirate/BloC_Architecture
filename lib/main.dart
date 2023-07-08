
import 'package:bloc_architecture/cubits/internet_cubit.dart';
import 'package:bloc_architecture/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  InternetCubit() ,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Home(),
      ),
    );
  }
}
