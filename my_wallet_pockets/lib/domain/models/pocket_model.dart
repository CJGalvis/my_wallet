class Pocket {
  final String? id;
  final String type;
  final String name;
  final String owner;
  final String created;
  final double balance;

  Pocket({
    this.id,
    required this.type,
    required this.name,
    required this.balance,
    required this.owner,
    required this.created,
  });

  factory Pocket.initial() => Pocket(
    type: '',
    name: '',
    balance: 0,
    owner: '',
    created: DateTime.now().toString(),
  );

  Pocket copyWith({
    String? type,
    String? name,
    String? owner,
    double? balance,
  }) {
    return Pocket(
      id: id,
      type: type ?? this.type,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      owner: owner ?? this.owner,
      created: created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'name': name,
      'balance': balance,
      'owner': owner,
      'created': created,
    };
  }

  static Pocket fromMap(Map<String, dynamic> map) {
    return Pocket(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      balance: (map['balance'] as num).toDouble(),
      owner: map['owner'],
      created: map['created'],
    );
  }
}
