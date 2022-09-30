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

                      // 'http://commondatastorage.googleapi/**/s.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                      // videoExtension: 'video/mp4',

                      // 'https://cloud-demo.uniqcast.com:22443/tt1172203_sita_sings_the_blues/playlist.m3u8'

                      // 'https://cloud-demo.uniqcast.com:8445/content/hls/timetravels/arenasportbh-1609600_22621661764620jjones1661772422DESKTOP/recordings/arenasportbh/arenasportbh-1609600/playlists/arenasportbh-1609600_22621661764620jjones1661772422DESKTOP/desktop.m3u8?user=jjones&valid_to=1661858822&stream_count=3&uid=0-arenasportbh&hash=543084bea29a4ac5390cd48763afca86'

                      'https://cloud-demo.uniqcast.com:8445/content/hls/timetravels/tf1-9138478_26221663144860jjones1663147279DESKTOP/recordings/tf1/tf1-9138478/playlists/tf1-9138478_26221663144860jjones1663147279DESKTOP/desktop.m3u8?user=jjones&valid_to=1663233679&stream_count=3&uid=0-tf1&hash=2737d90c6237e83816fa4f545be41726'

                      // "https://office-new-dev.uniqcast.com:12611/auth-streaming/2,c352f2f218b2cdc39c643263de38b115fb05a619,1663222624,slobodan,0-hrt1w,8,8,8,8,8,8,DESKTOP,4076,all,none,default_basic,92.53.60.49/playlist/0-hrt1w/live/index.m3u8",
                      // drmConfiguration: BetterPlayerDrmConfiguration(
                      //   headers: {
                      //     'Authorization':
                      //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjUxLCJ1bmFtZSI6InNsb2JvZGFuIiwicm9sZSI6WyJzdWJzY3JpYmVyIl0sImRpZCI6NDA3NiwiZHVpZCI6ImE4ZDdiOGEwLTMzZjQtMTFlZC1iZWM1LTFmMzBkY2Y1ODE5MSIsIm9pZCI6Mywib3VpZCI6ImRlZmF1bHRfYmFzaWMiLCJyaWQiOjMsInJ1aWQiOiJkZWZhdWx0IiwicG5hbWUiOiJTbG9ib2RhbiIsIm1waW4iOiIwZmZlMWFiZDFhMDgyMTUzNTNjMjMzZDZlMDA5NjEzZTk1ZWVjNDI1MzgzMmE3NjFhZjI4ZmYzN2FjNWExNTBjIiwicHBpbiI6IjExMTEiLCJpYXQiOjE2NjMxMzYxNDksImV4cCI6MTY2MzEzNzk0OSwiaXNzIjoidW5pcUNhc3QiLCJzdWIiOiJsb2dpbiJ9.CNzqkqH2TqyCEnNQzQw2I2LNx8GoxIODia9oq9M4Y8U'
                      //   },
                      //   drmType: DrmType.widevine,
                      //   licenseUrl:
                      //       'https://office-new-dev.uniqcast.com:12611/drmproxy/wv/license?lat=2I8mtqM5%2F6IdGKu2vcuU8so1x41ZiXF2F5tiLhAyShEVP9L6OM9T4ad41w83qw2d0snxIpJ3744URh%2F3Xu27hNBqmRk9EiUi8N8vKZlmkoA1fh8TXvMrHRi4xs5G0oLFdwgYp7Y5RE6qzx8rHXn2ZxuxO2f99XnNu2xdd54h7rYQUDpG7G5jmAiq%2FS4RZ46vu%2B%2BVLp7WFCfEilXiyfiyUHL7IS04vyGc0guXQNpfHPE%3D',
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
