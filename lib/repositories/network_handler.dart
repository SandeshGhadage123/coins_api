import 'package:dio/dio.dart';

import '../model/coin_model.dart';

class NetworkHandler{
  final Dio dio = Dio();


  Future<CoinModel?> getHttp() async {
    try {
      var response = await dio.get('https://api.coincap.io/v2/assets');
      //print(response);
      if (response.statusCode == 200) {
        CoinModel _model = CoinModel.fromJson(response.data);
        //_model.data?[0].name;
        //print(_model.toJson().toString());
        return _model;

      }


    } catch (e) {
      print(e);
    }
  }

}