import '../models/speak.dart';
import "../../../generated_code/client_index.dart";

import "../../../common/ioc.dart";
import '../models/speak_model.dart';

class SpeakRepository {
  List<Speak>? _speaks;

  Future<List<Speak>> fetchSpeaksForToday() async {
    var apiClient = locator.get<Zooinator>();

    try {
      var response = await apiClient.getSpeaksForToday();

      if (!response.isSuccessful) {
        return Future.error(response.error.toString());
      }

      var speaks = response.body!.map((speak) {
        return Speak(
          speak.title,
          speak.start,
          speak.image,
          speak.days,
        );
      }).toList();

      return _speaks ??= speaks;
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}
