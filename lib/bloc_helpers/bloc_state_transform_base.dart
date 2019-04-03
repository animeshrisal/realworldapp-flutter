import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocStateTransformBase<T, S extends BlocState>
    implements BlocBase {
  final T initialState;

  BehaviorSubject<T> _stateController = BehaviorSubject<T>();
  Stream<T> get state => _stateController;

  Stream<T> stateHandler({T currentState, S newState});

  BlocStateTransformBase({
    @required this.initialState,
    @required BlocEventStateBase<BlocEvent, BlocState> blocIn,
  }) {
    assert(blocIn != null);
    assert(blocIn is BlocEventStateBase<BlocEvent, BlocState>);

    blocIn.state.listen((BlocState stateIn) {
      T currentState = _stateController.value ?? initialState;

      stateHandler(currentState: currentState, newState: stateIn)
          .forEach((T newState) {
        _stateController.sink.add(newState);
      });
    });
  }

  @override
  void dispose() {
    _stateController?.close();
  }
}
