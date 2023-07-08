import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/core/Internet_Event.dart';
import 'package:bloc_architecture/core/Internet_State.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();


StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  // Here we are using the InternetInitialState as the initial state.

  InternetBloc(InternetInitialState initialState) : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetDisconnectedState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetConnectedState()));

//
   _connectivitySubscription =   _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  } 

  @override
  Future<void> close() {
    //   
     _connectivitySubscription?.cancel();
    // TODO: implement close
    return super.close();
  }
}
