abstract class Failure {
  final String message;

  const Failure({
    required this.message,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
  });

  List<Object?> get props => [];
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({
    super.message = 'Internet connection failed',
  });

  List<Object?> get props => [];
}

class UnAuthenticatedFailure extends Failure {
  const UnAuthenticatedFailure({
    super.message = "Your account is not registered, try logging in again.",
  });

  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Internet connection failed',
  });

  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure({
    super.message = "The data could not be found",
  });

  List<Object?> get props => [];
}
