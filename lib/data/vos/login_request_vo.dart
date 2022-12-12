import 'package:json_annotation/json_annotation.dart';

part 'login_request_vo.g.dart';

@JsonSerializable()
class LoginRequestVO {
  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "password")
  String? password;

  LoginRequestVO({this.email, this.password});

  factory LoginRequestVO.fromJson(Map<String, dynamic> json) => _$LoginRequestVOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestVOToJson(this);
}