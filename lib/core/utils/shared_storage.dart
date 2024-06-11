import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SharedStorage {
  static String storageName = 'CUPEDIT';
  static GetStorage box = GetStorage(storageName);
  static String tokenKey = 'userToken';
  static String tokenFCM = 'TokenFCM';
  static String userIdKey = 'userId';
  static String languageKey = 'language';
  static String successMessageKey = 'successMessage';
  static String imageURL = 'ImageURL';
  static String videoQuality = 'videoQuality';
  static String videoPath = 'videoPath';
  static String videoDuration = 'videoDuration';
  static String videoId = 'videoId';

  static init() async {
    await GetStorage.init(storageName);
  }

  static hasToken() {
    if (box.hasData(tokenKey)) {
      return true;
    } else {
      return false;
    }
  }

  static getToken() {
    return box.read(tokenKey);
  }

  static writeToken(value) {
    box.write(tokenKey, value);
  }

  static removeToken() {
    box.remove(tokenKey);
  }

  // static getFcmToken() {
  //   return box.read(tokenFCM);
  // }
  //
  // static writeFcmToken(value) {
  //   box.write(tokenFCM, value);
  // }

  static removeFcmToken() {
    box.remove(tokenFCM);
  }

  static getLanguage() {
    return box.read(languageKey) ?? "en";
  }

  static writeLanguage(value) {
    box.write(languageKey, value);
  }

  static getUserId() {
    return box.read(userIdKey);
  }

  static writeUserId(value) {
    box.write(userIdKey, value);
  }

  static getSuccessMessage() {
    return box.read(successMessageKey);
  }

  static writeSuccessMessage(value) {
    box.write(successMessageKey, value);
  }

  static writeVideoQuality(value) {
    box.write(videoQuality, value);
  }

  static getVideoQuality() {
    return box.read(videoQuality);
  }

  static writeVideoDuration(value) {
    box.write(videoDuration, value);
  }

  static getVideoDuration() {
    return box.read(videoDuration);
  }


  static writeVideoId(value){
    box.write(videoId, value);
  }

  static getVideoId(){
    return box.read(videoId);
  }


  static writeVideoPath(value) {
    box.write(videoPath, value);
    videoPathNotifier.value = value;
  }

  static getVideoPath() {
    return box.read(videoPath);
  }


  static final ValueNotifier<String> videoPathNotifier = ValueNotifier<String>(getVideoPath());


}
