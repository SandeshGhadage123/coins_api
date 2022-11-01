import 'package:coins_api/screens/local%20widget/coin_list_item.dart';
import 'package:flutter/material.dart';
import 'package:coins_api/repositories/network_handler.dart';
import '../model/coin_model.dart';


class CoinListScreen extends StatefulWidget {
  const CoinListScreen({Key? key}) : super(key: key);

  @override
  State<CoinListScreen> createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {

  CoinModel? _coinModel;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _coinModel = (await NetworkHandler().getHttp())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Coins API')),
      ),
      body: _coinModel != null ? CoinListItem(coinModel: _coinModel!,) : Container(),
    );
  }
}
