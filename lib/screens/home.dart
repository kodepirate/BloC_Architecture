
import 'package:bloc_architecture/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Center(
      child:
          BlocConsumer<InternetCubit, InternetState>(builder: (context, state) {
        if (state == InternetState.Connected) {
          return Text("Internet Connected");
        } else if (state == InternetState.Disconnected) {
          return Text("Internet Disconnected");
        } else {
          return CircularProgressIndicator();
        }
      }, listener: (context, state) {
        if (state == InternetState.Connected) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Internet Connected"),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state ==  InternetState.Disconnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Internet Disconnected"),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Something went wrong"),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }),

      // child: BlocBuilder<InternetBloc, InternetState>(
      //   builder: (context, state) {
      //     if (state is InternetConnectedState) {
      //       return Text("Internet Connected");
      //     } else if (state is InternetDisconnectedState) {
      //       return Text("Internet Disconnected");
      //     } else {
      //       return CircularProgressIndicator();
      //     }
      //   },
      // ),
    ));
  }
}
