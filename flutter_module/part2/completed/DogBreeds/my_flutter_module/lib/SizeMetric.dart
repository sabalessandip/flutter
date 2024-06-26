import 'package:json_annotation/json_annotation.dart';

part 'SizeMetric.g.dart';

@JsonSerializable()
class SizeMetric {
  String imperial;
  String metric;

  SizeMetric(this.imperial, this.metric);

  factory SizeMetric.fromJson(Map<String, dynamic> json) =>
      _$SizeMetricFromJson(json);
  Map<String, dynamic> toJson() => _$SizeMetricToJson(this);
}
