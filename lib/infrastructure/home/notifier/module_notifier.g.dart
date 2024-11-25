// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moduleNotifierHash() => r'564daa2a3d5140530ab5d8f1fa0c22fa7440c00a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ModuleNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Modules>> {
  late final int subjectId;

  FutureOr<List<Modules>> build({
    required int subjectId,
  });
}

/// A notifier that manages the state of a list of modules.
///
///
/// Copied from [ModuleNotifier].
@ProviderFor(ModuleNotifier)
const moduleNotifierProvider = ModuleNotifierFamily();

/// A notifier that manages the state of a list of modules.
///
///
/// Copied from [ModuleNotifier].
class ModuleNotifierFamily extends Family<AsyncValue<List<Modules>>> {
  /// A notifier that manages the state of a list of modules.
  ///
  ///
  /// Copied from [ModuleNotifier].
  const ModuleNotifierFamily();

  /// A notifier that manages the state of a list of modules.
  ///
  ///
  /// Copied from [ModuleNotifier].
  ModuleNotifierProvider call({
    required int subjectId,
  }) {
    return ModuleNotifierProvider(
      subjectId: subjectId,
    );
  }

  @override
  ModuleNotifierProvider getProviderOverride(
    covariant ModuleNotifierProvider provider,
  ) {
    return call(
      subjectId: provider.subjectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'moduleNotifierProvider';
}

/// A notifier that manages the state of a list of modules.
///
///
/// Copied from [ModuleNotifier].
class ModuleNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ModuleNotifier, List<Modules>> {
  /// A notifier that manages the state of a list of modules.
  ///
  ///
  /// Copied from [ModuleNotifier].
  ModuleNotifierProvider({
    required int subjectId,
  }) : this._internal(
          () => ModuleNotifier()..subjectId = subjectId,
          from: moduleNotifierProvider,
          name: r'moduleNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$moduleNotifierHash,
          dependencies: ModuleNotifierFamily._dependencies,
          allTransitiveDependencies:
              ModuleNotifierFamily._allTransitiveDependencies,
          subjectId: subjectId,
        );

  ModuleNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subjectId,
  }) : super.internal();

  final int subjectId;

  @override
  FutureOr<List<Modules>> runNotifierBuild(
    covariant ModuleNotifier notifier,
  ) {
    return notifier.build(
      subjectId: subjectId,
    );
  }

  @override
  Override overrideWith(ModuleNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ModuleNotifierProvider._internal(
        () => create()..subjectId = subjectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subjectId: subjectId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ModuleNotifier, List<Modules>>
      createElement() {
    return _ModuleNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ModuleNotifierProvider && other.subjectId == subjectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subjectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ModuleNotifierRef on AutoDisposeAsyncNotifierProviderRef<List<Modules>> {
  /// The parameter `subjectId` of this provider.
  int get subjectId;
}

class _ModuleNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ModuleNotifier,
        List<Modules>> with ModuleNotifierRef {
  _ModuleNotifierProviderElement(super.provider);

  @override
  int get subjectId => (origin as ModuleNotifierProvider).subjectId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
