import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:startup_namer/data/model/contact.dart';

import 'contact_repository.dart';
import 'fetch_data_exception.dart';

class ContactRepositoryImpl implements ContactRepository {

  static const _kRandomUserUrl = 'http://www.mocky.io/v2/5ea3127d4f0000bd54d9f767';
  final JsonDecoder _decoder = JsonDecoder();

  Future<List<Contact>> fetch() async {
    final response = await http.get(_kRandomUserUrl);
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if(statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
    }

    final contactsContainer = _decoder.convert(jsonBody);
    final List contactItems = contactsContainer['results'];

    return contactItems.map( (contactRaw) => Contact.fromMap(contactRaw) ).toList();
  }

}