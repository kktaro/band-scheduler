// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'band.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Band {

 String get id; String get name; String get leaderUid; List<String> get memberUids; DateTime get createdAt;
/// Create a copy of Band
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BandCopyWith<Band> get copyWith => _$BandCopyWithImpl<Band>(this as Band, _$identity);

  /// Serializes this Band to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Band&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.leaderUid, leaderUid) || other.leaderUid == leaderUid)&&const DeepCollectionEquality().equals(other.memberUids, memberUids)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,leaderUid,const DeepCollectionEquality().hash(memberUids),createdAt);

@override
String toString() {
  return 'Band(id: $id, name: $name, leaderUid: $leaderUid, memberUids: $memberUids, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BandCopyWith<$Res>  {
  factory $BandCopyWith(Band value, $Res Function(Band) _then) = _$BandCopyWithImpl;
@useResult
$Res call({
 String id, String name, String leaderUid, List<String> memberUids, DateTime createdAt
});




}
/// @nodoc
class _$BandCopyWithImpl<$Res>
    implements $BandCopyWith<$Res> {
  _$BandCopyWithImpl(this._self, this._then);

  final Band _self;
  final $Res Function(Band) _then;

/// Create a copy of Band
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? leaderUid = null,Object? memberUids = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,leaderUid: null == leaderUid ? _self.leaderUid : leaderUid // ignore: cast_nullable_to_non_nullable
as String,memberUids: null == memberUids ? _self.memberUids : memberUids // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Band].
extension BandPatterns on Band {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Band value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Band() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Band value)  $default,){
final _that = this;
switch (_that) {
case _Band():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Band value)?  $default,){
final _that = this;
switch (_that) {
case _Band() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String leaderUid,  List<String> memberUids,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Band() when $default != null:
return $default(_that.id,_that.name,_that.leaderUid,_that.memberUids,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String leaderUid,  List<String> memberUids,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Band():
return $default(_that.id,_that.name,_that.leaderUid,_that.memberUids,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String leaderUid,  List<String> memberUids,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Band() when $default != null:
return $default(_that.id,_that.name,_that.leaderUid,_that.memberUids,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Band implements Band {
  const _Band({required this.id, required this.name, required this.leaderUid, required final  List<String> memberUids, required this.createdAt}): _memberUids = memberUids;
  factory _Band.fromJson(Map<String, dynamic> json) => _$BandFromJson(json);

@override final  String id;
@override final  String name;
@override final  String leaderUid;
 final  List<String> _memberUids;
@override List<String> get memberUids {
  if (_memberUids is EqualUnmodifiableListView) return _memberUids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberUids);
}

@override final  DateTime createdAt;

/// Create a copy of Band
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BandCopyWith<_Band> get copyWith => __$BandCopyWithImpl<_Band>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Band&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.leaderUid, leaderUid) || other.leaderUid == leaderUid)&&const DeepCollectionEquality().equals(other._memberUids, _memberUids)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,leaderUid,const DeepCollectionEquality().hash(_memberUids),createdAt);

@override
String toString() {
  return 'Band(id: $id, name: $name, leaderUid: $leaderUid, memberUids: $memberUids, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BandCopyWith<$Res> implements $BandCopyWith<$Res> {
  factory _$BandCopyWith(_Band value, $Res Function(_Band) _then) = __$BandCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String leaderUid, List<String> memberUids, DateTime createdAt
});




}
/// @nodoc
class __$BandCopyWithImpl<$Res>
    implements _$BandCopyWith<$Res> {
  __$BandCopyWithImpl(this._self, this._then);

  final _Band _self;
  final $Res Function(_Band) _then;

/// Create a copy of Band
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? leaderUid = null,Object? memberUids = null,Object? createdAt = null,}) {
  return _then(_Band(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,leaderUid: null == leaderUid ? _self.leaderUid : leaderUid // ignore: cast_nullable_to_non_nullable
as String,memberUids: null == memberUids ? _self._memberUids : memberUids // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
