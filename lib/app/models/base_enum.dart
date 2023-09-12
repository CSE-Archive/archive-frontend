abstract class BaseEnumModel {
  final dynamic value;
  final String representation;
  final String queryParameterValue;

  const BaseEnumModel({
    required this.value,
    required this.representation,
    required this.queryParameterValue,
  });

  @override
  bool operator ==(Object other) =>
      other is BaseEnumModel &&
      other.runtimeType == runtimeType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;
}
