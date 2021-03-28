import 'package:freezed_annotation/freezed_annotation.dart';

part 'space_launch.freezed.dart';
part 'space_launch.g.dart';

@freezed
class SpaceLaunch with _$SpaceLaunch {
  const factory SpaceLaunch({
    required String id,
    required String name,
    required String image,
    @JsonKey(name: 'window_start') required DateTime windowStart,
    @JsonKey(name: 'window_end') required DateTime windowEnd,
    LaunchStatus? status,
    LaunchMission? mission,
  }) = _SpaceLaunch;

  factory SpaceLaunch.fromJson(Map<String, dynamic> json) =>
      _$SpaceLaunchFromJson(json);
}

@freezed
class LaunchStatus with _$LaunchStatus {
  const factory LaunchStatus({
    required String name,
  }) = _LaunchStatus;

  factory LaunchStatus.fromJson(Map<String, dynamic> json) =>
      _$LaunchStatusFromJson(json);
}

@freezed
class LaunchMission with _$LaunchMission {
  const factory LaunchMission({
    required String name,
    required String description,
  }) = _LaunchMission;

  factory LaunchMission.fromJson(Map<String, dynamic> json) =>
      _$LaunchMissionFromJson(json);
}

@freezed
class UpcomingLaunches with _$UpcomingLaunches {
  const factory UpcomingLaunches({
    required List<SpaceLaunch> results,
  }) = _UpcomingLaunches;

  factory UpcomingLaunches.fromJson(Map<String, dynamic> json) =>
      _$UpcomingLaunchesFromJson(json);
}
