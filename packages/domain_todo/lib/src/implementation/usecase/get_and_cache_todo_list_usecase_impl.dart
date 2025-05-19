import 'package:data_todo/data_todo.dart';
import 'package:domain_todo/src/api/usecase/get_and_cache_todo_list_usecase.dart';
import 'package:domain_todo/src/implementation/constant/todo_constant.dart';
import 'package:exception/exception.dart';

class GetAndCacheTodoListUseCaseImpl implements GetAndCacheTodoListUseCase {
  final TodoRepository _todoRepository;

  GetAndCacheTodoListUseCaseImpl(this._todoRepository);

  @override
  Future<List<TodoModel>> call() => processResult(
    module: TodoConstant.module,
    function: TodoConstant.getList,
    call: () async {
      try {
        final todos = await _todoRepository.getList();

        await _todoRepository.saveTodosToLocalStorage(todos);

        return todos;
      } catch (e) {
        return await _todoRepository.getAllTodosFromLocalStorage();
      }
    },
  );
}
