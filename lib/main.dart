import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer player = AudioPlayer();
  bool played = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black38,
        body:Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Image(
                image: AssetImage('images/music_1.gif'),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Icon(
                        Icons.audiotrack
                      ),
                      onPressed: (){
                        music();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Icon(
                          played? Icons.pause:Icons.play_arrow,
                      ),
                      onPressed: (){
                        played? player.pause():player.resume();
                        setState(() {
                          played = played? false:true;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Icon(
                          Icons.stop
                      ),
                      onPressed: (){
                        player.stop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  void music()async{
    String path = await FilePicker.getFilePath();
    int result = await player.play(path,isLocal: true);
    if(result==1){
      setState(() {
        played = true;
      });
    }
  }
}

