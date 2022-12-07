import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactsList extends StatefulWidget {

  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContacDao _dao = ContacDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text('Transferir'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot){

          switch (snapshot.connectionState){

            case ConnectionState.none:
              break;

            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
              break;

            case ConnectionState.active:
              break;

            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder (
                itemBuilder: (context, index){
                  final Contact contact = contacts[index];
                  return _ContacItem(contact);
                },
                itemCount: contacts.length,
              );
              break;
          }

          return Text('Erro não encontrado');

        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ContactForm(),
              ),
          ).then((value) => setState(() {}),
          );
        },
        child: Icon(Icons.add
        ),
      ),
    );
  }
}

class _ContacItem extends StatelessWidget {

  final Contact contact;

  _ContacItem(this.contact);

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text(
            contact.nome,
            style: TextStyle(
              fontSize: 24.0,
            )
        ),
        subtitle: Text(
          contact.numeroConta.toString(),
          style: TextStyle(
              fontSize: 16.0
          ),
        ),
      ),
    );
  }
}