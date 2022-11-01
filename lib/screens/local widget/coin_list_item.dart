import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/coin_model.dart';

class CoinListItem extends StatelessWidget {
  final CoinModel coinModel;


  CoinListItem({super.key, required this.coinModel});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coinModel.data?.length ?? 0,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.05)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pinkAccent.withOpacity(0.3),
                ),
                child: const Center(
                  child: Text('Icon'),
                ),
                height: 60,
                width: 60,
              ),
              const SizedBox(width: 20),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        coinModel.data?[index].id.toString() ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        coinModel.data?[index].symbol.toString() ?? '',
                        style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          NumberFormat.compactSimpleCurrency(locale: 'en-US').format(double.parse(coinModel.data?[index].marketCapUsd)),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            coinModel.data?[index].changePercent24Hr.toString().substring(0,6) ??
                                '',
                            style: const TextStyle(
                                color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
