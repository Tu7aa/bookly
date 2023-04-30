import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure(' Send Connection timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure(' Receive Connection timeout with ApiServer');
      case DioErrorType.badCertificate:
        return ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioErrorType.connectionError:
        return ServerFailure('Error Connection  with ApiServer');
      case DioErrorType.unknown:
        if (dioError.message!.contains('other')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error ,Please try Again!');
      default:
        return ServerFailure('Opps There was an Error ,please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['massage']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found , please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error ,please try later');
    } else {
      return ServerFailure('Opps There was an Error ,please try again');
    }
  }
}
