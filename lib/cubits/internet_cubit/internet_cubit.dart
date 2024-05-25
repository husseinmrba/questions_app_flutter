import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitial());

  late StreamSubscription<List<ConnectivityResult>> _subscription;

  void checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectivityResult);
  }

  void _updateConnectivityStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      emit(InternetConnected());
    } else {
      emit(InternetNotConnected());
    }
  }

  void trackConnectivityChange() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      _updateConnectivityStatus(result);
    });
  }

  void dispose() {
    _subscription.cancel();
  }
}
