import 'package:dart_json_mapper/dart_json_mapper.dart'
    show JsonMapper, jsonSerializable, JsonProperty, enumConverterNumeric;

@jsonSerializable
class CacheObj {

  String key;
  String subKey;
  @JsonProperty(name: "max_age_date")
  int maxAgeDate;
  @JsonProperty(name: "max_stale_date")
  int maxStaleDate;
  List<int> content;
  int statusCode;
  List<int> headers;

  CacheObj._(
      this.key, this.subKey, this.content, this.statusCode, this.headers);

  factory CacheObj(String key, List<int> content,
      {String subKey = "",
        Duration maxAge,
        Duration maxStale,
        int statusCode = 200,
        List<int> headers}) {
    return CacheObj._(key, subKey, content, statusCode, headers)
      ..maxAge = maxAge
      ..maxStale = maxStale;
  }

  set maxAge(Duration duration) {
    if (null != duration) this.maxAgeDate = _convertDuration(duration);
  }

  set maxStale(Duration duration) {
    if (null != duration) this.maxStaleDate = _convertDuration(duration);
  }

  _convertDuration(Duration duration) =>
      DateTime.now().add(duration).millisecondsSinceEpoch;

  factory CacheObj.fromJson(Map<String, dynamic> json) => JsonMapper.fromMap<CacheObj>(json);
  Map<String, dynamic> toJson() => JsonMapper.toMap(this);
}