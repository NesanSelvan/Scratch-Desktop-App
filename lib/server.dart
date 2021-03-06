import 'dart:convert';
import 'dart:io';

String _host = InternetAddress.loopbackIPv4.host;
Future main() async {
  final server = await HttpServer.bind(_host, 4049);
  await for (final req in server) {
    final contentType = req.headers.contentType;
    final response = req.response;
    print("Request Method: ${req.method}");
    if (req.method == 'POST' &&
        contentType?.mimeType == 'application/json' /*1*/) {
      try {
        print("${response.statusCode}");
        final String content = await utf8.decoder.bind(req).join(); /*2*/
        final data = jsonDecode(content) as Map; /*3*/
        // var fileName = req.uri.pathSegments.last; /*4*/
        // await File(fileName).writeAsString(content, mode: FileMode.write);
        req.response
          ..statusCode = HttpStatus.ok
          ..write('Wrote data for ${data['name']}.');
      } catch (e) {
        response
          ..statusCode = HttpStatus.internalServerError
          ..write('Exception during file I/O: $e.');
      }
    } else {
      response
        ..statusCode = HttpStatus.methodNotAllowed
        ..write('Unsupported request: ${req.method}.');
    }
    await response.close();
  }
}
// name: annai_store
// description: A new Flutter project.

// # The following line prevents the package from being accidentally published to
// # pub.dev using `pub publish`. This is preferred for private packages.
// publish_to: "none" # Remove this line if you wish to publish to pub.dev

// # The following defines the version and build number for your application.
// # A version number is three numbers separated by dots, like 1.2.43
// # followed by an optional build number separated by a +.
// # Both the version and the builder number may be overridden in flutter
// # build by specifying --build-name and --build-number, respectively.
// # In Android, build-name is used as versionName while build-number used as versionCode.
// # Read more about Android versioning at https://developer.android.com/studio/publish/versioning
// # In iOS, build-name is used as CFBundleShortVersionString while build-number used as CFBundleVersion.
// # Read more about iOS versioning at
// # https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
// version: 1.0.0+1

// environment:
//   sdk: ">=2.12.0 <3.0.0"
// dependency_overrides:
//   platform: ^3.1.0
// dependencies:
//   barcode: ^2.1.0
//   cupertino_icons: ^1.0.2
//   custom:
//     git:
//       url: https://github.com/AgnelSelvan/custom_packages_flutter.git
//       path: custom
//   dartz: ^0.10.1
//   desktop_window_utils: ^0.0.3
//   dio: ^4.0.0
//   environments:
//     git:
//       url: https://github.com/AgnelSelvan/custom_packages_flutter.git
//       path: environments
//   excel:
//     git:
//       url: https://github.com/justkawal/excel.git
//       ref: null-safety
//   filepicker_windows: ^2.0.0
//   flutter:
//     sdk: flutter
//   flutter_bloc: ^8.0.1
//   flutter_screenutil: ^5.0.0+2
//   flutter_typeahead: ^3.1.3
//   freezed_annotation: ^1.1.0
//   get: ^4.1.4
//   http: ^0.13.3
//   json_annotation: ^4.0.1
//   localstorage: ^4.0.0+1
//   menubar:
//     git:
//       url: https://github.com/google/flutter-desktop-embedding.git
//       path: plugins/menubar
//   number_to_words: ^1.0.0
//   path_provider: ^2.0.2
//   pdf: ^3.4.2
//   printing: ^5.2.1
//   screenshot: ^1.2.3
//   syncfusion_flutter_barcodes: ^19.4.42
//   uuid: ^3.0.4
//   validators:
//     git:
//       url: https://github.com/AgnelSelvan/custom_packages_flutter.git
//       path: validators
    
//   window_size:
//     git:
//       url: https://github.com/google/flutter-desktop-embedding.git
//       path: plugins/window_size

// dev_dependencies:
//   build_runner: null
//   flutter_test:
//     sdk: flutter
//   freezed: ^1.1.1
//   json_serializable: ^6.1.4
//   lint: ^1.5.3
//   msix: ^3.6.2

// # For information on the generic Dart part of this file, see the
// # following page: https://dart.dev/tools/pub/pubspec
// # The following section is specific to Flutter.
// flutter:
//   # The following line ensures that the Material Icons font is
//   # included with your application, so that you can use the icons in
//   # the material Icons class.
//   uses-material-design: true
//   # To add assets to your application, add an assets section, like this:
//   assets:
//     - assets/pdf/
//   #   - images/a_dot_ham.jpeg
//   # An image asset can refer to one or more resolution-specific "variants", see
//   # https://flutter.dev/assets-and-images/#resolution-aware.
//   # For details regarding adding assets from package dependencies, see
//   # https://flutter.dev/assets-and-images/#from-packages
//   # To add custom fonts to your application, add a fonts section here,
//   # in this "flutter" section. Each entry in this list should have a
//   # "family" key with the font family name, and a "fonts" key with a
//   # list giving the asset and other descriptors for the font. For
//   # example:
//   # fonts:
//   #   - family: Schyler
//   #     fonts:
//   #       - asset: fonts/Schyler-Regular.ttf
//   #       - asset: fonts/Schyler-Italic.ttf
//   #         style: italic
//   #   - family: Trajan Pro
//   #     fonts:
//   #       - asset: fonts/TrajanPro.ttf
//   #       - asset: fonts/TrajanPro_Bold.ttf
//   #         weight: 700
//   #
//   # For details regarding fonts from package dependencies,
//   # see https://flutter.dev/custom-fonts/#from-packages

// msix_config:
//   display_name: Annai Store
//   publisher_display_name: Agnel Selvan
//   identity_name: com.software.annai_store
//   msix_version: 1.0.0.0
//   logo_path: C:\Users\Agnel.Selvan\OneDrive - Aurum\Documents\some\assets\images\annai_store.png
//   capabilities:
//   debug: false
//   output_path: C:\Users\Agnel.Selvan\OneDrive - Aurum\Desktop\
//   output_name: testing
//   build_windows: true