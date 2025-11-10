class Pokemon {
  int id;
  String name;
  String img;
  String type;
  int height;
  int weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
  });

  Pokemon.fromJson(Map<String, dynamic> data)
    : id = data['id'],
      name = data['name'][0].toUpperCase() + data['name'].substring(1),
      img =
          data['sprites']['other']['official-artwork']['front_default'] ??
          data['sprites']['front_default'],
      type = data['types'][0]['type']['name'][0].toUpperCase()+ data['types'][0]['type']['name'].substring(1),
      height = data['height'],
      weight = data['weight'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'img': img,
    'type': type,
    'height': height,
    'weight': weight,
  };
}
