class ApiResponse {
  String status;
  String message;
  String code;
  String authentication;
  String generateCode;
  dynamic record;

  ApiResponse.fromJson(Map<String, dynamic> item)
      : code = item['code'],
        status = item['status'],
        message = item['message'],
        authentication = item['authentication'],
        generateCode = item['generate_code'],
        record = item['record'];

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'code': code,
    'record': record,
  };
}