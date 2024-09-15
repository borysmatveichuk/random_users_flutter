// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Name _$NameFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Name',
      json,
      ($checkedConvert) {
        final val = Name(
          title: $checkedConvert('title', (v) => v as String),
          first: $checkedConvert('first', (v) => v as String),
          last: $checkedConvert('last', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'title': instance.title,
      'first': instance.first,
      'last': instance.last,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Location',
      json,
      ($checkedConvert) {
        final val = Location(
          city: $checkedConvert('city', (v) => v as String),
          state: $checkedConvert('state', (v) => v as String),
          country: $checkedConvert('country', (v) => v as String),
          postcode:
              $checkedConvert('postcode', (v) => Location._intSafeToString(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postcode': instance.postcode,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      email: json['email'] as String,
      phone: json['phone'] as String,
      cell: json['cell'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'gender': _$GenderEnumMap[instance.gender]!,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'phone': instance.phone,
      'cell': instance.cell,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
