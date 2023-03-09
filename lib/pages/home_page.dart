import 'package:bloc_with_api/bloc/user_bloc.dart';
import 'package:bloc_with_api/models/user_model.dart';
import 'package:bloc_with_api/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Le estoy pasando el UserRepository, que inicializo en el Repository provider en el main
    //Esto es para que el UserBloc, pueda tener y exista su parametro UserRepository
    //El cual usara para traer datos de la conexion con la api
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User List"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {

            if(state is UserLoadingState){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is UserLoadedState){
              List<UserModel> userList =state.users;
              
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey,
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(userList[index].firstName,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      subtitle: Text(userList[index].lastName,style: TextStyle(fontSize: 17),),
                      trailing: CircleAvatar(backgroundImage: NetworkImage(userList[index].avatar)),
                    ),
                  );
                },
              );
            }
            if(state is UserErrorState){
              return const Center(child: Text("Error"),);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
