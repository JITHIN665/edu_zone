import 'package:edu_zone/infrastructure/home/models/modules.dart';
import 'package:edu_zone/infrastructure/home/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module_notifier.g.dart';

/// A notifier that manages the state of a list of modules.
///
@riverpod
class ModuleNotifier extends _$ModuleNotifier {
  // Repository instance for fetching modules data
  final HomeRepository _homeRepository = HomeRepository();
  FutureOr<List<Modules>> build({required int subjectId}) async {
    return await fetchModules(subjectId: subjectId);
  }

  /// Fetches a list of modules from the repository and updates the state.
  ///
  /// **Description:**
  /// This method retrieves a list of modules associated with a specific subject using
  /// the `_homeRepository`. The state is updated to `AsyncLoading` if `isRefresh` is `true`,
  /// indicating a refresh process. Upon successful data retrieval, the state is updated
  /// to `AsyncData` with the fetched modules. If an exception occurs, an `AsyncError`
  /// is thrown containing the exception and stack trace.
  ///
  /// **Parameters:**
  /// - `isRefresh` (optional): A boolean flag indicating if the state should be set to
  ///   `AsyncLoading` before fetching the data. Default is `false`.
  /// - `subjectId` (required): The ID of the subject for which the modules need to be fetched.
  ///
  /// **Returns:**
  /// - A `Future` that resolves to a list of `Modules` objects.
  ///
  /// **Throws:**
  /// - An `AsyncError` if an exception occurs during the fetch operation.
  Future<List<Modules>> fetchModules({bool isRefresh = false, required int subjectId}) async {
    if (isRefresh) {
      // Set the state to AsyncLoading to indicate that the refresh process has started
      state = const AsyncLoading();
    }

    try {
      // Fetch the list of modules associated with the provided subject ID from the repository
      final modules = await _homeRepository.listmodules(subjectId: subjectId);

      // Update the state with the fetched modules
      state = AsyncData(modules);

      return modules;
    } on Exception catch (e, st) {
      // Handle exceptions by throwing an AsyncError with the exception and stack trace
      throw AsyncError(e, st);
    }
  }
}
