// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Practice {

 String get id; DateTime get startAt; DateTime get endAt; String get studioName; String get memo; String get createdBy; DateTime get createdAt;
/// Create a copy of Practice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PracticeCopyWith<Practice> get copyWith => _$PracticeCopyWithImpl<Practice>(this as Practice, _$identity);

  /// Serializes this Practice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Practice&&(identical(other.id, id) || other.id == id)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.studioName, studioName) || other.studioName == studioName)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startAt,endAt,studioName,memo,createdBy,createdAt);

@override
String toString() {
  return 'Practice(id: $id, startAt: $startAt, endAt: $endAt, studioName: $studioName, memo: $memo, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PracticeCopyWith<$Res>  {
  factory $PracticeCopyWith(Practice value, $Res Function(Practice) _then) = _$PracticeCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startAt, DateTime endAt, String studioName, String memo, String createdBy, DateTime createdAt
});




}
/// @nodoc
class _$PracticeCopyWithImpl<$Res>
    implements $PracticeCopyWith<$Res> {
  _$PracticeCopyWithImpl(this._self, this._then);

  final Practice _self;
  final $Res Function(Practice) _then;

/// Create a copy of Practice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startAt = null,Object? endAt = null,Object? studioName = null,Object? memo = null,Object? createdBy = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,studioName: null == studioName ? _self.studioName : studioName // ignore: cast_nullable_to_non_nullable
as String,memo: null == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Practice].
extension PracticePatterns on Practice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Practice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Practice() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Practice value)  $default,){
final _that = this;
switch (_that) {
case _Practice():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Practice value)?  $default,){
final _that = this;
switch (_that) {
case _Practice() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime startAt,  DateTime endAt,  String studioName,  String memo,  String createdBy,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Practice() when $default != null:
return $default(_that.id,_that.startAt,_that.endAt,_that.studioName,_that.memo,_that.createdBy,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime startAt,  DateTime endAt,  String studioName,  String memo,  String createdBy,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Practice():
return $default(_that.id,_that.startAt,_that.endAt,_that.studioName,_that.memo,_that.createdBy,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime startAt,  DateTime endAt,  String studioName,  String memo,  String createdBy,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Practice() when $default != null:
return $default(_that.id,_that.startAt,_that.endAt,_that.studioName,_that.memo,_that.createdBy,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Practice implements Practice {
  const _Practice({required this.id, required this.startAt, required this.endAt, required this.studioName, required this.memo, required this.createdBy, required this.createdAt});
  factory _Practice.fromJson(Map<String, dynamic> json) => _$PracticeFromJson(json);

@override final  String id;
@override final  DateTime startAt;
@override final  DateTime endAt;
@override final  String studioName;
@override final  String memo;
@override final  String createdBy;
@override final  DateTime createdAt;

/// Create a copy of Practice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PracticeCopyWith<_Practice> get copyWith => __$PracticeCopyWithImpl<_Practice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PracticeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Practice&&(identical(other.id, id) || other.id == id)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.studioName, studioName) || other.studioName == studioName)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startAt,endAt,studioName,memo,createdBy,createdAt);

@override
String toString() {
  return 'Practice(id: $id, startAt: $startAt, endAt: $endAt, studioName: $studioName, memo: $memo, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PracticeCopyWith<$Res> implements $PracticeCopyWith<$Res> {
  factory _$PracticeCopyWith(_Practice value, $Res Function(_Practice) _then) = __$PracticeCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startAt, DateTime endAt, String studioName, String memo, String createdBy, DateTime createdAt
});




}
/// @nodoc
class __$PracticeCopyWithImpl<$Res>
    implements _$PracticeCopyWith<$Res> {
  __$PracticeCopyWithImpl(this._self, this._then);

  final _Practice _self;
  final $Res Function(_Practice) _then;

/// Create a copy of Practice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startAt = null,Object? endAt = null,Object? studioName = null,Object? memo = null,Object? createdBy = null,Object? createdAt = null,}) {
  return _then(_Practice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,studioName: null == studioName ? _self.studioName : studioName // ignore: cast_nullable_to_non_nullable
as String,memo: null == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
