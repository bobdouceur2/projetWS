import 'package:flutter/material.dart';

class PrixTicketLouvre extends StatelessWidget {
  final List<Map<String, String>> tickets = [
    {"type": "Ticket standard", "prix": "17€"},
    {"type": "Tarif réduit", "prix": "14€"},
    {"type": "Moins de 18 ans", "prix": "Gratuit"},
    {"type": "Premier dimanche du mois", "prix": "Gratuit"},
    // Ajoutez d'autres types de tickets et leurs prix ici
  ];

  final Color color1 = Color(0xFF2B2D42);
  final Color color2 = Color(0xFF8D99AE);
  final Color color3 = Color(0xFFEDF2F4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prix des Tickets du Louvre", style: TextStyle(color: color3)),
        backgroundColor: color1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: color2,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: ListTile(
                      title: Text(tickets[index]["type"]!, style: TextStyle(color: color1)),
                      trailing: Text(tickets[index]["prix"]!, style: TextStyle(color: color1)),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Le tarif réduit s'applique pour les étudiants, les personnes âgées de plus de 65 ans, et les enseignants en activité sur présentation d'un justificatif.",
                style: TextStyle(color: color1),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
