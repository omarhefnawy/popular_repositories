import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:popular_repositories/core/utils/constants/app_constant.dart';
import 'package:popular_repositories/model/repo_model.dart';

abstract class PopularRepos{
  Future<List<RepositoryModel>>getPopularRepos({required DateTime date,required String programingLanguage, required int limit});

}
class PopularRepoImplementation implements PopularRepos{

  final dio = Dio();
  @override
  Future<List<RepositoryModel>> getPopularRepos({required DateTime date, required String programingLanguage, required int limit}) async{
    try
        {
          final formattedDate = DateFormat('yyyy-MM-dd').format(date);
          final query = 'created:>$formattedDate+language:$programingLanguage';
          final url = '${AppConstant.baseApiRepo}q=$query&sort=stars&order=desc&per_page=$limit';
          final  response = await dio.get(url);
          final List data= response.data['items'];
          return data.map((element){
            return RepositoryModel.fromJson(element);
          }).toList();
        }
        catch(e){
      throw Exception(e.toString());
        }
  }
}