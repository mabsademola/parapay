// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:parapay/provider/home_provider.dart';
import 'package:parapay/util/shimmer.dart';
import 'package:provider/provider.dart';

import 'teams.dart';

class Competions extends StatefulWidget {
  const Competions({Key key, @required this.id, @required this.name})
      : super(key: key);
  final int id;
  final String name;

  @override
  _CompetionsState createState() => _CompetionsState();
}

class _CompetionsState extends State<Competions> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).getMatches(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var matches = provider.matches;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name + " Competitions"),
      ),
      body:RefreshIndicator(
        onRefresh: () async {
          provider.getMatches(widget.id);
        },
        child: !provider.isLoading
            ? ListView.builder(
                itemCount: matches.length ?? 0,
                itemBuilder: (context, index) {
                  final dss = matches[index];
                  return ListTile(
                    title: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Teamss(
                                            name: dss.homeTeam.name,
                                            id: dss.homeTeam.id,
                                          )));
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  dss.homeTeam.name,
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Vs",
                            style: TextStyle(
                                backgroundColor: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Teamss(
                                            name: dss.awayTeam.name,
                                            id: dss.awayTeam.id,
                                          )));
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  dss.awayTeam.name,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                },
              )
            : Listshimmerr(),
      ),
    );
  }
}
