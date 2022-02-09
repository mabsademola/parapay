// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:parapay/provider/home_provider.dart';
import 'package:parapay/screens/competitions.dart';
import 'package:parapay/util/shimmer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<HomeProvider>(context, listen: false).getCompetitions();
    // });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Of Competitions'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          provider.getCompetitions();
        },
        child: !provider.isLoading
            ? ListView.builder(
                itemCount: provider.competitions.length,
                itemBuilder: (context, index) {
                  final dss = provider.competitions[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Competions(
                                    name: dss.name,
                                    id: dss.area.id,
                                  )));
                    },
                    title: Text(
                      dss.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(dss.area.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  );
                },
              )
            : Listshimmer(),
      ),
    );
  }
}
