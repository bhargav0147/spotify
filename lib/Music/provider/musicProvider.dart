import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:spotify/Music/modal/musicmodal.dart';

class MusicProvider extends ChangeNotifier {
  bool isPlay = false;
  int songindex=0;
  List<MusicModal>songinfo=[
    MusicModal(image: "assets/images/Apna_Bana_Le.jpg",singer: "Arijit Singh",song: "Apna Bana Le",songpath: "assets/audio/Apna_Bana_Le.mp3"),
    MusicModal(image: "assets/images/Bedardeya.jpg",singer: "Arijit Singh",song: "Bedardeya",songpath: "assets/audio/Bedardeya.mp3"),
    MusicModal(image: "assets/images/Besharam_Rang.jpg",singer: "Shilpa",song: "Besharam Rang",songpath: "assets/audio/Besharam_Rang.mp3"),
    MusicModal(image: "assets/images/Deewaane.jpg",singer: "Aditya Yadav",song: "Deewaane",songpath: "assets/audio/Deewaane.mp3"),
    MusicModal(image: "assets/images/Kesariya.jpg",singer: "Arijit Singh",song: "Kesariya",songpath: "assets/audio/Kesariya.mp3"),
    MusicModal(image: "assets/images/Maan_Meri_Jaan.jpg",singer: "King",song: "Maan Meri Jaan",songpath: "assets/audio/Maan_Meri_Jaan.mp3"),
    MusicModal(image: "assets/images/Pasoori.jpg",singer: "Ali Sethi and Shae Gill",song: "Pasoori",songpath: "assets/audio/Pasoori.mp3"),
    MusicModal(image: "assets/images/Srivalli.jpg",singer: "Javed Ali",song: "Srivalli",songpath: "assets/audio/Srivalli.mp3"),
    MusicModal(image: "assets/images/Sulthana.jpg",singer: "Ravi Basrur",song: "Sulthana",songpath: "assets/audio/Sulthan.mp3"),
    MusicModal(image: "assets/images/Teri_Jhuki_Nazar.jpg",singer: "Pritam",song: "Teri Jhuki Nazar",songpath: "assets/audio/Teri_Jhuki_Nazar.mp3"),
    MusicModal(image: "assets/images/Toofan.jpg",singer: "Ravi Basrur",song: "Toofan",songpath: "assets/audio/Toofan.mp3"),
  ];
  void changesongindex(int index)
  {
    songindex=index;
    intaudio();
    notifyListeners();
  }
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration songlenth =Duration(seconds: 0);
  void intaudio() {
    assetsAudioPlayer.open(Audio("${songinfo[songindex].songpath}"),
        autoStart: true, showNotification: true);
    totalduration();
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
  void totalduration() {
    assetsAudioPlayer.current.listen((event) {
      songlenth=event!.audio.duration;
    });
  }
  void nextaudio() {
    songindex++;
    intaudio();
    notifyListeners();
  }
  void preaudio() {
    songindex--;
    intaudio();
    notifyListeners();
  }
}
