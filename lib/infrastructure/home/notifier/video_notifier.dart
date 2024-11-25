import 'package:edu_zone/infrastructure/home/models/videos.dart';
import 'package:edu_zone/infrastructure/home/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_notifier.g.dart';

/// A notifier that manages the state of a list of videos associated with a specific module.
///
@riverpod
class VideoNotifier extends _$VideoNotifier {
  // Repository instance for fetching video data
  final HomeRepository _homeRepository = HomeRepository();
  @override
  FutureOr<List<Videos>> build({required int moduleId}) async {
    return await fetchVideos(moduleId: moduleId);
  }

  /// Fetches a list of videos associated with a specific module and updates the state.
  ///
  /// **Description:**
  /// This method retrieves a list of videos using the `_homeRepository`. If `isRefresh`
  /// is set to `true`, the notifier sets the state to `AsyncLoading` to indicate a refresh process.
  /// After successfully fetching the videos, the state is updated to `AsyncData`.
  /// If an error occurs, an `AsyncError` is thrown, encapsulating the error and its stack trace.
  ///
  /// **Parameters:**
  /// - `isRefresh` (optional): A boolean flag indicating whether the state should be set to
  ///   `AsyncLoading` before fetching the data. Default is `false`.
  /// - `moduleId` (required): The ID of the module for which the videos need to be fetched.
  ///
  /// **Returns:**
  /// - [Future<List<Videos>>]: A future resolving to a list of video objects.
  ///
  /// **Throws:**
  /// - `AsyncError`: If an exception occurs during the fetch operation, the error and stack trace
  ///   are encapsulated and rethrown.
  Future<List<Videos>> fetchVideos({bool isRefresh = false, required int moduleId}) async {
    if (isRefresh) {
      // Set the state to AsyncLoading to indicate the start of the refresh process
      state = const AsyncLoading();
    }

    try {
      // Fetch the list of videos associated with the provided module ID from the repository
      final videos = await _homeRepository.listVideos(moduleId: moduleId);

      // Update the state with the fetched video data
      state = AsyncData(videos);

      // Return the list of videos
      return videos;
    } on Exception catch (e, st) {
      // If an error occurs, throw an AsyncError with the exception and stack trace
      throw AsyncError(e, st);
    }
  }
}
