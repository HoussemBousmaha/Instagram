import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BaseUseCase<Response, Failure, Params> {
  Future<Either<Failure, Response>> call(Params params);

  const BaseUseCase();
}

@immutable
class NoParams {
  const NoParams();
}
