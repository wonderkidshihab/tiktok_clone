import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deentok/features/users/models/user_profile_model.dart';
import 'package:deentok/features/users/repos/user_repo.dart';

import '../../authentication/repos/authentication_repo.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _usersRepository;
  late final AuthenticationRepository _authenticationRepository;

  @override
  FutureOr<UserProfileModel> build() async {
    _usersRepository = ref.read(userRepo);
    _authenticationRepository = ref.read(authRepo);

    if (_authenticationRepository.isLoggedIn) {
      final profile = await _usersRepository
          .findProfile(_authenticationRepository.user!.uid);
      if (profile != null) {
        return UserProfileModel.fromJson(profile);
      }
    }
    return UserProfileModel.empty();
  }

  Future<void> createProfile(
    UserCredential credential,
    String name,
    String birthday,
  ) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }
    state = const AsyncValue.loading();
    final profile = UserProfileModel(
      bio: "describe yourself!",
      link: "your link to show",
      email: credential.user!.email ?? "anon@anon.com",
      uid: credential.user!.uid,
      name: name,
      birthday: birthday,
    );
    await _usersRepository.createProfile(profile);
    state = AsyncValue.data(profile);
  }

  Future<void> onAvatarUpload(String url) async {
    if (state.value == null) return;
    state = AsyncValue.data(state.value!.copyWith(avatarUrl: url));
    await _usersRepository.updateUser(state.value!.uid, {"avatarUrl": url});
  }

  Future<void> updateProfile(String? bio, String? link) async {
    if (state.value == null) return;
    state = AsyncValue.data(state.value!.copyWith(bio: bio, link: link));
    await _usersRepository
        .updateUser(state.value!.uid, {"bio": bio, "link": link});
  }
}

final usersProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
