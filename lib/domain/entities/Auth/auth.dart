import 'package:equatable/equatable.dart';

class LoginDTO extends Equatable {
  final String email;
  final String password;

  const LoginDTO({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
