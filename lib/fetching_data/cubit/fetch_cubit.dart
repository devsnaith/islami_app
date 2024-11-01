import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:islami_app/fetching_data/model/user_model.dart';

part 'fetch_state.dart';
part 'fetch_cubit.freezed.dart';

class FetchCubit extends Cubit<FetchState> {
  FetchCubit() : super(const FetchState.initial());
  List<UserModel>? objects;

  Future<void> fetchUsers() async {
    if (objects != null) {
      emit(FetchState.fetched(objects!));
    }

    emit(const FetchState.inProgress());

    Dio http = Dio();
    Response status = await http.get("https://jsonplaceholder.typicode.com/users");
    
    if (status.statusCode == 200) {
      List<dynamic> response = status.data;
      objects = response.map((json) => UserModel.fromJson(json)).toList();      
      emit(FetchState.fetched(objects!));
      return;
    }

    emit(FetchState.error(status.statusMessage ?? "Unknown Error!"));
  }

}
