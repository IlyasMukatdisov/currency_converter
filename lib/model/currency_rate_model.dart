class CurrencyModel {
  final String name;
  final double rate;
  final String flag;
  CurrencyModel({
    required this.name,
    required this.rate,
    required this.flag,
  });

  CurrencyModel copyWith({
    String? name,
    double? rate,
    String? flag,
  }) {
    return CurrencyModel(
      name: name ?? this.name,
      rate: rate ?? this.rate,
      flag: flag ?? this.flag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'rate': rate,
      'flag': flag,
    };
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      name: map['name'] as String,
      rate: map['rate'] as double,
      flag: map['flag'] as String,
    );
  }

  @override
  String toString() => 'CurrencyModel(name: $name, rate: $rate, flag: $flag)';

  @override
  bool operator ==(covariant CurrencyModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.rate == rate && other.flag == flag;
  }

  @override
  int get hashCode => name.hashCode ^ rate.hashCode ^ flag.hashCode;
}
