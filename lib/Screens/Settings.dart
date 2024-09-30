import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import '../database/Fetchdata.dart';
import 'package:flutter/services.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late int hrs = data[0]['Study_hours'];
  late int minutes = data[0]['Study_minute'];
  late Uint8List xyz;
  @override
  String path1 = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  final path = await FlutterDocumentPicker.openDocument();
                  setState(() {
                    path1 = path!;
                    print(path);
                  });
                  File file = File(path!);
                  FirebaseStorage.instance
                      .ref()
                      .child('assignment ')
                      .putFile(file);
                },
                child: Column(children: [
                  const Text(
                    "Upload Assignment",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.black,
                    child: Image(
                      image: MemoryImage(xyz),
                    )
                  )
                ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () async {
                  String downloadURL = await FirebaseStorage.instance
                      .ref('assignment ')
                      .getDownloadURL();
                  String name = getFileName(downloadURL);
                  openfile(url: downloadURL, filename: name);
                  print(downloadURL);
                },
                child: const Text(
                  "View Assignment",
                  style:
                  TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
              ),
              TextButton(
                onPressed: () {
                  FlutterAlarmClock.createAlarm(hrs + 12, minutes,
                      title: 'Assignment');
                },
                child: const Text("Alarm"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openfile({required String url, String? filename}) async {
    final file = await downloadFile(url, filename!);
    if (file == null) return;
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }

  String getFileName(String url) {
    RegExp regExp = RegExp(r'.+(\/|%2F)(.+)\?.+');
    //This Regex won't work if you remove ?alt...token
    var matches = regExp.allMatches(url);

    var match = matches.elementAt(0);
    print(Uri.decodeFull(match.group(2)!));
    return Uri.decodeFull(match.group(2)!);
  }

  Future<Uint8List> getimg() async{
    final document =  await PdfDocument.openAsset('assets/sample.pdf');
    final page = await document.getPage(1);
    final pageImage = await page.render(width: 90, height: 90);
    await page.close();
    return pageImage!.bytes;
  }
}





