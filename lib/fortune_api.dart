import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchFortune() async {
  final response = await http.get(Uri.parse('http://localhost:8080/fortune'));

  if (response.statusCode == 200) {
    final utf8Decoder = utf8.decoder;
    final decodedData = utf8Decoder.convert(response.bodyBytes);
    return jsonDecode(decodedData)['fortune'];
  } else {
    throw Exception('운세를 불러오는 데 실패했습니다.');
  }
}
