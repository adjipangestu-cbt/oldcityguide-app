abstract class VacationRepository {
  // Tambahkan parameter opsional languageCode
  Future<List<Map<String, Object>>> getVacationsList({String languageCode = 'id'});
}