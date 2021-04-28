part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  final UserModel model;
  final bool changed;
  const UserState({required this.model,required this.changed});}

class UserInitial extends UserState {
  UserInitial() : super(model: UserModel(userName: "",id: "", token: '', type: '', lang: ''),changed: false);
  @override
  List<Object> get props => [model,changed];
}

class UserUpdateState extends UserState {
  UserUpdateState({required UserModel model,required bool changed}) : super(model: model,changed: changed);
  @override
  List<Object> get props => [model,changed];
}