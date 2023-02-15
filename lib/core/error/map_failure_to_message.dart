import '../strings/failures.dart';
import 'failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return (failure as ServerFailure).message;
    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    case SignUpFailure:
      return (failure as SignUpFailure).message;
    default:
      return UNKNOWN_FAILURE_MESSAGE;
  }
}
