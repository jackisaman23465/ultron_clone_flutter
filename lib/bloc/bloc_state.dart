abstract class BlocDataState {}

class Init extends BlocDataState {}

class Loading extends BlocDataState {}

class Loaded extends BlocDataState {}

class GetDataOk<T> extends BlocDataState {
  T data;

  GetDataOk(this.data);
}

class GetDataFailed extends BlocDataState {
  String? code;
  String? msg;

  GetDataFailed(this.code, {this.msg});
}

class DeleteDataOk<T> extends BlocDataState {
  T data;

  DeleteDataOk(this.data);
}

class DeleteDataFailed<T> extends BlocDataState {
  T data;

  DeleteDataFailed(this.data);
}

class RetryGetData extends BlocDataState {}

class StateException implements Exception {
  final BlocDataState state;

  StateException(this.state);

  @override
  String toString() {
    // TODO: implement toString
    return state.runtimeType.toString();
  }
}
