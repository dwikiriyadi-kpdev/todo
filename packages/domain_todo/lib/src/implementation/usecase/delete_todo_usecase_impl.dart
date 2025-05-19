import 'package:data_todo/data_todo.dart';
import 'package:domain_todo/src/api/usecase/delete_todo_usecase.dart';
import 'package:domain_todo/src/implementation/constant/todo_constant.dart';
import 'package:exception/exception.dart';

class DeleteTodoUseCaseImpl implements DeleteTodoUseCase {
  final TodoRepository _todoRepository;

  DeleteTodoUseCaseImpl(this._todoRepository);

  @override
  Future<String> call(String id) => processResult(
    module: TodoConstant.module,
    function: TodoConstant.deleteTodo,
    call: () async {
      final result = await _todoRepository.deleteTodo(id);
      
      await _todoRepository.deleteTodoFromLocalStorage(id);

      return result;
    },
  );
}