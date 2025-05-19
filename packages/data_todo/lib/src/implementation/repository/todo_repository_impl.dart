import 'package:data_todo/src/api/model/todo_model.dart';
import 'package:data_todo/src/api/repository/todo_repository.dart';
import 'package:data_todo/src/implementation/constant/todo_constant.dart';
import 'package:data_todo/src/implementation/local/api/todo_dao.dart';
import 'package:data_todo/src/implementation/remote/api/todo_rest_api.dart';
import 'package:data_todo/src/implementation/remote/request/add_edit_todo_request.dart';
import 'package:data_todo/src/implementation/remote/request/patching_todo_request.dart';
import 'package:exception/exception.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoApi _todoApi;
  final TodoDao _todoDao;

  TodoRepositoryImpl(this._todoApi, this._todoDao);

  @override
  Future<void> saveTodosToLocalStorage(List<TodoModel> todos) => processBox(
    module: TodoConstant.module,
    function: TodoConstant.saveAll,
    call: () async {
      await _todoDao.saveAll(todos);
    },
  );

  @override
  Future<List<TodoModel>> getAllTodosFromLocalStorage() => processBox(
    module: TodoConstant.module,
    function: TodoConstant.getListLocal,
    call: () async {
      return await _todoDao.getAll();
    },
  );

  @override
  Future<void> saveTodoToLocalStorage(TodoModel todo) => processBox(
    module: TodoConstant.module,
    function: TodoConstant.save,
    call: () async {
      if (todo.id.isNotEmpty) {
        await _todoDao.save(todo);
      }
    },
  );

  @override
  Future<TodoModel?> getTodoFromLocalStorage(String id) => processBox(
    module: TodoConstant.module,
    function: TodoConstant.getDetailLocal,
    call: () async {
      return await _todoDao.getById(id);
    },
  );

  @override
  Future<void> deleteTodoFromLocalStorage(String id) => processBox(
    module: TodoConstant.module,
    function: TodoConstant.deleteItemLocal,
    call: () async {
      await _todoDao.delete(id);
    },
  );

  @override
  Future<List<TodoModel>> getList() => processApiCall(
    module: TodoConstant.module,
    function: TodoConstant.getList,
    call: () async {
      final response = await _todoApi.getList({});
      return response.data?.map((item) => item.toMap()).toList() ?? [];
    },
  );

  @override
  Future<TodoModel> getDetail(String id) => processApiCall(
    module: TodoConstant.module,
    function: TodoConstant.getDetail,
    call: () async {
      final response = await _todoApi.getDetail(id);
      return response.data?.toMap() ?? TodoModel.empty();
    },
  );

  @override
  Future<TodoModel> createTodo(AddEditTodoRequest request) => processApiCall(
    module: TodoConstant.module,
    function: TodoConstant.createTodo,
    call: () async {
      final response = await _todoApi.createTodo(request.toJson());
      return response.data?.toMap() ?? TodoModel.empty();
    },
  );

  @override
  Future<TodoModel> updateTodo(String id, AddEditTodoRequest request) =>
      processApiCall(
        module: TodoConstant.module,
        function: TodoConstant.editTodo,
        call: () async {
          final response = await _todoApi.updateTodo(id, request.toJson());

          return response.data?.toMap() ?? TodoModel.empty();
        },
      );

  @override
  Future<TodoModel> patchingTodo(String id, PatchingTodoRequest request) =>
      processApiCall(
        module: TodoConstant.module,
        function: TodoConstant.updateTodo,
        call: () async {
          final response = await _todoApi.patchingTodo(id, request.toJson());
          return response.data?.toMap() ?? TodoModel.empty();
        },
      );

  @override
  Future<String> deleteTodo(String id) => processApiCall(
    module: TodoConstant.module,
    function: TodoConstant.deleteTodo,
    call: () async {
      final response = await _todoApi.deleteTodo(id);
      return response.message ?? '';
    },
  );
}
