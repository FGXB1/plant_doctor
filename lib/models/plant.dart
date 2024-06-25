import 'package:uuid/uuid.dart';
const uuid = Uuid();

class Plant {
  Plant({required this.name, required this.img}) : id = uuid.v4();

  final String img;
  final String id;
  final String name;
}