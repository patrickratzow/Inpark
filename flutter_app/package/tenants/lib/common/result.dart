class Result<TSuccess, TError> {
  TError? error;
  TSuccess? success;

  Result.error(this.error);
  Result.success(this.success);

  bool get isSuccess => success != null;
  bool get isError => error != null;
}
