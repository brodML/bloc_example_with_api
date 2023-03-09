part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final List<UserModel> users;

  const UserLoadedState(this.users);

  @override
  // TODO: implement props
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  final String errorMsg;

  UserErrorState(this.errorMsg);



  @override
  // TODO: implement props
  List<Object> get props => [errorMsg];
}


