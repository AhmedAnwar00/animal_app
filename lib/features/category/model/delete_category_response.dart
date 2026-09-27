class DeleteCategoryResponse {
  const DeleteCategoryResponse({
    required this.statusCode,
    required this.message,
  });

  final int statusCode;
  final String message;

  factory DeleteCategoryResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCategoryResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String? ?? '',
    );
  }
}
