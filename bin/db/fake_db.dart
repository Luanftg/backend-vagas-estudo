class FakeDB {
  static final today = DateTime.now().millisecondsSinceEpoch;
  static final tomorrow =
      DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch;

  static List<Map<String, dynamic>> vacancyList = [
    {
      "id": 1,
      "title": 'Desenvolvedor Jr.',
      "description": "Vaga para desenvolvedor jr. na empresa Ifood",
      "image":
          'https://static.ifood.com.br/webapp/images/logo-smile-512x512.png',
      "createdAt": today,
      "updatedAt": tomorrow
    },
    {
      "id": 2,
      "title": 'Desenvolvedor Senior',
      "description": "Vaga para desenvolvedor Senior na empresa Ifood",
      "image":
          'https://static.ifood.com.br/webapp/images/logo-smile-512x512.png',
      "createdAt": today,
      "updatedAt": tomorrow
    }
  ];
}
