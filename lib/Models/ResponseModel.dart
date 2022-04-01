class ResponseModel {
  final String user;

  const ResponseModel({required this.user});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(user: json['user']);
  }
}
