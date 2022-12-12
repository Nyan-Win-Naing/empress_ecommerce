import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_vo.g.dart';

@JsonSerializable()
class SignUpRequest {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "password")
  String? password;

  SignUpRequest({this.name, this.email, this.password});

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}