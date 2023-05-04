import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify/Music/provider/musicProvider.dart';
import 'package:spotify/Music/veiw/playScreen.dart';

void main()
{
runApp(DevicePreview(
  enabled: !kReleaseMode,
  builder: (context) {
    return  Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => MusicProvider(),)
          ],
          builder: (context, child) {
            return MaterialApp(
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              // theme: ThemeData.light(),
              // darkTheme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              routes: {
                '/':(context) => PlayScreen()
              },);
          },
        );
      },
    );
  },
));
}