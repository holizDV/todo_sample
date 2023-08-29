part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded() = _Loaded;
  const factory HomeState.emptyData() = _EmptyData;
  const factory HomeState.addLoading() = _AddLoading;
  const factory HomeState.addLoaded() = _AddLoaded;
  const factory HomeState.backRefresh(bool isRefresh) = _BackRefresh;
}
