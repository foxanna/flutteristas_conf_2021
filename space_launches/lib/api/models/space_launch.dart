import 'package:freezed_annotation/freezed_annotation.dart';

part 'space_launch.freezed.dart';

@freezed
class SpaceLaunch with _$SpaceLaunch {
  const factory SpaceLaunch({
    required String id,
    required String name,
    required String image,
    required DateTime windowStart,
    required DateTime windowEnd,
    LaunchStatus? status,
    LaunchMission? mission,
  }) = _SpaceLaunch;
}

@freezed
class LaunchStatus with _$LaunchStatus {
  const factory LaunchStatus({
    required String name,
  }) = _LaunchStatus;
}

@freezed
class LaunchMission with _$LaunchMission {
  const factory LaunchMission({
    required String name,
    required String description,
  }) = _LaunchMission;
}
