import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sharing_intent/flutter_sharing_intent.dart';
import 'package:flutter_sharing_intent/model/sharing_file.dart';
import 'package:fools_mate/pages/checker.dart';
import 'package:fools_mate/pages/home.dart';
import 'package:fools_mate/logic/query.dart' as queries;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late StreamSubscription _intentDataStreamSubscription;

  @override
  void initState() {
    super.initState();

    // For sharing images coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = FlutterSharingIntent.instance
        .getMediaStream()
        .listen((List<SharedFile> value) {
      if (value.isNotEmpty) {
        print("Shared: getMediaStream ${value.map((f) => f.value).join(",")}");
        handleSharedContent(value.first);
      }
    }, onError: (err) {
      print("getIntentDataStream error: $err");
    });

    // For sharing images coming from outside the app while the app is closed
    FlutterSharingIntent.instance
        .getInitialSharing()
        .then((List<SharedFile> value) {
      if (value.isNotEmpty) {
        print("Shared: getInitialMedia ${value.map((f) => f.value).join(",")}");
        handleSharedContent(value.first);
      }
    });
  }

  void handleSharedContent(SharedFile file) {
    switch (file.type) {
      case SharedMediaType.TEXT:
        navigatorKey.currentState!.push(MaterialPageRoute(
            builder: (context) =>
                Checker(query: queries.TextQuery(file.value!))));
        break;

      case SharedMediaType.URL:
        navigatorKey.currentState!.push(MaterialPageRoute(
            builder: (context) =>
                Checker(query: queries.UrlQuery(file.value!))));
        break;

      case SharedMediaType.IMAGE:
        navigatorKey.currentState!.push(MaterialPageRoute(
            builder: (context) => Checker(query: queries.MediaQuery())));
        break;

      case SharedMediaType.VIDEO:
        navigatorKey.currentState!.push(MaterialPageRoute(
            builder: (context) => Checker(query: queries.MediaQuery())));
        break;

      default:
        print("Unsupported shared file type ${file.type}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: const Home(),
    );
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }
}
