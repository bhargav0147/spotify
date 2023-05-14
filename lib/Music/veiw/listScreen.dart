import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/Music/provider/musicProvider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  MusicProvider? musicProviderFalse;
  MusicProvider? musicProviderTrue;
  @override
  Widget build(BuildContext context) {
    musicProviderFalse = Provider.of(context, listen: false);
    musicProviderTrue = Provider.of(context, listen: true);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Good morning",
          style: TextStyle(
              letterSpacing: 2, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.notifications_none, color: Colors.white, size: 25),
          SizedBox(width: 10),
          Icon(Icons.watch_later_outlined, color: Colors.white, size: 25),
          SizedBox(width: 10),
          Icon(Icons.settings, color: Colors.white, size: 25),
          SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => listPrint(index),
        itemCount: musicProviderFalse!.songinfo.length,
      ),
    ));
  }

  Widget listPrint(int index) {
    return InkWell(
      onTap: () {
          musicProviderFalse!.changesongindex(index);
          musicProviderFalse!.intaudio();
          Navigator.pushNamed(context, 'play');
      },
      child: Container(
        height: 85,
        margin: EdgeInsets.symmetric(vertical: 3),
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "${musicProviderFalse!.songinfo[index].image}",
                height: 80,
                width: 80,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${musicProviderFalse!.songinfo[index].song}",
                  style: TextStyle(letterSpacing: 1, fontSize: 20,color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "${musicProviderFalse!.songinfo[index].singer}",
                  style: TextStyle(letterSpacing: 1, fontSize: 20,color: Colors.white),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.favorite, color: Colors.green, size: 25),
            SizedBox(width: 10),
            Icon(Icons.more_horiz, color: Colors.white, size: 25),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
