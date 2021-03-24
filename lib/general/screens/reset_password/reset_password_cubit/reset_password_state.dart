part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  final bool showLoading;
  const ResetPasswordState(this.showLoading);
}

class ResetPasswordInitial extends ResetPasswordState {
  ResetPasswordInitial() : super(false);

  @override
  List<Object> get props => [showLoading];
}

class ResetPasswordUpdated extends ResetPasswordState {
  ResetPasswordUpdated(bool  showLoading): super(showLoading);

  @override
  List<Object> get props => [showLoading];
}
