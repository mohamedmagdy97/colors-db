part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final bool loading;
  const LoginState(this.loading);
}

class LoginInitial extends LoginState {
  LoginInitial() : super(false);

  @override
  List<Object> get props => [loading];
}

class LoginChangeState extends LoginState {
  LoginChangeState(bool loading) : super(loading);

  @override
  List<Object> get props => [loading];
}
