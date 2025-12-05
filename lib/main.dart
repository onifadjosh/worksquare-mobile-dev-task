import 'package:flutter/material.dart';
import 'package:worksquare_mobile_dev_task/widgets/footer.dart';
import 'package:worksquare_mobile_dev_task/widgets/listing.dart';
import 'package:worksquare_mobile_dev_task/widgets/newsletter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Listings(),
            NewsletterSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
