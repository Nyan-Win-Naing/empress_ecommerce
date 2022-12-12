import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'user_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_USER_VO, adapterName: "UserVOAdapter")
class UserVO {
  @JsonKey(name: "_id")
  @HiveField(0)
  String? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  @JsonKey(name: "email")
  @HiveField(2)
  String? email;

  @JsonKey(name: "isAdmin")
  @HiveField(3)
  bool? isAdmin;

  @JsonKey(name: "token")
  @HiveField(4)
  String? token;

  UserVO({
    this.id,
    this.name,
    this.email,
    this.isAdmin,
    this.token,
  });

  factory UserVO.fromJson(Map<String, dynamic> json) => _$UserVOFromJson(json);

  Map<String, dynamic> toJson() => _$UserVOToJson(this);

  @override
  String toString() {
    return 'UserVO{id: $id, name: $name, email: $email, isAdmin: $isAdmin, token: $token}';
  }
}
