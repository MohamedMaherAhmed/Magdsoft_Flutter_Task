Map<String, dynamic> setPostVerifyRequestBody(
    {required String code, required phoneNumber}) {
  return {
    "code": code,
    "phone": phoneNumber,
  };
}
