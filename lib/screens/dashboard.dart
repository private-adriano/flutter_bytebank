import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(title: Text('Dashboard'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween , // vertical
          crossAxisAlignment: CrossAxisAlignment.start, // horizontal
          children: [
            Padding( // margens
              padding:  EdgeInsets.all(8.0),
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Image.asset('imagens/bytebank_logo.png'),
              ),
            ),
            Row(
              children: [
                _FeatureItem(
                    'Transferir',
                    Icons.monetization_on,
                    onClick: (){
                      _showContactsList(context);
                    } ,
                ),
                _FeatureItem(
                    'Lista Transferências',
                    Icons.description,
                    onClick: () => _showTransactionList(context),
                ),
              ],
            ),

          ],
        ),
      );
  }

  void _showContactsList(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactsList(),
      ),
    );
  }

  _showTransactionList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String nome;
  final IconData icone;
  final Function onClick;

  _FeatureItem(this.nome, this.icone, {@required this.onClick,
  }): assert(icone != null),
      assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding( // margens do container
      padding: EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Icon(
                  icone,
                  color: Colors.white,
                  size: 24,
                ),
                Text(
                    nome,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


