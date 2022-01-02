// To parse this JSON data, do
//
// final astrologerModel = astrologerModelFromJson(jsonString);

import 'dart:convert';

AstrologerModel astrologerModelFromJson(String str) =>
    AstrologerModel.fromJson(json.decode(str));

String astrologerModelToJson(AstrologerModel data) =>
    json.encode(data.toJson());

class AstrologerModel {
  AstrologerModel({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
    required this.data,
  });

  final String httpStatus;
  final int httpStatusCode;
  final bool success;
  final String message;
  final String apiName;
  final List<AstroModel> data;

  factory AstrologerModel.fromJson(Map<String, dynamic> json) =>
      AstrologerModel(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: List<AstroModel>.from(
            json["data"].map((x) => AstroModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AstroModel {
  AstroModel({
    required this.id,
    required this.urlSlug,
    required this.namePrefix,
    required this.firstName,
    required this.lastName,
    required this.aboutMe,
    required this.profliePicUrl,
    required this.experience,
    required this.languages,
    required this.minimumCallDuration,
    required this.minimumCallDurationCharges,
    required this.additionalPerMinuteCharges,
    required this.isAvailable,
    required this.skills,
    required this.isOnCall,
    required this.freeMinutes,
    required this.additionalMinute,
    required this.images,
  });

  final int id;
  final String urlSlug;
  final String namePrefix;
  final String firstName;
  final String lastName;
  final String aboutMe;
  final dynamic profliePicUrl;
  final double experience;
  final List<Language> languages;
  final int minimumCallDuration;
  final double minimumCallDurationCharges;
  final double additionalPerMinuteCharges;
  final bool isAvailable;
  final List<Skill> skills;
  final bool isOnCall;
  final int freeMinutes;
  final int additionalMinute;
  final Images images;

  factory AstroModel.fromJson(Map<String, dynamic> json) => AstroModel(
        id: json["id"],
        urlSlug: json["urlSlug"],
        namePrefix: json["namePrefix"] ?? 'Not Available',
        firstName: json["firstName"],
        lastName: json["lastName"],
        aboutMe: json["aboutMe"] ?? '',
        profliePicUrl: json["profliePicUrl"],
        experience: json["experience"],
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        minimumCallDuration: json["minimumCallDuration"],
        minimumCallDurationCharges: json["minimumCallDurationCharges"],
        additionalPerMinuteCharges: json["additionalPerMinuteCharges"],
        isAvailable: json["isAvailable"],
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        isOnCall: json["isOnCall"],
        freeMinutes: json["freeMinutes"],
        additionalMinute: json["additionalMinute"],
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urlSlug": urlSlug,
        "namePrefix": namePrefix,
        "firstName": firstName,
        "lastName": lastName,
        "aboutMe": aboutMe,
        "profliePicUrl": profliePicUrl,
        "experience": experience,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "minimumCallDuration": minimumCallDuration,
        "minimumCallDurationCharges": minimumCallDurationCharges,
        "additionalPerMinuteCharges": additionalPerMinuteCharges,
        "isAvailable": isAvailable,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "isOnCall": isOnCall,
        "freeMinutes": freeMinutes,
        "additionalMinute": additionalMinute,
        "images": images.toJson(),
      };
}

class Availability {
  Availability({
    required this.days,
    required this.slot,
  });

  final List<String> days;
  final Slot slot;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        days: List<String>.from(json["days"].map((x) => x)),
        slot: Slot.fromJson(json["slot"]),
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days.map((x) => x)),
        "slot": slot.toJson(),
      };
}

class Slot {
  Slot({
    required this.toFormat,
    required this.fromFormat,
    required this.from,
    required this.to,
  });

  final String toFormat;
  final String fromFormat;
  final String from;
  final String to;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        toFormat: json["toFormat"],
        fromFormat: json["fromFormat"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "toFormat": toFormat,
        "fromFormat": fromFormat,
        "from": from,
        "to": to,
      };
}

class Images {
  Images({
    required this.small,
    required this.large,
    required this.medium,
  });

  final Small small;
  final Large large;
  final Large medium;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: Small.fromJson(json["small"]),
        large: Large.fromJson(json["large"]),
        medium: Large.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small.toJson(),
        "large": large.toJson(),
        "medium": medium.toJson(),
      };
}

class Large {
  Large({
    required this.imageUrl,
    required this.id,
  });

  final String imageUrl;
  final int id;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "id": id,
      };
}

class Small {
  Small({
    this.imageUrl,
    this.id,
  });

  final dynamic imageUrl;
  final dynamic id;

  factory Small.fromJson(Map<String, dynamic> json) => Small(
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "id": id,
      };
}

class Language {
  Language({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Skill {
  Skill({
    required this.id,
    required this.name,
    required this.description,
  });

  final int id;
  final String name;
  final String description;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
