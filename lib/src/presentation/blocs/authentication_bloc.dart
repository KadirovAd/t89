

import 'package:t89/src/domain/usecases/get_user.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetUser getUser;

  AuthenticationBloc(this.getUser) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield AuthenticationLoading();
      try {
        final user = await getUser(event.userId);
        yield AuthenticationAuthenticated(user: user);
      } catch (_) {
        yield AuthenticationUnauthenticated();
      }
    }
  }
}

part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {
  final int userId;

  AppStarted({required this.userId});

  @override
  List<Object> get props => [userId];
}

part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final User user;

  AuthenticationAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationUnauthenticated extends AuthenticationState {}
