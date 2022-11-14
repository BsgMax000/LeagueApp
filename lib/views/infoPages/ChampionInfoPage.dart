import 'package:flutter/material.dart';

class ChampionInfoPage extends StatefulWidget {
  const ChampionInfoPage({ Key? key, required this.currentChampion }) 
    : super(key: key);

  final dynamic currentChampion;

  @override
  State<ChampionInfoPage> createState() => _ChampionInfoPageState();
}

class _ChampionInfoPageState extends State<ChampionInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic currentChampion = widget.currentChampion;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children:[
              Expanded(
                flex: 1,
                child: Image.network('http://ddragon.leagueoflegends.com/cdn/img/champion/loading/${currentChampion.id}_0.jpg'),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                        currentChampion.name,
                        style: const TextStyle(fontSize: 32),
                    ),
                    Text(
                      currentChampion.title
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  currentChampion.blurb,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}