class AppAssets {
  AppAssets._();

  static const String baseDbURI = 'assets/images/db/';
  static const String personDbURI = '${baseDbURI}person_image.jpg';

  static const String baseAssetsURI = 'assets/images/';
  static const String mainBackground = '${baseAssetsURI}main_background.png';
  static const String noData = '${baseAssetsURI}no_data.png';
  static const String errorData = '${baseAssetsURI}error.png';

//logo
  static const String baseLogoURI = '${baseAssetsURI}logo/';
  static const String logoURI = '${baseLogoURI}app_icon.png';

  // static String get appName => SharedStorage.getLanguage() == "ar"
  //     ? "${baseLogoURI}app_name_ar.svg"
  //     : "${baseLogoURI}app_name_en.svg";
  //
  // static String get appNameGeneral => SharedStorage.getLanguage() == "ar"
  //     ? "${baseLogoURI}app_name_general_ar.svg"
  //     : "${baseLogoURI}app_name_general_en.svg";

  /*static String get splashLogo => SharedStorage.getLanguage() == "ar"
      ? baseLogoURI + "splash_logo_ar.png"
      : baseLogoURI + "splash_logo_en.png";*/
  static String splashLogo = "${baseLogoURI}splash_logo.png";

  //splash
  static const String baseSplashURI = '${baseAssetsURI}splash/';

  static const String splashBackGroundImageURI =
      '${baseSplashURI}splash_background.jpg';

  //auth assets
  static const String baseAuthURI = '${baseAssetsURI}auth/';

  static const String changeLanguageURI = '${baseAuthURI}changeLanguage.svg';

  //final auth
  static const String loginIcon = '${baseAuthURI}login_icon.svg';
  static const String registrationNewAccount =
      '${baseAuthURI}registeration_new_account.svg';
  static const String verifyCode = '${baseAuthURI}verify_code.svg';

  //request  asset
  static const String baseRequestURI = '${baseAssetsURI}request/';
  static const String cameraIcon = '${baseRequestURI}camera.svg';
  static const String galleryIcon = '${baseRequestURI}gallery.svg';
  static const String uploadImageIcon = '${baseRequestURI}uploadImage.svg';
  static const String saveTempIcon = '${baseRequestURI}saveTemp.svg';

  //place holder
  static const String placeHolder =
      'assets/images/place_holders/place_holder.png';

  //Home  asset
  static const String baseHomeURI = '${baseAssetsURI}home/';
  static const String appBackgroundURI = '${baseHomeURI}app_background_1.png';

  ///Home Page
  static const String homePageIconArrows = '${baseHomeURI}arrows.png';
  static const String homePageIconEdit = '${baseHomeURI}edit-image.png';
  static const String homePageIconImage = '${baseHomeURI}image.png';
  static const String homePageImageEnhancement =
      '${baseHomeURI}image_enhancement.png';
  static const String homePageImageRemoveBackground =
      '${baseHomeURI}remove_background.png';
  static const String homePageTeleprompter = '${baseHomeURI}teleprompter.png';
  static const String homePageAutoCaptions = '${baseHomeURI}auto_captions.png';
  static const String homePageRetouch = '${baseHomeURI}retouch.png';
  static const String homePageCamera = '${baseHomeURI}camera.png';
  static const String homePageAiPoster = '${baseHomeURI}ai_poster.png';
  static const String homePageCollapse = '${baseHomeURI}collapse.png';
  static const String homePageProductPhoto = '${baseHomeURI}product_photo.png';
  static const String homePageAutoCut = '${baseHomeURI}autoCut.png';
  static const String homePageAiModel = '${baseHomeURI}ai_model.png';
  static const String homePageListProjects = '${baseHomeURI}list_projects.png';

//bottom navigation Bar
  static const String baseBottomNavigationBarMenuURI =
      '${baseHomeURI}bottom_navigation_bar/';

  static const String cutIcon = '${baseBottomNavigationBarMenuURI}scissors.svg';

//prifile page
  static const String baseProfileURI = '${baseAssetsURI}profile/';

  static const String question = '${baseProfileURI}question.png';

  static const String profileTikTok = '${baseProfileURI}profile_tik_tok.jpg';
  static const String shareIcon = '${baseProfileURI}share.png';
  static const String pencilIcon = '${baseProfileURI}pencil.png';

//manage account
  static const String baseManageURI = '${baseAssetsURI}manage_account/';

  static const String googleIcon = '${baseManageURI}search.png';
  static const String tiktokIcon = '${baseManageURI}tiktok.png';
  static const String facebookIcon = '${baseManageURI}facebook.png';

  //drawer menu
  static const String baseDrawerMenuURI = '${baseAssetsURI}drawer_menu/';

  static const String scanIcon = '${baseDrawerMenuURI}scan.png';

  static const String blockedAccountsIcon =
      '${baseDrawerMenuURI}block-user.png';
  static const String manageAccountsIcon =
      '${baseDrawerMenuURI}manage_account.png';

