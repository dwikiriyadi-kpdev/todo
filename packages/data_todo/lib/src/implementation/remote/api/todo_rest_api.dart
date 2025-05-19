import 'package:data_todo/src/implementation/remote/request/add_edit_todo_request.dart';
import 'package:data_todo/src/implementation/remote/request/patching_todo_request.dart';
import 'package:data_todo/src/implementation/remote/response/todo_response.dart';
import 'package:dio/dio.dart';
import 'package:remote/remote.dart';
import 'package:retrofit/retrofit.dart';

part 'todo_rest_api.g.dart';

@RestApi()
abstract class TodoApi {
  factory TodoApi(Dio dio, {String baseUrl}) = _TodoApi;

  @GET('/v1/todos')
  Future<ListResponse<TodoResponse>> getList(
    @Queries() Map<String, dynamic> body,
  );

  @GET('/v1/todos/{id}')
  Future<ObjectResponse<TodoResponse>> getDetail(@Path('id') String id);

  @POST('/v1/todos')
  Future<ObjectResponse> createTodo(@Body() Map<String, dynamic> body);

  @PUT('/v1/todos/{id}')
  Future<ObjectResponse<TodoResponse>> updateTodo(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/v1/todos/{id}')
  Future<ObjectResponse<TodoResponse>> patchingTodo(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/v1/todos/{id}')
  Future<ObjectResponse<dynamic>> deleteTodo(
    @Path('id') String id,
  );
}
