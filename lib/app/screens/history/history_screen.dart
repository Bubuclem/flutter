import 'package:flutter/material.dart';
import 'package:my_app/app/modules/history/model/history_model.dart';
import 'package:my_app/app/screens/history/widgets/list_element.dart';
import 'package:my_app/app_routes.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<History> historyList = [
    History(title: 'Total achats', dateTime: DateTime.now(), result: 299),
    History(title: 'Total ach', dateTime: DateTime.now(), result: 09),
    History(title: 'Mac Book', dateTime: DateTime.now(), result: 2000),
    History(title: 'Voiture', dateTime: DateTime.now(), result: 4500),
    History(title: 'Total achats', dateTime: DateTime.now(), result: 299),
    History(title: 'Total achats', dateTime: DateTime.now(), result: 299),
    History(title: 'Total achats', dateTime: DateTime.now(), result: 299),
    History(title: 'Total achats', dateTime: DateTime.now(), result: 299),
    History(title: 'Total achats', dateTime: DateTime.now(), result: 299),
  ];

  removeElementFromList(int position) {
    setState(() {
      historyList.removeAt(position);
    });
  }

  navigateToDetails({required History arguments, required int position}) async {
    bool? resultat = await Navigator.pushNamed(context, kHistoryDetailsRoute,
        arguments: arguments) as bool?;

    print("arguments récupérés de l'écran de détails : $resultat");

    if (resultat != null) {
      setState(() {
        historyList[position].isChecked = resultat;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Calcul récents',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Hero(
                  tag: 'my_image',
                  child: Image.asset('assets/images/logo.png')),
            ),
          )
        ],
      ),
      body: Container(
        child: ListView.separated(
          itemCount: historyList.length,
          itemBuilder: (context, position) {
            return InkWell(
              onTap: () => navigateToDetails(
                  arguments: historyList[position], position: position),
              child: Row(
                children: [
                  Text((position + 1).toString()),
                  ListElement(element: historyList[position]),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int position) {
            if (historyList[position].result > 299) {
              return Container(height: 2, width: 300, color: Colors.red);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
