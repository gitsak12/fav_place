import 'package:uuid/uuid.dart';

var uuid = Uuid();
class Place{
  Place({required this.title}){

    id = uuid.v4();
  }
  late final String id;
  final String title;
}