import 'package:hive/hive.dart';

part 'todos.g.dart';

@HiveType(typeId: 1)
class Todos {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;

  Todos(this.title, this.description);
}
