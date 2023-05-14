import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify/Music/provider/musicProvider.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  MusicProvider? musicProviderFalse;
  MusicProvider? musicProviderTrue;
  @override
  void initState() {
    super.initState();
    Provider.of<MusicProvider>(context, listen: false).intaudio();
  }
  @override
  Widget build(BuildContext context) {
    musicProviderFalse = Provider.of<MusicProvider>(context, listen: false);
    musicProviderTrue = Provider.of<MusicProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "PLAYING FROM PLAYLIST",
          style: TextStyle(letterSpacing: 1, fontSize: 15),
        ),
        leading: InkWell(onTap: () {
          musicProviderFalse!.assetsAudioPlayer.stop();
          Navigator.pop(context);
        },child: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,size: 30,)),
        actions: [
          Icon(Icons.more_vert,color: Colors.white,size: 30,),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 50),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 40.h,
              width: 90.w,
              child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.asset('${musicProviderFalse!.songinfo[musicProviderTrue!.songindex].image}',fit: BoxFit.cover,)),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${musicProviderFalse!.songinfo[musicProviderTrue!.songindex].song}",
                      style: TextStyle(
                          letterSpacing: 1, color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "${musicProviderFalse!.songinfo[musicProviderTrue!.songindex].singer}",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.white54,
                          fontSize: 15),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.favorite_border,color: Colors.white,size: 30,),
              ],
            ),
          ),
          PlayerBuilder.currentPosition(player: musicProviderFalse!.assetsAudioPlayer, builder: (context, position) => Column(children: [
            Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.grey.shade900,
              value: position.inSeconds.toDouble(),
              max: musicProviderTrue!.songlenth.inSeconds.toDouble(),
              onChanged: (value) {
                musicProviderFalse!.assetsAudioPlayer.seekBy(Duration(seconds: value.toInt()));
              },
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "$position",
                    style: TextStyle(
                        color: Colors.white, letterSpacing: 1, fontSize: 15),
                  ),
                  Spacer(),
                  Text(
                    "${musicProviderTrue!.songlenth}",
                    style: TextStyle(
                        color: Colors.white, letterSpacing: 1, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],),),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.shuffle,
                  size: 30,
                  color: Colors.white,
                ),
                InkWell(
                  onTap: () {
                    musicProviderFalse!.preaudio();
                  },
                  child: Icon(
                    Icons.skip_previous,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      if(musicProviderTrue!.assetsAudioPlayer.isPlaying.value)
                        {
                          musicProviderFalse!.pushaudio();
                        }
                      else
                        {
                          musicProviderFalse!.playaudio();
                        }
                    },
                    child: musicProviderTrue!.isPlay==false
                        ? Icon(
                            Icons.pause,
                            size: 35,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.play_arrow,
                            size: 35,
                            color: Colors.black,
                          )),
                InkWell(
                  onTap: () {
                    musicProviderFalse!.nextaudio();
                  },
                  child: Icon(
                    Icons.skip_next,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.repeat,
                  size: 30,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.speaker,
                  size: 25,
                  color: Colors.white,
                ),
                Spacer(),
                Icon(
                  Icons.share,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(width: 25),
                Icon(
                  Icons.sort,
                  size: 25,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
