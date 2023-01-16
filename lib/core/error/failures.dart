// ignore_for_file: public_member_api_docs, sort_constructors_first

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
    super.message = 'فشل الإتصال بالإنترنت',
  });

  List<Object?> get props => [];
}

class UnAuthenticatedFailure extends Failure {
  const UnAuthenticatedFailure({
    super.message = "حسابك غير مسجل حاول تسجيل الدخول مرة اخرى.",
  });

  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'فشل الإتصال بالإنترنت',
  });

  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({
    super.message = 'تعذر العثور علي البيانات',
  });

  List<Object?> get props => [];
}
