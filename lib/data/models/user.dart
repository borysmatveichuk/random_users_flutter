import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

part 'user.freezed.dart';

enum Gender {
  male,
  female,
}

@freezed
//@JsonSerializable(checked: true)
class User with _$User {
  const factory User({
    required Gender gender,
    required Name name,
    required Location location,
    required String email,
    required String phone,
    required String cell,
    required Picture picture,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable(checked: true)
class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable(checked: true)
class Location {
  final String city;
  final String state;
  final String country;
  @JsonKey(fromJson: _intSafeToString)
  final String postcode;

  Location({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  static String _intSafeToString(dynamic jsonVal) {
    return jsonVal?.toString() ?? '';
  }
}

@freezed
class Picture with _$Picture {
  const factory Picture({
    required String large,
    required String medium,
    required String thumbnail,
  }) = _Picture;

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);
}
/*
"gender": "female",
      "name": {
        "title": "Miss",
        "first": "Jennie",
        "last": "Nichols"
      },
      "location": {
        "street": {
          "number": 8929,
          "name": "Valwood Pkwy",
        },
        "city": "Billings",
        "state": "Michigan",
        "country": "United States",
        "postcode": "63104",
        "coordinates": {
          "latitude": "-69.8246",
          "longitude": "134.8719"
        },
        "timezone": {
          "offset": "+9:30",
          "description": "Adelaide, Darwin"
        }
      },
      "email": "jennie.nichols@example.com",
      "login": {
        "uuid": "7a0eed16-9430-4d68-901f-c0d4c1c3bf00",
        "username": "yellowpeacock117",
        "password": "addison",
        "salt": "sld1yGtd",
        "md5": "ab54ac4c0be9480ae8fa5e9e2a5196a3",
        "sha1": "edcf2ce613cbdea349133c52dc2f3b83168dc51b",
        "sha256": "48df5229235ada28389b91e60a935e4f9b73eb4bdb855ef9258a1751f10bdc5d"
      },
      "dob": {
        "date": "1992-03-08T15:13:16.688Z",
        "age": 30
      },
      "registered": {
        "date": "2007-07-09T05:51:59.390Z",
        "age": 14
      },
      "phone": "(272) 790-0888",
      "cell": "(489) 330-2385",
      "id": {
        "name": "SSN",
        "value": "405-88-3636"
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/75.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/75.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/75.jpg"
      },
      "nat": "US"
 */
