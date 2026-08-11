sealed class ViewState<T> {}

class Loading<T> extends ViewState<T> {}

class Error<T> extends ViewState<T> {
  final String message;
  Error(this.message);
}

class Success<T> extends ViewState<T> {
  final T data;
  Success(this.data);
}
