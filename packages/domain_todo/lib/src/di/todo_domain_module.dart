import 'package:data_todo/data_todo.dart';
import 'package:domain_todo/src/api/usecase/create_and_cache_todo_usecase.dart';
import 'package:domain_todo/src/api/usecase/delete_todo_usecase.dart';
import 'package:domain_todo/src/api/usecase/get_and_cache_todo_detail_usecase.dart';
import 'package:domain_todo/src/api/usecase/get_and_cache_todo_list_usecase.dart';
import 'package:domain_todo/src/api/usecase/patch_and_cache_todo_usecase.dart';
import 'package:domain_todo/src/api/usecase/update_and_cache_todo_usecase.dart';
import 'package:domain_todo/src/implementation/usecase/create_and_cache_todo_usecase_impl.dart';
import 'package:domain_todo/src/implementation/usecase/delete_todo_usecase_impl.dart';
import 'package:domain_todo/src/implementation/usecase/get_and_cache_todo_detail_usecase_impl.dart';
import 'package:domain_todo/src/implementation/usecase/get_and_cache_todo_list_usecase_impl.dart';
import 'package:domain_todo/src/implementation/usecase/patch_and_cache_todo_usecase_impl.dart';
import 'package:domain_todo/src/implementation/usecase/update_and_cache_todo_usecase_impl.dart';

class TodoDomainModule {
  static GetAndCacheTodoListUseCase provideGetAndCacheTodoListUseCase(
    TodoRepository todoRepository,
  ) {
    return GetAndCacheTodoListUseCaseImpl(todoRepository);
  }

  static GetAndCacheTodoDetailUseCase provideGetAndCacheTodoDetailUseCase(
    TodoRepository todoRepository,
  ) {
    return GetAndCacheTodoDetailUseCaseImpl(todoRepository);
  }

  static CreateAndCacheTodoUseCase provideCreateAndCacheTodoUseCase(
    TodoRepository todoRepository,
  ) {
    return CreateAndCacheTodoUseCaseImpl(todoRepository);
  }

  static UpdateAndCacheTodoUseCase provideUpdateAndCacheTodoUseCase(
    TodoRepository todoRepository,
  ) {
    return UpdateAndCacheTodoUseCaseImpl(todoRepository);
  }

  static PatchAndCacheTodoUseCase providePatchAndCacheTodoUseCase(
    TodoRepository todoRepository,
  ) {
    return PatchAndCacheTodoUseCaseImpl(todoRepository);
  }

  static DeleteTodoUseCase provideDeleteTodoUseCase(
    TodoRepository todoRepository,
  ) {
    return DeleteTodoUseCaseImpl(todoRepository);
  }
}