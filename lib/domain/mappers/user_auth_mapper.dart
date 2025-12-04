import 'package:my_wallet/domain/mappers/base_mapper.dart';
import 'package:my_wallet/domain/models/user_auth_model.dart';

class UserAuthMapper extends Mapper<UserAuth> {
  @override
  UserAuth fromMap(Map<String, dynamic> json) {
    return UserAuth(
      email: json['email'],
      name: json['name'],
      photo: json['photo'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap(UserAuth data) {
    return {
      'email': data.email,
      'name': data.name,
      'photo': data.photo,
    };
  }
}
