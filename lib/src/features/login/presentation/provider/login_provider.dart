import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:wareco_2/src/features/login/login.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class LoginRememberMe extends _$LoginRememberMe {
  @override
  bool build() {
    return false;
  }

  void changeState() {
    state = !state;
  }
}

@riverpod
class Login extends _$Login {
  @override
  LoginState build() {
    return LoginInitialState();
  }

  Future<void> pressLoginButton({
    required String username,
    required String password,
  }) async {
    state = LoginLoadingState(username: username, password: password);

    if (await Connectivity().checkConnectivity() != ConnectivityResult.wifi) {
      state =
          LoginErrorState(error: ref.read(languageProvider).wifiIsNotConnected);
      return;
    }

    await Future.delayed(const Duration(seconds: 1));

    if (username == 'developer' && password == 'developer') {
      state = LoginSuccessState();
    } else {
      state = LoginErrorState(error: 'Message from backend');
    }
  }
}
