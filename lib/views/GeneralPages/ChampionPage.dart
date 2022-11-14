import 'package:flutter/material.dart';

import 'package:programmeren/services/Remote_services.dart';
import 'package:programmeren/views/infoPages/ChampionInfoPage.dart';
import '../../models/champion.dart';

class ChampionPage extends StatefulWidget {
  const ChampionPage({ Key? key }) : super(key: key);

  @override
  State<ChampionPage> createState() => _ChampionPageState();
}

class _ChampionPageState extends State<ChampionPage> {
  List<Champion>? championData = [];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    championData = await RemoteService().getChampions();
    if (championData != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('League Champions'),),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: championData?.length,
        itemBuilder: (context, index) {
          if (isLoaded){
            return makeChampionTile(championData?[index]);
          }
          else{
            return const SizedBox(
              height: 50,
              child: Center(child: Text('currently Loading')),
            );
          }
        },
      ),
    );
  }

  ListTile makeChampionTile(currentChampion) {
    return ListTile(
      title: Center(child: Text(currentChampion.name)),
      subtitle: Center(child: Text(currentChampion.title)),
      leading: ClipOval(child: Image.network('http://ddragon.leagueoflegends.com/cdn/12.20.1/img/champion/${currentChampion.id}.png')),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChampionInfoPage(
              currentChampion: currentChampion
            ),
          ),
        ),
      },
    );
  }
}

