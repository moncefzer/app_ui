import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class LoginFailure extends Failure {
  final String message;

  LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class SignUpFailure extends Failure {
  final String message;

  SignUpFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class UnAuthenticatedFailure extends Failure {
  @override
  List<Object?> get props => [];
}
