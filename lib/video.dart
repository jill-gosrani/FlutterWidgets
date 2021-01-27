import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'Widgets/back.dart';
import 'Widgets/chewieList.dart';

class VidPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'videos/IntroVideo.mp4',
              ),
              looping: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: "SANDEEP MAHESHWARI",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'Name among millions who struggled, failed and surged ahead in search of success, happiness and contentment. Just like any other middle class guy, he too had a bunch of unclear dreams and a blurred vision of his goals in life. All he had was an undying learning attitude to hold on to. Rowing through ups and downs, it was time that taught him the true meaning of his life.'),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            width: 10,
            child: Backk(),
          ),         
        ],
      ),
    );
  }
}
