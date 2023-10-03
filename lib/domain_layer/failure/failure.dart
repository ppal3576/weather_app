 abstract class Failure{
  int? statusCode;
  String? message;

  Failure({this.statusCode, this.message});
}


class GeneralFailure extends Failure{
  GeneralFailure({int? statusCode, String? message}): super(statusCode: statusCode, message: message);
}
class ServerFailure extends Failure{
  ServerFailure({int? statusCode, String? message}): super(statusCode: statusCode, message: message);

}
class CacheFailure extends Failure{
  CacheFailure({int? statusCode, String? message}): super(statusCode: statusCode, message: message);
}