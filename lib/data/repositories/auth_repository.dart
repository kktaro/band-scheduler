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

  @override
  Stream<AuthUser?> watchCurrentUser() => Stream.value(_demoUser);

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
