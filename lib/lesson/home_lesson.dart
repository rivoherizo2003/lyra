import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:lyra/shared/pdfScreen/pdf_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class LessonHome extends StatefulWidget {
  const LessonHome({Key? key}) : super(key: key);

  @override
  State<LessonHome> createState() => _LessonHomeState();
}

class _LessonHomeState extends State<LessonHome> {
  bool _isLoading = true;
  String pathPdf = "";

  @override
  void initState() {
    super.initState();
    fromAsset("assets/solfa_lesona_lyra.pdf", "lesona.pdf").then((f) {
      setState(() {
        pathPdf = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String fileName) async {
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$fileName");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
      _isLoading = false;
    } catch (e) {
      throw Exception('Error parsing asset file');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Lesona'),
      ),
      body: Center(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : PdfScreen(key: UniqueKey(), path: pathPdf)),
    ));
  }
}
