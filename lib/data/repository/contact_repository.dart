import 'dart:async';
import 'package:startup_namer/data/model/contact.dart';

abstract class ContactRepository {
  Future<List<Contact>> fetch();
}