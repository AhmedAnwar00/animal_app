class DeleteAnimalResponse {
  const DeleteAnimalResponse({required this.statusCode, required this.message});

  final int statusCode;
  final String message;

  factory DeleteAnimalResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAnimalResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String? ?? '',
    );
  }
}
