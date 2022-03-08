import 'package:http/http.dart' as http;

const _apiKey = 'cee8c763a5mshd7b39adcda79b1dp1ced93jsnfe7be9f7123d';
const String _baseUrl = "api-football-beta.p.rapidapi.com";
const Map<String, String> _headers = {
  "content-type": "application/json",
  "x-rapidapi-host": "api-football-beta.p.rapidapi.com",
  "x-rapidapi-key": _apiKey,
};

class NewsService {
  // Base API request to get response
  Future<dynamic> getData(
      {required String endpoint, required Map<String, String>? query}) async {
    Uri uri = Uri.https(_baseUrl, endpoint, query);

    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getAllFixtures() async {
    const String endpoint = '/fixtures';
    const query = {"date": '2022-03-06'};

    final loadedData = await getData(endpoint: endpoint, query: query);
    return loadedData;
  }

  Future<dynamic> getAllLeagues() async {
    const String endpoint = '/leagues';

    final loadedData = await getData(endpoint: endpoint, query: null);
    return loadedData;
  }

  Future<dynamic> getAllStandings({
    required int leagueId,
    required int year
  }) async {
    const String endpoint = '/standings';
    var query = {'league': '$leagueId', 'season': '$year'};

    final loadedData = await getData(endpoint: endpoint, query: query);
    return loadedData;
  }
}
