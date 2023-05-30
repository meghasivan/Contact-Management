// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Contact {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  Map<String, dynamic> get address => throw _privateConstructorUsedError;
  Map<String, dynamic> get company => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {int id,
      String name,
      String username,
      String email,
      String phoneNumber,
      String website,
      Map<String, dynamic> address,
      Map<String, dynamic> company});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    int? id = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? website = null,
    Map<String, dynamic>? address = null,
    Map<String, dynamic>? company = null,
  }) {
    return _then(_value.copyWith(
      id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
      ,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
      ,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
      ,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$_ContactCopyWith(
          _$_Contact value, $Res Function(_$_Contact) then) =
      __$$_ContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String username,
      String email,
      String phoneNumber,
      String website,
      Map<String, dynamic> address,
      Map<String, dynamic> company});
}

/// @nodoc
class __$$_ContactCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$_Contact>
    implements _$$_ContactCopyWith<$Res> {
  __$$_ContactCopyWithImpl(_$_Contact _value, $Res Function(_$_Contact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    int? id = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? website = null,
    Map<String, dynamic>? address = null,
    Map<String, dynamic>? company = null,
  }) {
    return _then(_$_Contact(
      id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
      ,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
      ,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
      ,
    ));
  }
}

/// @nodoc

class _$_Contact implements _Contact {
  const _$_Contact(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.website,
      required this.address,
      required this.company});

  @override
  final int id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String website;
  @override
  final Map<String, dynamic> address;
  @override
  final Map<String, dynamic> company;

  @override
  String toString() {
    return 'Contact(id: $id, name: $name, username: $username, email: $email, phoneNumber: $phoneNumber, website: $website, address: $address, company: $company)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contact &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.company, company) || other.company == company));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, username, email,
      phoneNumber, website, address, company);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      __$$_ContactCopyWithImpl<_$_Contact>(this, _$identity);
}

abstract class _Contact implements Contact {
  const factory _Contact(
      {required final int id,
      required final String name,
      required final String username,
      required final String email,
      required final String phoneNumber,
      required final String website,
      required final Map<String, dynamic> address,
      required final Map<String, dynamic> company}) = _$_Contact;

  @override
  int get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get website;
  @override
  Map<String, dynamic> get address;
  @override
  Map<String, dynamic> get company;
  @override
  @JsonKey(ignore: true)
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      throw _privateConstructorUsedError;
}
