import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';

@freezed
abstract class Contact with _$Contact {
  const factory Contact({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phoneNumber,
    required String website,
    required Map<String, dynamic> address,
    required Map<String, dynamic> company,
  }) = _Contact;
}
