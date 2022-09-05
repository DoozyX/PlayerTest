import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(controller: betterPlayerController),
              ),
            ),
            TextButton(
              onPressed: () async {
                print('SET SRC');
                await betterPlayerController.setupDataSource(
                  BetterPlayerDataSource(
                      BetterPlayerDataSourceType.network,
                      // 'https://cloud-demo.uniqcast.com:8445/content/hls/recordings/arenasportbh/arenasportbh-1609300/playlist.m3u8?user=jjones&valid_to=1661423230&stream_count=3&uid=0-arenasportbh&hash=a9d0ce9565fe9dcd4fbed20a0bc0bf00',

                      // 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                      // videoExtension: 'video/mp4',

                      'https://cloud-demo.uniqcast.com:22443/tt1172203_sita_sings_the_blues/playlist.m3u8'

                      // 'https://cloud-demo.uniqcast.com:8445/content/hls/timetravels/arenasportbh-1609600_22621661764620jjones1661772422DESKTOP/recordings/arenasportbh/arenasportbh-1609600/playlists/arenasportbh-1609600_22621661764620jjones1661772422DESKTOP/desktop.m3u8?user=jjones&valid_to=1661858822&stream_count=3&uid=0-arenasportbh&hash=543084bea29a4ac5390cd48763afca86'

                      // "https://office-new-dev.uniqcast.com:12611/auth-streaming/2,8b6ff7dbda7108042cbb9a3d194e12254dfc7f57,1660143077,slobodan,0-hrt1w,8,8,8,8,8,8,MOBILE,2820,all,none,default_basic,185.4.193.160/playlist/0-hrt1w/live/index.m3u8",
                      // drmConfiguration: BetterPlayerDrmConfiguration(
                      //   headers: {
                      //     'Authorization':
                      //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjUxLCJ1bmFtZSI6InNsb2JvZGFuIiwicm9sZSI6WyJzdWJzY3JpYmVyIl0sImRpZCI6MjgyMCwiZHVpZCI6IjdmYTAzNTgwLTE3ZWMtMTFlZC1iMWZmLTBmZTZkMTU0NTM5YSIsIm9pZCI6Mywib3VpZCI6ImRlZmF1bHRfYmFzaWMiLCJyaWQiOjMsInJ1aWQiOiJkZWZhdWx0IiwicG5hbWUiOiJTbG9ib2RhbiIsIm1waW4iOiIwZmZlMWFiZDFhMDgyMTUzNTNjMjMzZDZlMDA5NjEzZTk1ZWVjNDI1MzgzMmE3NjFhZjI4ZmYzN2FjNWExNTBjIiwicHBpbiI6IjExMTEiLCJpYXQiOjE2NjAwNTY2NzYsImV4cCI6MTY2MDA1ODQ3NiwiaXNzIjoidW5pcUNhc3QiLCJzdWIiOiJsb2dpbiJ9.NctKr-eq3yzMFoa4q2YFQKjr8kr5d0ZW_bMUyU1AD0k'
                      //   },
                      //   drmType: DrmType.widevine,
                      //   licenseUrl:
                      //       'https://office-new-dev.uniqcast.com:12611/drmproxy/wv/license?lat=2I8mtqM5%2F6IdGKu2vcuU8so1x41ZiXF2F5tiLhAyShEVP9L6OM9T4ad41w83qw2d0snxIpJ3744URh%2F3Xu27hNBqmRk9EiUi8N8vKZlmkoA1fh8TXvMrHRi4xs5G0oLFu6Pb1h1HgD0lAsZmX2I%2BqblHkX1H1xAABIiLqh0K20owQ8eETbtJQ%2BSt3R%2FfOlFyF%2Bbhs3T8V2uJDOvgXlIorkO1WGMh2yXAmZ9srSHF86k%3D',
                      // ),
                      ),
                );
                print('PLAY');
                await betterPlayerController.play();
                print('DONE');
              },
              child: const Text("SET SRC"),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    betterPlayerController.play();
                  },
                  child: const Text("PLAY"),
                ),
                TextButton(
                  onPressed: () {
                    betterPlayerController.pause();
                  },
                  child: const Text("PAUSE"),
                ),
                TextButton(
                  onPressed: () async {
                    Duration? position = await betterPlayerController
                        .videoPlayerController.position;
                    print(position);
                    if (position != null) {
                      betterPlayerController
                          .seekTo(Duration(seconds: position.inSeconds + 10));
                    }
                  },
                  child: const Text("SEEK +10"),
                ),
                TextButton(
                  onPressed: () async {
                    final asmsTracks =
                        betterPlayerController.betterPlayerAsmsTracks.toList();
                    print(asmsTracks);
                    betterPlayerController
                        .setTrack(BetterPlayerAsmsTrack.defaultTrack());
                  },
                  child: const Text("QUALITY default"),
                ),
                TextButton(
                  onPressed: () async {
                    final asmsTracks =
                        betterPlayerController.betterPlayerAsmsTracks.toList();
                    betterPlayerController.setTrack(asmsTracks
                        .firstWhere((element) => element.width == 426));
                  },
                  child: const Text("QUALITY 426"),
                ),
                TextButton(
                  onPressed: () async {
                    final asmsTracks =
                        betterPlayerController.betterPlayerAsmsTracks.toList();

                    betterPlayerController.setTrack(asmsTracks
                        .firstWhere((element) => element.width == 1920));
                  },
                  child: const Text("QUALITY 1080p"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
