class Favourite {
  final int id;
  final String country;
  final String league;
  final String? flag;

  Favourite({
    required this.id,
    required this.country,
    required this.league,
    required this.flag,
  });

  factory Favourite.fromJson(Map<dynamic, dynamic> json) {
    return Favourite(
      id: json['id'],
      country: json['country'],
      league: json['league'],
      flag: json['flag'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'country': country,
    'league': league,
    'flag': flag,
  };
}
