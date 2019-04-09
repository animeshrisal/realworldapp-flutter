import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:realworldapp/blocs/network/network_event.dart';
import 'package:realworldapp/blocs/network/network_state.dart';
import 'package:dio/dio.dart';

class NetworkBloc<T> extends BlocEventStateBase<NetworkEvent, NetworkState> {
  final String _endPoint = "http://192.168.31.55:4000/";
  final Dio _dio = Dio();
  final T bloc;

  NetworkBloc({this.bloc}) : super(initialState: NetworkState.initialization());

  @override
  Stream<NetworkState> eventHandler(
      NetworkEvent event, NetworkState currentState) async* {
    if (event.event == NetworkEventType.request) {
      Response response =
          await _dio.post(_endPoint, data: {event.model.model: {}});
    }
  }
}
