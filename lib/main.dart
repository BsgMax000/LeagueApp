import 'package:flutter/material.dart';
import 'package:programmeren/views/GeneralPages/ChampionPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'League App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: const LeagueApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LeagueApp extends StatelessWidget{
  const LeagueApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const DefaultTabController(
      length: 1,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Champions'),
          ],
          labelColor: Color.fromARGB(255, 255, 255, 255),
        ),
        body: TabBarView(children: [
          ChampionPage(),
          ],
        ),
        backgroundColor: Color.fromARGB(1, 1, 1, 1),
      ),
    );
  }
}