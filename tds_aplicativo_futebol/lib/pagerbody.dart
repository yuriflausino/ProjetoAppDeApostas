import 'package:flutter/material.dart';
import 'package:tds_aplicativo_futebol/goalsstat.dart';
import 'package:tds_aplicativo_futebol/matchtile.dart';
import 'package:tds_aplicativo_futebol/teamstat.dart';
import 'soccermodel.dart';

Widget pageBody(List<SoccerMatch> allmatches) {
  return allmatches.isNotEmpty
      ? Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (allmatches.isNotEmpty)
                        teamStat("Time da Casa", allmatches[0].home.logoUrl,
                            allmatches[0].home.name),
                      if (allmatches.isNotEmpty)
                        goalStat(allmatches[0].fixture.status.elapsedtime,
                            allmatches[0].goal.home, allmatches[0].goal.away),
                      if (allmatches.isNotEmpty)
                        teamStat("Time Visitante", allmatches[0].away.logoUrl,
                            allmatches[0].away.name),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Partidas",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: allmatches.length,
                          itemBuilder: (context, index) {
                            return matchTile(allmatches[index]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      : Container(); // Retorna um Container vazio se a lista estiver vazia
}
