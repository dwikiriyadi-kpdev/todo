import 'package:data_todo/src/api/repository/todo_repository.dart';
import 'package:data_todo/src/implementation/local/api/todo_dao.dart';
import 'package:data_todo/src/implementation/remote/api/todo_rest_api.dart';
import 'package:data_todo/src/implementation/repository/todo_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:storage/storage.dart';

// Factory function to create TodoRepositoryImpl
TodoRepository createTodoRepository(TodoApi api, TodoDao dao) {
  return TodoRepositoryImpl(api, dao);
}

Future<void> initTodoDao() async {
  final getIt = GetIt.instance;

  if (!getIt.isRegistered<TodoDao>()) {
    final todoDao = await TodoDao.init(
      encryptionCipher: getIt<HiveAesCipher>(),
    );
    getIt.registerSingleton<TodoDao>(todoDao);
  }
}

void provideTodoRepository() {
  final getIt = GetIt.instance;

  // Register TodoApi
  getIt.registerFactory<TodoApi>(() => TodoApi(getIt<Dio>()));

  // Register TodoRepository implementation
  getIt.registerLazySingleton<TodoRepository>(() => 
    createTodoRepository(getIt<TodoApi>(), getIt<TodoDao>())
  );
}