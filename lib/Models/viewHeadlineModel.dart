
import '../pages/repository.dart';
import 'headlinesModel.dart';


class NewsViewModel {
  NewsViewModel(city);
  static var rep = NewsRepositorys();

  static Future <HeadlinesModel> getHeadlines (city) async {
    final response =await rep.getHeadlines(city);
    return response;
  }

}

class NewsViewTopLiders {
  NewsViewTopLiders(name);

  static var rep = NewsLiders();


    static Future<TopLiders> getLiders (name) async {
    final response =await rep.getHeadlines(name);
    return response;
  }
}