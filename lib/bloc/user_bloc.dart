import 'package:bloc/bloc.dart';
import 'package:bloc_with_api/models/user_model.dart';
import 'package:bloc_with_api/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  //PAso el repositorio para poder hacer llamadas desde el a la api y manejar los datos
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<UserEvent>(_onLoadUser);
  }
  void _onLoadUser (UserEvent event, Emitter<UserState> emit) async{
    emit(UserLoadingState());
    
    try {
      final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }

  
  }

}
