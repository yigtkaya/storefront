// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kerimcelik/dependency_injections/global_di_holders.dart';
// import 'package:kerimcelik/local_storage/storage_key.dart';
// import 'package:kerimcelik/localization/app_localizations.dart';
// import 'package:kerimcelik/localization/helper/languages/turkish.dart';
// import 'package:kerimcelik/localization/helper/languages/english.dart';
// import 'package:kerimcelik/localization/helper/models/language.dart';
// import 'package:kerimcelik/src/app.dart';
// import 'package:kerimcelik/src/providers/dio/bearer_token_provider.dart';

// /// Supported Locales Provider
// /// Update this list to expand the number of supported locales in the app
// // final supportedLocalesProvider = Provider<List<Locale>>((_) {
// //   return const [
// //     Locale('en', 'US'),
// //     Locale('ja', 'JP'),
// //   ];
// // });

// // /// Locale Provider
// // /// Provides the current locale, and automatically updates when the locale changes.
// final localeProvider = Provider<Locale>((ref) {
//   return ref.watch(languageProvider).locale;
// });

// final languageProvider = StateNotifierProvider<LanguageController, Language>(
//   (ref) {
//     ref.listenSelf((previous, next) {
//       //env.langUrlCode = next.urlCode;
//       // env.currentLangId = next.id;
//     });
//     return LanguageController(
//       ref: ref,
//       supportedLanguages: [
//         turkish,
//         english,
//       ],
//     );
//   },
// );

// class LanguageController extends StateNotifier<Language> {
//   LanguageController({required this.supportedLanguages, required this.ref})
//       : super(
//           supportedLanguages.first,
//         ) {
//     _init();
//   }

//   final List<Language> supportedLanguages;
//   final Ref ref;

//   /// read saved theme mode
//   void _init() {
//     final languageId = hiveStorage.readInt(key: StorageKey.languageId);
//     if (languageId == null) {
//       // if there is nt sported language
//       final deviceLocale = Locale(Platform.localeName.substring(0, 2));
//       for (var element in supportedLanguages) {
//         if (element.locale.languageCode == deviceLocale.languageCode) {
//           state = element;
//           return;
//         }
//       }
//       return;
//     }
//     state = supportedLanguages.firstWhere((element) => element.id == languageId);
//   }

//   void updateAppLanguage({
//     required int languageId,
//   }) {
//     // if provided id is not in the supported languages then it will throw an error
//     state = supportedLanguages.firstWhere((element) => element.id == languageId);

//     hiveStorage.writeInt(key: StorageKey.languageId, value: languageId);
//     //setPreferredLanguage();
//   }

//   // Future<bool> setPreferredLanguage() async {
//   //   try {
//   //     final response = await _getDioClient.patch(
//   //       '/account/update-preferred-language',
//   //       data: {
//   //         "preferred_language": !currentLanguageIsTurkish ? 'tr' : 'en',
//   //       },
//   //     );
//   //     return response.statusCode == 200;
//   //   } catch (e) {
//   //     log('set_preffered_lang.dart: ${e.toString()}');
//   //   }
//   //   return false;
//   // }

//   Dio get _getDioClient {
//     final baseOptions = BaseOptions(
//       baseUrl: env.apiBaseUrl,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer ${ref.read(bearerTokenProvider)}',
//       },
//     );
//     return Dio(baseOptions);
//   }
// }

// /// get current context locale
// Locale get appLocale {
//   assert(
//     appNavigatorKey.currentContext != null,
//     "Don't you dare to use me without a proper [context]!!!",
//   );
//   return Localizations.localeOf(appNavigatorKey.currentContext!);
// }

// /// get AppLocalizations instance with global nav key
// AppLocalizations get tr {
//   assert(appNavigatorKey.currentContext != null, 'Dont you dare to use me without a proper [context]!!!');
//   return AppLocalizations.of(appNavigatorKey.currentContext!);
// }

// bool get currentLanguageIsTurkish => appLocale.languageCode == turkish.locale.languageCode;

// bool get currentLanguageIsEnglish => appLocale.languageCode == english.locale.languageCode;

// //int get currentLanguageId => currentLanguageIsTurkish ? turkish.id : english.id;
