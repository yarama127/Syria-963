class TouristPlace {
  final String name;
  final String description;
  final String image;

  TouristPlace({
    required this.name,
    required this.description,
    required this.image,
  });
}

class Governorate {
  final String name;
  final String description;
  final String image;
  final List<TouristPlace> places;

  Governorate({
    required this.name,
    required this.description,
    required this.image,
    required this.places,
  });
}
