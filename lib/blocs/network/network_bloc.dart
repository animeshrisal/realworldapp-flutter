import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:realworldapp/blocs/network/network_event.dart';
import 'package:realworldapp/blocs/network/network_state.dart';
import 'package:dio/dio.dart';
import 'package:realworldapp/blocs/authentication/authentication_bloc.dart';

class NetworkBloc<T> extends BlocEventStateBase<NetworkEvent, NetworkState> {
  final String _endPoint = "http://192.168.31.55:4000/articles";
  final Dio _dio = Dio();
  final T bloc;
  final AuthenticationBloc authenticationBloc;

  NetworkBloc({this.bloc, this.authenticationBloc})
      : super(initialState: NetworkState.initialization());

  @override
  Stream<NetworkState> eventHandler(
      NetworkEvent event, NetworkState currentState) async* {
    String token = authenticationBloc.lastState.jwt;
    if (event.event == NetworkEventType.request) {
      try {
        Response response = await _dio.post(_endPoint,
            data: {event.modelName: event.model},
            options: Options(headers: {'Authorization': 'Token $token'}));

        print(response.data);
      } catch (e) {
        print(e);
      }
    }
  }
}
