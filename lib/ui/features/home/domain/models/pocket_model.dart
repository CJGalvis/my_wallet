
class Pocket {
  final int? id;
  final String type;
  final String name;
  final double balance;

  Pocket({
    this.id,
    required this.type,
    required this.name,
    required this.balance,
  });

  factory Pocket.initial() => Pocket(
        type: '',
        name: '',
        balance: 0,
      );

  Pocket copyWith({
    String? type,
    String? name,
    double? balance,
  }) {
    return Pocket(
      id: id,
      type: type ?? this.type,
      name: name ?? this.name,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'name': name,
      'balance': balance,
    };
  }

  static Pocket fromMap(Map<String, dynamic> map) {
    return Pocket(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      balance: map['balance'],
    );
  }
}
