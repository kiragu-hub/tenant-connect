class ApiService {
  const ApiService();

  Future<String> getHealth() async {
    return Future.value('Ready');
  }
}
