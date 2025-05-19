import 'package:data_todo/data_todo.dart';
import 'package:domain_todo/src/api/usecase/patch_and_cache_todo_usecase.dart';
import 'package:domain_todo/src/implementation/constant/todo_constant.dart';
import 'package:exception/exception.dart';

class PatchAndCacheTodoUseCaseImpl implements PatchAndCacheTodoUseCase {
  final TodoRepository _todoRepository;

  PatchAndCacheTodoUseCaseImpl(this._todoRepository);

  @override
  Future<TodoModel> call(String id, PatchingTodoRequest request) => processResult(
    module: TodoConstant.module,
    function: TodoConstant.editTodo,
    call: () async {
      final todo = await _todoRepository.patchingTodo(id, request);

      await _todoRepository.saveTodoToLocalStorage(todo);

      return todo;
    },
  );
}
