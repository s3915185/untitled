class UserConfigurationDTO {
  final int? id;
  final int? userInfoId;
  final String? name;
  final List<String>? categories;

  UserConfigurationDTO({
    this.id,
    this.userInfoId,
    this.name,
    this.categories,
  });

  // Factory constructor to create an instance from a JSON map
  factory UserConfigurationDTO.fromJson(Map<String, dynamic> json) {
    return UserConfigurationDTO(
      id: json['id'] as int?,
      userInfoId: json['userInfoId'] as int?,
      name: json['name'] as String?,
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : null,
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'userInfoId': userInfoId,
    'name': name,
    'categories': categories,
  };
}
