import 'dart:async';

import 'package:band_scheduler/data/models/auth_user.dart';

abstract class AuthRepository {
  Stream<AuthUser?> watchCurrentUser();
  Future<AuthUser?> currentUser();
  Future<void> sendSignInLink(String email);
  Future<AuthUser> signInWithLink({required String email, required String link});
  Future<void> signOut();
}

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository();

  static const _demoUser = AuthUser(
    uid: 'demo-user',
    email: 'demo@example.com',
  );

  // FirebaseAuth.authStateChanges() が broadcast stream であることに合わせて
  // 同じ振る舞いにしておく（single-subscription だと HotReload や複数 watcher で
  // 「Stream has already been listened to」を踏むため）。
  final StreamController<AuthUser?> _controller =
      StreamController<AuthUser?>.broadcast();

  @override
  Stream<AuthUser?> watchCurrentUser() {
    scheduleMicrotask(() => _controller.add(_demoUser));
    return _controller.stream;
  }

  @override
  Future<AuthUser?> currentUser() async => _demoUser;

  @override
  Future<void> sendSignInLink(String email) async {}

  @override
  Future<AuthUser> signInWithLink({
    required String email,
    required String link,
  }) async =>
      _demoUser;

  @override
  Future<void> signOut() async {}
}
