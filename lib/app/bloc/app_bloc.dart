import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<AppEvent>((event, emit) {});

    _loginAnon();
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _loginAnon() async {
    await _authenticationRepository.logInWithAnon();
  }
}


/// Object(params) : Initializer List {Constructor Body}
///
///