import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request.freezed.dart';

@freezed
class AuthRequest with _$AuthRequest {
  const factory AuthRequest({
    required String email,
    required String password,
  }) = _AuthRequest;
}
