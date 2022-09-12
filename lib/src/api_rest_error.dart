import 'package:equatable/equatable.dart';

class ApiRestError extends Equatable {
  final String errorCode;
  final String message;

  const ApiRestError(
    this.errorCode,
    this.message,
  );

  @override
  List<Object?> get props => [
        errorCode,
        message,
      ];
}
