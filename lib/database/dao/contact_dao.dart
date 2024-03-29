import 'package:sqflite/sqflite.dart';
import '../../models/contact.dart';
import 'package:bytebank/database/app_database.dart';

class ContacDao{

  static const String tableSql = 'CREATE TABLE $_tableName( '
      'id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_numeroConta INTEGER) ';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numero_Conta';

  Future<int> save(Contact contact) async{
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
      final Map<String, dynamic> contactMap = {};
    contactMap[_nome] = contact.name;
    contactMap[_numeroConta] = contact.accountNumber;

    return contactMap;
  }

  Future<List<Contact>> findAll() async{
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result){
      final Contact contact = Contact(
          row[_id],
          row[_nome],
          row[_numeroConta]
      );
      contacts.add(contact);
    }
    return contacts;
  }
}