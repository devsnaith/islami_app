part of 'fetch_cubit.dart';

@freezed
class FetchState with _$FetchState {
  const factory FetchState.initial() = _Initial;
  const factory FetchState.inProgress() = _InProgress;
  const factory FetchState.fetched(List<UserModel> objects) = _Fetched;
  const factory FetchState.error(String errorMessage) = _Error;
}