// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final ContacDao _dao = ContacDao();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroContaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: _nomeController,

              decoration: InputDecoration(
                labelText: 'Nome completo',
              ),

              style: TextStyle(
                fontSize: 24
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(

 controller: _numeroContaController,
                decoration: InputDecoration(
                  labelText: 'Número da Conta',
                ),
                style: TextStyle(
                  fontSize: 24
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox( // essa caixa faz com que o botão preencha toda a tela
                width: double.maxFinite,  // com esse função
                child: ElevatedButton(onPressed: (){
                  final String nome = _nomeController.text;
                  final int numeroConta = int.parse( _numeroContaController.text);

                  final Contact newContact = Contact(0, nome, numeroConta);
                  _dao.save(newContact).then((id) => Navigator.pop(context));
                },
                    child: Text('Criar')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