  ////New Project
  static const String baseNewProject = '${baseAssetsURI}new_project/';
  static const String cancelNewProject = '${baseNewProject}close.png';
  static const String saveEditImageOrVideoNewProject =
      '${baseNewProject}save_edit_image_or_video.png';

  ////base_edit_items
  static const String baseEditItems = '${baseAssetsURI}edit_items/';
  static const String aspectRatioItem = '${baseEditItems}aspect_ratio.png';
  static const String audioItem = '${baseEditItems}audio.png';
  static const String backgroundItem = '${baseEditItems}background.png';
  static const String adjustItem = '${baseEditItems}adjust.png';
  static const String cutItem = '${baseEditItems}cut.png';
  static const String effectsItem = '${baseEditItems}effects.png';
  static const String filtersItem = '${baseEditItems}filters.png';
  static const String textItem = '${baseEditItems}text.png';
  static const String layersItem = '${baseEditItems}layers.png';
  static const String overlayItem = '${baseEditItems}overlay.png';

  ///audio_edit
  static const String baseAudioEdit = '${baseAssetsURI}audio_edit/';
  static const String copyrightAudioEdit = '${baseAudioEdit}copyright.png';
  static const String extractAudioEdit = '${baseAudioEdit}extract.png';
  static const String recordAudioEdit = '${baseAudioEdit}record.png';
  static const String soundFxAudioEdit = '${baseAudioEdit}sound_fx.png';
  static const String soundsAudioEdit = '${baseAudioEdit}sounds.png';

  ///text_edit
  static const String baseTextEdit = '${baseAssetsURI}text_edit/';
  static const String addTextTextEdit = "${baseTextEdit}add_text.png";
  static const String autoCaptionsTextEdit = "${baseTextEdit}auto_lyrics.png";
  static const String autoLyricsTextEdit = "${baseTextEdit}auto_captions.png";
  static const String drawTextEdit = "${baseTextEdit}draw.png";
  static const String stickersTextEdit = "${baseTextEdit}stickers.png";
  static const String textTemplateTextEdit = "${baseTextEdit}text_template.png";

  ///effects_edit
  static const String baseEffectsEdit = '${baseAssetsURI}effects_edit/';
  static const String bodyEffectsEffectsEdit =
      "${baseEffectsEdit}body_effects.png";
  static const String photoEffectsEffectsEdit =
      "${baseEffectsEdit}photo_effects.png";
  static const String videoEffectsEffectsEdit =
      "${baseEffectsEdit}video_effects.png";

  ///background_edit
  static const String baseBackgroundEdit = '${baseAssetsURI}background_edit/';
  static const String blurBackgroundEdit = "${baseBackgroundEdit}blur.png";
  static const String colorBackgroundEdit = "${baseBackgroundEdit}color.png";
  static const String imageBackgroundEdit = "${baseBackgroundEdit}image.png";

  ///edit_edit
  static const String baseEditEdit = '${baseAssetsURI}edit_edit/';
  static const String splitEditEdit = '${baseEditEdit}split.png';
  static const String speedEditEdit = '${baseEditEdit}speed.png';
  static const String animationEditEdit = '${baseEditEdit}animation.png';
  static const String styleEditEdit = '${baseEditEdit}style.png';
  static const String deleteEditEdit = '${baseEditEdit}delete.png';
  static const String enhanceVoiceEditEdit = '${baseEditEdit}enhance_voice.png';
  static const String isolateVoiceEditEdit = '${baseEditEdit}isolate_voice.png';
  static const String retouchEditEdit = '${baseEditEdit}retouch.png';
  static const String volumeEditEdit = '${baseEditEdit}volume.png';
  static const String transformEditEdit = '${baseEditEdit}transform.png';
  static const String autoReframeEditEdit = '${baseEditEdit}auto_reframe.png';
  static const String removeBGEditEdit = '${baseEditEdit}remove_bg.png';
  static const String basicEditEdit = '${baseEditEdit}basic.png';
  static const String editOnHypicEditEdit = '${baseEditEdit}edit_on_hypic.png';
  static const String maskEditEdit = '${baseEditEdit}mask.png';
  static const String duplicateEditEdit = '${baseEditEdit}duplicate.png';
  static const String replicateEditEdit = '${baseEditEdit}replicate.png';
  static const String extractAudioEditEdit = '${baseEditEdit}extractAudio.png';
  static const String motionBlurEditEdit = '${baseEditEdit}motion_blur.png';
  static const String stabilizeEditEdit = '${baseEditEdit}stabilize.png';
  static const String opacityEditEdit = '${baseEditEdit}opacity.png';
  static const String reverseEditEdit = '${baseEditEdit}reverse.png';
  static const String freezeEditEdit = '${baseEditEdit}freeze.png';
  static const String voiceEffectsEditEdit = '${baseEditEdit}voice_effects.png';
  static const String reduceNoiseEditEdit = '${baseEditEdit}reduce_noise.png';
  static const String beatsEditEdit = '${baseEditEdit}beats.png';
}
