// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'busy_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusySlot {

 String get id; String get memberUid; DateTime get startAt; DateTime get endAt; InputMode get sourceInputMode; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of BusySlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusySlotCopyWith<BusySlot> get copyWith => _$BusySlotCopyWithImpl<BusySlot>(this as BusySlot, _$identity);

  /// Serializes this BusySlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusySlot&&(identical(other.id, id) || other.id == id)&&(identical(other.memberUid, memberUid) || other.memberUid == memberUid)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.sourceInputMode, sourceInputMode) || other.sourceInputMode == sourceInputMode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,memberUid,startAt,endAt,sourceInputMode,createdAt,updatedAt);

@override
String toString() {
  return 'BusySlot(id: $id, memberUid: $memberUid, startAt: $startAt, endAt: $endAt, sourceInputMode: $sourceInputMode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BusySlotCopyWith<$Res>  {
  factory $BusySlotCopyWith(BusySlot value, $Res Function(BusySlot) _then) = _$BusySlotCopyWithImpl;
@useResult
$Res call({
 String id, String memberUid, DateTime startAt, DateTime endAt, InputMode sourceInputMode, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$BusySlotCopyWithImpl<$Res>
    implements $BusySlotCopyWith<$Res> {
  _$BusySlotCopyWithImpl(this._self, this._then);

  final BusySlot _self;
  final $Res Function(BusySlot) _then;

/// Create a copy of BusySlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? memberUid = null,Object? startAt = null,Object? endAt = null,Object? sourceInputMode = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberUid: null == memberUid ? _self.memberUid : memberUid // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,sourceInputMode: null == sourceInputMode ? _self.sourceInputMode : sourceInputMode // ignore: cast_nullable_to_non_nullable
as InputMode,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BusySlot].
extension BusySlotPatterns on BusySlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusySlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusySlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusySlot value)  $default,){
final _that = this;
switch (_that) {
case _BusySlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusySlot value)?  $default,){
final _that = this;
switch (_that) {
case _BusySlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String memberUid,  DateTime startAt,  DateTime endAt,  InputMode sourceInputMode,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusySlot() when $default != null:
return $default(_that.id,_that.memberUid,_that.startAt,_that.endAt,_that.sourceInputMode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String memberUid,  DateTime startAt,  DateTime endAt,  InputMode sourceInputMode,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BusySlot():
return $default(_that.id,_that.memberUid,_that.startAt,_that.endAt,_that.sourceInputMode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String memberUid,  DateTime startAt,  DateTime endAt,  InputMode sourceInputMode,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BusySlot() when $default != null:
return $default(_that.id,_that.memberUid,_that.startAt,_that.endAt,_that.sourceInputMode,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusySlot implements BusySlot {
  const _BusySlot({required this.id, required this.memberUid, required this.startAt, required this.endAt, required this.sourceInputMode, required this.createdAt, required this.updatedAt});
  factory _BusySlot.fromJson(Map<String, dynamic> json) => _$BusySlotFromJson(json);

@override final  String id;
@override final  String memberUid;
@override final  DateTime startAt;
@override final  DateTime endAt;
@override final  InputMode sourceInputMode;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of BusySlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusySlotCopyWith<_BusySlot> get copyWith => __$BusySlotCopyWithImpl<_BusySlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusySlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusySlot&&(identical(other.id, id) || other.id == id)&&(identical(other.memberUid, memberUid) || other.memberUid == memberUid)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.sourceInputMode, sourceInputMode) || other.sourceInputMode == sourceInputMode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,memberUid,startAt,endAt,sourceInputMode,createdAt,updatedAt);

@override
String toString() {
  return 'BusySlot(id: $id, memberUid: $memberUid, startAt: $startAt, endAt: $endAt, sourceInputMode: $sourceInputMode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BusySlotCopyWith<$Res> implements $BusySlotCopyWith<$Res> {
  factory _$BusySlotCopyWith(_BusySlot value, $Res Function(_BusySlot) _then) = __$BusySlotCopyWithImpl;
@override @useResult
$Res call({
 String id, String memberUid, DateTime startAt, DateTime endAt, InputMode sourceInputMode, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$BusySlotCopyWithImpl<$Res>
    implements _$BusySlotCopyWith<$Res> {
  __$BusySlotCopyWithImpl(this._self, this._then);

  final _BusySlot _self;
  final $Res Function(_BusySlot) _then;

/// Create a copy of BusySlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? memberUid = null,Object? startAt = null,Object? endAt = null,Object? sourceInputMode = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_BusySlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberUid: null == memberUid ? _self.memberUid : memberUid // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,sourceInputMode: null == sourceInputMode ? _self.sourceInputMode : sourceInputMode // ignore: cast_nullable_to_non_nullable
as InputMode,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
