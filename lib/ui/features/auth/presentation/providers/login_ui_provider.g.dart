// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_ui_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginUI)
const loginUIProvider = LoginUIProvider._();

final class LoginUIProvider extends $NotifierProvider<LoginUI, LoginUIState> {
  const LoginUIProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginUIProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginUIHash();

  @$internal
  @override
  LoginUI create() => LoginUI();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginUIState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginUIState>(value),
    );
  }
}

String _$loginUIHash() => r'3cc0b02ae4df3f4aabf68e7aa7730cb3a272b329';

abstract class _$LoginUI extends $Notifier<LoginUIState> {
  LoginUIState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LoginUIState, LoginUIState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LoginUIState, LoginUIState>,
        LoginUIState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
