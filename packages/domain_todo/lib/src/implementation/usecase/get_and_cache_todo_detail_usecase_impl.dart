import 'package:data_todo/data_todo.dart';
import 'package:domain_todo/src/api/usecase/get_and_cache_todo_detail_usecase.dart';
import 'package:domain_todo/src/implementation/constant/todo_constant.dart';
import 'package:exception/exception.dart';

class GetAndCacheTodoDetailUseCaseImpl implements GetAndCacheTodoDetailUseCase {
  final TodoRepository _todoRepository;

  GetAndCacheTodoDetailUseCaseImpl(this._todoRepository);

  @override
  Future<TodoModel> call(String id) => processResult(
    module: TodoConstant.module,
    function: TodoConstant.getDetail,
    call: () async {
      try {
        final todo = await _todoRepository.getDetail(id);
        
        await _todoRepository.saveTodoToLocalStorage(todo);

        return todo;
      } catch (e) {
        final todo = await _todoRepository.getTodoFromLocalStorage(id);
        if (todo == null) {
          rethrow;
        }
        return todo;
      }
    },
  );
}