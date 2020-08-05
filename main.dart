import 'package:audioplayers/audioplayers.dart';
// ignore: unused_import
//import 'package:file_picker/file_picker.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: AudioApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AudioApp extends StatefulWidget {
  @override
  _AudioAppState createState() => _AudioAppState();
}

class _AudioAppState extends State<AudioApp> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  //String currentTime = "00:00";
  //String completeTime= "00:00";
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    // ignore: deprecated_member_use
    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    // ignore: deprecated_member_use
    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Audio Player')),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[

          Image.asset("assets/myindia.jpg", fit: BoxFit.contain ,),

          Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: 80,

            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.7, left: MediaQuery.of(context).size.width*0.1),

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
            ),


            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: (){
                    if(isPlaying){
                      _audioPlayer.pause();

                      setState(() {
                        isPlaying = false;
                      });
                    }else{
                      _audioPlayer.resume();

                      setState(() {
                        isPlaying = true;
                      });
                    }

                  },
                )  ,

                SizedBox(width: 2,),

                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: (){
                    _audioPlayer.stop();

                    setState(() {
                      isPlaying = false;
                    });

                  },
                ),

              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.audiotrack),
        onPressed: () {
          print('playing');
         var audio = AudioCache();
         audio.play('Ae Watan.mp3');
          
        },
      ),
    );
  }
}