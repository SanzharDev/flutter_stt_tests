import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/providers/records_provider.dart';
import 'package:stt_flutter/src/screens/stateless_home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: RecordsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('TEST'),
          ),
          body: StatelessHomeScreen(),
        ),
      ),
    );
  }
}
