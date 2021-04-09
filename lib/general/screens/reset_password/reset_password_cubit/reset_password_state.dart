part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  final bool loading;

  const ResetPasswordState(this.loading);
}

class ResetPasswordInitial extends ResetPasswordState {
  ResetPasswordInitial() : super(false);

  @override
  List<Object> get props => [];
}

class ResetUpdateState extends ResetPasswordState {
  ResetUpdateState(bool loading) : super(loading);

  @override
  List<Object> get props => [loading];
}
