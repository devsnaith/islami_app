import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/fetching_data/cubit/fetch_cubit.dart';
import 'package:islami_app/users_displayer/pages/user_data.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCubit, FetchState>(
      builder: (context, state) {
        return state.maybeWhen(
          fetched: (objects) {
            return Scaffold(
              
              appBar: AppBar(
                leading: const Icon(Icons.house),
                title: const Text("Users List",
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              ),
              backgroundColor: Colors.indigo[50],
              body: ListView.builder(
                itemCount: objects.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserData(objects[index]),)),
                    child: Card(
                      child: ListTile(
                        title: Text(objects[index].username, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("${objects[index].company.name} - ${objects[index].email}"),
                        leading: const Icon(Icons.person),
                      ),
                    ),
                  );  
                },
              ),
              
            );
          }, 
          orElse: () => const Placeholder(),
        );
      },
    );
  }
}
