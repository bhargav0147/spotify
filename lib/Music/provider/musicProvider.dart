import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';

class MusicProvider extends ChangeNotifier {
  bool isPlay = true;
  List<Audio> playList = [
    Audio("assets/audio/Bedardeya.mp3"),
    Audio("assets/audio/Kesariya.mp3"),
    Audio("assets/audio/Maan_Meri_Jaan.mp3"),
  ];

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  void intaudio() {
    assetsAudioPlayer.open(Playlist(audios: playList),
        autoStart: false, showNotification: true);
  }

  void playaudio() {
    isPlay = false;
    assetsAudioPlayer.play();
    notifyListeners();
  }

  void pushaudio() {
    isPlay = true;
    assetsAudioPlayer.pause();
    notifyListeners();
  }

  void totalduration() {}

  void nextaudio() {
    assetsAudioPlayer.next();
  }

  void preaudio() {
    assetsAudioPlayer.previous();
  }
}
