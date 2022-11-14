List<Champion> getChampionData(Map<String, dynamic> data){
  List<Champion> championData = [];

  data.forEach((k, value) {
    championData.add(Champion.fromJson(value));
  });

  return championData;
}

class Champion{
  String? version;
  String? id;
  String? key;
  String? name;
  String? title;
  String? blurb;
  Map<String, double>? info;
  ImageVar? image;
  List<String>? tags;
  String? partype;
  Map<String, double>? stats;

  Champion({
    this.version,
    this.id,
    this.key,
    this.name,
    this.title,
    this.blurb,
    this.info,
    this.image,
    this.tags,
    this.partype,
    this.stats
  });

  factory Champion.fromJson(Map<String, dynamic> json) => Champion(
    version: json['version'],
    id: json['id'],
    key: json['key'],
    name: json['name'],
    title: json['title'],
    blurb: json['blurb'],
    info: Map.from(json['info']).map((key, value) => MapEntry<String, double>(key, value.toDouble())),
    image: ImageVar.fromJson(json['image']),
    tags: List<String>.from(json['tags'].map((x) => x)),
    partype: json['partype'],
    stats: Map.from(json['stats']).map((key, value) => MapEntry<String, double>(key, value.toDouble())),
  );
}

class ImageVar{
  String? full;
  String? sprite;
  String? group;
  int? x;
  int? y;
  int? w;
  int? h;

  ImageVar({
    this.full,
    this.sprite,
    this.group,
    this.x,
    this.y,
    this.w,
    this.h
  });

  factory ImageVar.fromJson(Map<String, dynamic> json) => ImageVar(
    full: json['full'],
    sprite: json['sprite'],
    group: json['group'],
    x: json['x'],
    y: json['y'],
    w: json['w'],
    h: json['h']
  );
}