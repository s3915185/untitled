class UserInfoDTO {
  final int? id;
  final String? name;

  UserInfoDTO({this.id, this.name});

  factory UserInfoDTO.fromJson(Map<String, dynamic> json) {
    return UserInfoDTO(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}