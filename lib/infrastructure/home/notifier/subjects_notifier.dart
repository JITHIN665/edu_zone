import 'package:edu_zone/infrastructure/home/models/subjects.dart';
import 'package:edu_zone/infrastructure/home/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subjects_notifier.g.dart';

@riverpod
class SubjectsNotifier extends _$SubjectsNotifier {
  // Initialize the repository to fetch subjects data
  final HomeRepository _homeRepository = HomeRepository();
  @override
  FutureOr<List<Subjects>> build() async {
    return await fetchSubjects();
  }

   /// Fetches a list of subjects from the repository and updates the state.
  ///
  /// **Description:**
  /// This method retrieves a list of subjects using the `_homeRepository` and updates
  /// the notifier's state. The state is updated to `AsyncLoading` if `isRefresh` is `true`,
  /// indicating a refresh process. Upon successful data retrieval, the state is updated
  /// to `AsyncData` with the fetched subjects. If an exception occurs, an `AsyncError`
  /// is thrown containing the exception and stack trace.
  ///
  /// **Parameters:**
  /// - `isRefresh` (optional): A boolean flag indicating if the state should be set to
  ///   `AsyncLoading` before fetching the data. Default is `false`.
  ///
  /// **Returns:**
  /// - A `Future` that resolves to a list of `Subjects` objects.
  ///
  /// **Throws:**
  /// - An `AsyncError` if an exception occurs during the fetch operation.
  Future<List<Subjects>> fetchSubjects({bool isRefresh = false}) async {
    if (isRefresh) {
      // Set the state to AsyncLoading to indicate that the refresh process has started
      state = const AsyncLoading();
    }

    try {
      // Fetch the list of subjects from the repository
      final subjects = await _homeRepository.listSubjects();

      // Update the state with the fetched subjects
      state = AsyncData(subjects);

      return subjects;
    } on Exception catch (e, st) {
      // Handle exceptions by throwing an AsyncError with the exception and stack trace
      throw AsyncError(e, st);
    }
  }
}