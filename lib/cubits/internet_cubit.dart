

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState {Initial, Connected, Disconnected} 


class InternetCubit  extends Cubit<InternetState>{

  Connectivity _connectivity = Connectivity() ;
  StreamSubscription ? _connectivityStreamSubscription;
    

    InternetCubit() :super(InternetState.Initial){
      _connectivityStreamSubscription = _connectivity.onConnectivityChanged.listen((results) {
        if(results == ConnectivityResult.wifi || results == ConnectivityResult.mobile){
          emit(InternetState.Connected);
        }else{
          emit(InternetState.Disconnected);
        }
      });
    }

@override
  Future<void> close() {
_connectivityStreamSubscription?.cancel(); 
    return super.close();
  }
    

  
}