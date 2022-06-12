import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final AuthModelData data;

  const AuthModel({required this.data});

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(data: AuthModelData.fromJson(json["data"]));

  @override
  List<Object?> get props => [data];
}

class AuthModelData extends Equatable {
  final String token;

  const AuthModelData({required this.token});

  factory AuthModelData.fromJson(Map<String, dynamic> json) =>
      AuthModelData(token: json["access_token"]);

  @override
  List<Object?> get props => [token];
}
