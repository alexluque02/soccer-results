import 'package:flutter/material.dart';
import 'package:soccer_results/model/journal/journal.dart';

class ResultCard extends StatefulWidget {
  final Journal journal;
  const ResultCard({super.key, required this.journal});

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  late final goals1 = widget.journal.matchResults?[1].pointsTeam1!;
  late final goals2 = widget.journal.matchResults?[1].pointsTeam2!;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(widget.journal.group!.groupName!),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          widget.journal.team1!.teamIconUrl!,
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) {
                            // Manejar el error de carga de la imagen aquí
                            return Container(
                              width: 50,
                              height: 50,
                              color: Colors
                                  .grey, // O cualquier otro widget que desees mostrar en lugar de la imagen
                              child: const Icon(Icons
                                  .error), // O cualquier otro widget que desees mostrar en lugar de la imagen
                            );
                          },
                        ),
                        Text(widget.journal.team1!.shortName!)
                      ],
                    ),
                  ),
                  Center(
                    child: Expanded(
                      flex: 1,
                      child: Text(
                        '$goals1 : $goals2',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          widget.journal.team2!.teamIconUrl!,
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) {
                            // Manejar el error de carga de la imagen aquí
                            return Container(
                              width: 50,
                              height: 50,
                              color: Colors
                                  .grey, // O cualquier otro widget que desees mostrar en lugar de la imagen
                              child: const Icon(Icons
                                  .error), // O cualquier otro widget que desees mostrar en lugar de la imagen
                            );
                          },
                        ),
                        Text(widget.journal.team2!.shortName!)
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}