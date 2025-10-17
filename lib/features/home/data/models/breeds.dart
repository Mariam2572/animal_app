
import 'package:json_annotation/json_annotation.dart';
part 'breeds.g.dart';

@JsonSerializable()
class Breeds {
  @JsonKey(name: 'weight')
  Weight? weight;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'cfa_url')
  String? cfaUrl;
  @JsonKey(name: 'vetstreet_url')
  String? vetstreetUrl;
  @JsonKey(name: 'vcahospitals_url')
  String? vcahospitalsUrl;
  @JsonKey(name: 'temperament')
  String? temperament;
  @JsonKey(name: 'origin')
  String? origin;
  @JsonKey(name: 'country_codes')
  String? countryCodes;
  @JsonKey(name: 'country_code')
  String? countryCode;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'life_span')
  String? lifeSpan;
  @JsonKey(name: 'indoor')
  int? indoor;
  @JsonKey(name: 'lap')
  int? lap;
  @JsonKey(name: 'alt_names')
  String? altNames;
  @JsonKey(name: 'adaptability')
  int? adaptability;
  @JsonKey(name: 'affection_level')
  int? affectionLevel;
  @JsonKey(name: 'child_friendly')
  int? childFriendly;
  @JsonKey(name: 'dog_friendly')
  int? dogFriendly;
  @JsonKey(name: 'energy_level')
  int? energyLevel;
  @JsonKey(name: 'grooming')
  int? grooming;
  @JsonKey(name: 'health_issues')
  int? healthIssues;
  @JsonKey(name: 'intelligence')
  int? intelligence;
  @JsonKey(name: 'shedding_level')
  int? sheddingLevel;
  @JsonKey(name: 'social_needs')
  int? socialNeeds;
  @JsonKey(name: 'stranger_friendly')
  int? strangerFriendly;
  @JsonKey(name: 'vocalisation')
  int? vocalisation;
  @JsonKey(name: 'experimental')
  int? experimental;
  @JsonKey(name: 'hairless')
  int? hairless;
  @JsonKey(name: 'natural')
  int? natural;
  @JsonKey(name: 'rare')
  int? rare;
  @JsonKey(name: 'rex')
  int? rex;
  @JsonKey(name: 'suppressed_tail')
  int? suppressedTail;
  @JsonKey(name: 'short_legs')
  int? shortLegs;
  @JsonKey(name: 'wikipedia_url')
  String? wikipediaUrl;
  @JsonKey(name: 'hypoallergenic')
  int? hypoallergenic;
  @JsonKey(name: 'reference_image_id')
  String? referenceImageId;

  Breeds({this.weight, this.id, this.name, this.cfaUrl, this.vetstreetUrl, this.vcahospitalsUrl, this.temperament, this.origin, this.countryCodes, this.countryCode, this.description, this.lifeSpan, this.indoor, this.lap, this.altNames, this.adaptability, this.affectionLevel, this.childFriendly, this.dogFriendly, this.energyLevel, this.grooming, this.healthIssues, this.intelligence, this.sheddingLevel, this.socialNeeds, this.strangerFriendly, this.vocalisation, this.experimental, this.hairless, this.natural, this.rare, this.rex, this.suppressedTail, this.shortLegs, this.wikipediaUrl, this.hypoallergenic, this.referenceImageId});

  factory Breeds.fromJson(Map<String, dynamic> json) => _$BreedsFromJson(json);

  static List<Breeds> fromList(List<Map<String, dynamic>> list) {
    return list.map(Breeds.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$BreedsToJson(this);
}

@JsonSerializable()
class Weight {
  @JsonKey(name: 'imperial')
  String? imperial;
  @JsonKey(name: 'metric')
  String? metric;

  Weight({this.imperial, this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  static List<Weight> fromList(List<Map<String, dynamic>> list) {
    return list.map(Weight.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$WeightToJson(this);
}