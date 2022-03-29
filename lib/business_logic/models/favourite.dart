class Favourite {
  final int id;
  final String country;
  final String league;
  final String flag;
  final String type;

  Favourite({
    required this.id,
    required this.country,
    required this.league,
    required this.flag,
    required this.type,
  });

  factory Favourite.fromJson(Map<dynamic, dynamic> json) {
    return Favourite(
      id: json['id'],
      country: json['country'],
      league: json['league'],
      flag: json['flag'],
      type: json['type'],
    );
  }
}
