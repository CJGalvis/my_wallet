
import 'pocket_type.dart';

class Pocket {
  final String id;
  final PocketType type;
  final String name;
  final double balance;

  Pocket({
    required this.id,
    required this.type,
    required this.name,
    required this.balance,
  });

  factory Pocket.initial() => Pocket(
        id: '',
        type: PocketType.initial(),
        name: '',
        balance: 0,
      );

  Pocket copyWith({
    PocketType? type,
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
}
