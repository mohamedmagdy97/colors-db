part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  final bool authorized;
  const AuthState(this.authorized);
}

class AuthInitial extends AuthState {
  AuthInitial() : super(true);

  @override
  List<Object> get props => [authorized];
}

class AuthUpdated extends AuthState {
  AuthUpdated(bool authorized) : super(authorized);

  @override
  List<Object> get props => [authorized];
}
