import 'package:data_todo/src/api/model/todo_model.dart';
import 'package:data_todo/src/implementation/local/entity/todo_entity.dart';
import 'package:hive_ce/hive.dart';
import 'package:storage/storage.dart';

class TodoDao {
  static const String boxName = 'todo_box';
  final Database<TodoEntity> _database;

  TodoDao(this._database);

  static Future<TodoDao> init({
    HiveAesCipher? encryptionCipher,
  }) async {
    final database = await Database.init<TodoEntity>(
      name: boxName,
      adapter: TodoEntityAdapter(),
      encryptionCipher: encryptionCipher,
    );
    return TodoDao(database);
  }

  Future<List<TodoModel>> getAll() async {
    final entities = _database.box.values.toList();
    return entities.map((entity) => entity.toMap()).toList();
  }

  Future<TodoModel?> getById(String id) async {
    final entity = _database.box.get(id);
    return entity?.toMap();
  }

  Future<void> save(TodoModel model) async {
    final entity = TodoEntity.fromModel(model);
    await _database.box.put(model.id, entity);
  }

  Future<void> saveAll(List<TodoModel> models) async {
    final entities = models.map((model) => TodoEntity.fromModel(model)).toList();
    final map = Map.fromEntries(
      entities.map((entity) => MapEntry(entity.id, entity)),
    );
    await _database.box.putAll(map);
  }

  Future<void> delete(String id) async {
    await _database.box.delete(id);
  }

  Future<void> deleteAll() async {
    await _database.box.clear();
  }
}