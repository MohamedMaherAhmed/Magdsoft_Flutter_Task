Map<String, dynamic> setPostLoginRequestBody(
    {required String fullName, required phoneNumber}) {
  return {
    "phone": phoneNumber,
    "name": fullName,
  };
}
