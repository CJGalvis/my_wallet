// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginPresenter)
const loginPresenterProvider = LoginPresenterFamily._();

final class LoginPresenterProvider
    extends $FunctionalProvider<LoginPresenter, LoginPresenter, LoginPresenter>
    with $Provider<LoginPresenter> {
  const LoginPresenterProvider._(
      {required LoginPresenterFamily super.from,
      required LoginArgs super.argument})
      : super(
          retry: null,
          name: r'loginPresenterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginPresenterHash();

  @override
  String toString() {
    return r'loginPresenterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<LoginPresenter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginPresenter create(Ref ref) {
    final argument = this.argument as LoginArgs;
    return loginPresenter(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginPresenter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginPresenter>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LoginPresenterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loginPresenterHash() => r'8ce5b517de080d4d2d521336e9c7e5ff6127e9ef';

final class LoginPresenterFamily extends $Family
    with $FunctionalFamilyOverride<LoginPresenter, LoginArgs> {
  const LoginPresenterFamily._()
      : super(
          retry: null,
          name: r'loginPresenterProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  LoginPresenterProvider call(
    LoginArgs args,
  ) =>
      LoginPresenterProvider._(argument: args, from: this);

  @override
  String toString() => r'loginPresenterProvider';
}
