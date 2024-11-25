// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoNotifierHash() => r'5162c63c907a4cec510b3ab128f97f35906e38d8';

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

abstract class _$VideoNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Videos>> {
  late final int moduleId;

  FutureOr<List<Videos>> build({
    required int moduleId,
  });
}

/// A notifier that manages the state of a list of videos associated with a specific module.
///
///
/// Copied from [VideoNotifier].
@ProviderFor(VideoNotifier)
const videoNotifierProvider = VideoNotifierFamily();

/// A notifier that manages the state of a list of videos associated with a specific module.
///
///
/// Copied from [VideoNotifier].
class VideoNotifierFamily extends Family<AsyncValue<List<Videos>>> {
  /// A notifier that manages the state of a list of videos associated with a specific module.
  ///
  ///
  /// Copied from [VideoNotifier].
  const VideoNotifierFamily();

  /// A notifier that manages the state of a list of videos associated with a specific module.
  ///
  ///
  /// Copied from [VideoNotifier].
  VideoNotifierProvider call({
    required int moduleId,
  }) {
    return VideoNotifierProvider(
      moduleId: moduleId,
    );
  }

  @override
  VideoNotifierProvider getProviderOverride(
    covariant VideoNotifierProvider provider,
  ) {
    return call(
      moduleId: provider.moduleId,
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
  String? get name => r'videoNotifierProvider';
}

/// A notifier that manages the state of a list of videos associated with a specific module.
///
///
/// Copied from [VideoNotifier].
class VideoNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<VideoNotifier, List<Videos>> {
  /// A notifier that manages the state of a list of videos associated with a specific module.
  ///
  ///
  /// Copied from [VideoNotifier].
  VideoNotifierProvider({
    required int moduleId,
  }) : this._internal(
          () => VideoNotifier()..moduleId = moduleId,
          from: videoNotifierProvider,
          name: r'videoNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$videoNotifierHash,
          dependencies: VideoNotifierFamily._dependencies,
          allTransitiveDependencies:
              VideoNotifierFamily._allTransitiveDependencies,
          moduleId: moduleId,
        );

  VideoNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.moduleId,
  }) : super.internal();

  final int moduleId;

  @override
  FutureOr<List<Videos>> runNotifierBuild(
    covariant VideoNotifier notifier,
  ) {
    return notifier.build(
      moduleId: moduleId,
    );
  }

  @override
  Override overrideWith(VideoNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: VideoNotifierProvider._internal(
        () => create()..moduleId = moduleId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        moduleId: moduleId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<VideoNotifier, List<Videos>>
      createElement() {
    return _VideoNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoNotifierProvider && other.moduleId == moduleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, moduleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VideoNotifierRef on AutoDisposeAsyncNotifierProviderRef<List<Videos>> {
  /// The parameter `moduleId` of this provider.
  int get moduleId;
}

class _VideoNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<VideoNotifier, List<Videos>>
    with VideoNotifierRef {
  _VideoNotifierProviderElement(super.provider);

  @override
  int get moduleId => (origin as VideoNotifierProvider).moduleId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
