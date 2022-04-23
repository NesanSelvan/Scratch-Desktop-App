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
