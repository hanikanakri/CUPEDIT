import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '/core/database/db/sqflite.dart';
import '/core/utils/shared_storage.dart';

class OperationsOnDatabase {
/*  int? id;
  int? assetId;
  String? name;
  String? date;
  Duration? duration;
  TimeOfDay? time;*/
  Size? size;
  int? quality;

  static SqfliteDataBase sqfliteDataBase = SqfliteDataBase();

  OperationsOnDatabase({
/*    this.id,
    this.assetId,
    this.name,
    this.date,
    this.duration,
    this.time,*/
    this.size,
  });

  static Future insertData({
    int? assetId,
    String? name,
    String? date,
    Duration? duration,
    int? quality,
    String? assetFile,
  }) async {
    int respond = await sqfliteDataBase.insertDatabase('''
    INSERT INTO videos (assetId, name, date, duration,  quality, assetFile) 
    VALUES ($assetId, "$name", "$date", "$duration", "$quality", "$assetFile" )
    ''');

    final data = {
      "assetId": assetId,
      "name": "$name",
      "date": "$date",
      "duration": "$duration",
      "quality": "$quality",
      "assetFile": "$assetFile"
    };

    Logger logger = Logger(
      printer: PrettyPrinter(),
    );
    logger.i(data);

    print(respond);
  }

  static Future updateData({
    int? id,
    int? assetId,
    String? name,
    String? date,
    Duration? duration,
    int? quality,
    String? assetFile,
  }) async {
    int respond = await sqfliteDataBase.updateDatabase('''
    UPDATE 'videos'
    SET id = $id, assetId = $assetId, name = $name, date = "$date", duration = "$duration", quality = "$quality", assetFile = "$assetFile"
    WHERE id = $id
    ''');

    final data = {
      "id": id,
      "assetId": assetId,
      "name": "$name",
      "date": "$date",
      "duration": "$duration",
      "quality": "$quality",
      "assetFile": "$assetFile"
    };

    Logger logger = Logger(
      printer: PrettyPrinter(),
    );
    logger.i(data);

    print(respond);
  }

  static Future deleteData({int? id}) async {
    //int deleteId = id!;
    int respond = await sqfliteDataBase.deleteMyDatabase('''
    DELETE FROM 'videos' WHERE id = "$id"
    ''');

    final data = {
      "id": id,
    };

    Logger logger = Logger(
      printer: PrettyPrinter(),
    );
    logger.i(data);

    print(respond);
  }

  static Future<List<DatabaseModel>> readData() async {
    List<Map<String, dynamic>> response =
    await sqfliteDataBase.readDatabase("SELECT * FROM 'videos' ");

    final List<DatabaseModel> data =
    response.map((map) => DatabaseModel.fromJson(map)).toList();

    print("================database has been read==================");
    return data;
  }

  Future<int?> setQuality() async {
    //int quality;

    final int videoWidth = size!.width.toInt();
    final int videoHeight = size!.height.toInt();
    print('Video resolution:  $videoHeight x $videoWidth');

    String videoQuality;

    if (videoHeight <= 256 && videoWidth <= 144) {
      videoQuality = '144p';
      quality = 300;
      SharedStorage.writeVideoQuality(300);
    } else if (videoHeight <= 320 && videoWidth <= 240) {
      videoQuality = '240p';
      quality = 500;
      SharedStorage.writeVideoQuality(500);
    } else if (videoHeight <= 480 && videoWidth <= 360) {
      videoQuality = '360p';
      quality = 1000;
      SharedStorage.writeVideoQuality(1000);
    } else if (videoHeight <= 640 && videoWidth <= 480) {
      videoQuality = '480p';
      quality = 1500;
      SharedStorage.writeVideoQuality(1500);
    } else if (videoHeight <= 1280 && videoWidth <= 720) {
      videoQuality = '720p';
      quality = 3000;
      SharedStorage.writeVideoQuality(3000);
    } else if (videoHeight <= 1920 && videoWidth <= 1080) {
      videoQuality = '1080p';
      quality = 5000;
      SharedStorage.writeVideoQuality(5000);
    } else if (videoHeight <= 2560 && videoWidth <= 1440) {
      videoQuality = '1440p';
      quality = 8000;
      SharedStorage.writeVideoQuality(8000);
    } else if (videoHeight <= 3840 && videoWidth <= 2160) {
      videoQuality = '2160p';
      quality = 16000;
      SharedStorage.writeVideoQuality(16000);
    } else {
      videoQuality = 'Unknown';
      quality = 5000;
      SharedStorage.writeVideoQuality(5000);
    }

    print(quality);

    return quality;
  }
}

class DatabaseModel {
  int? id;
  int? assetId;
  String? name;
  String? date;
  String? duration;
  String? assetFile;
  int? quality;

  DatabaseModel({
    this.id,
    this.assetId,
    this.name,
    this.date,
    this.duration,
    this.assetFile,
    this.quality,
  });

  factory DatabaseModel.fromJson(Map<String, dynamic> json) => DatabaseModel(
    id: json["id"],
    assetId: json["assetId"],
    name: json["name"],
    assetFile: json["assetFile"],
    date: json["date"],
    duration: json["duration"],
    quality: json["quality"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "assetId": assetId,
    "name": name,
    "date": date,
    "duration": duration,
    "quality": quality,
    "assetFile": assetFile,
  };
}