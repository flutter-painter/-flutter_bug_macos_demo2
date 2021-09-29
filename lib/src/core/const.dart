// import 'package:sembast/sembast.dart';

import 'package:flutter/services.dart';
import 'package:sembast/sembast.dart';

final defaultFirstDate = DateTime(2020, 02, 02, 0, 0, 0, 0, 000001);
final defaultLastDate = DateTime(3030, 03, 03, 23, 59, 59, 99, 999);

final inputFormatterNoAccent = <TextInputFormatter>[
  FilteringTextInputFormatter.deny(
      RegExp('[éèàâäêëïîôöùûüÿýçÉÈÀÂÄÊËÏÎÔÖÙÛÜÝŸÇ]')),
];

// * pursue and update to lighten the rpc
final StoreRef dbShops = intMapStoreFactory.store('shops');
final StoreRef dbShopsBranch = intMapStoreFactory.store('shops_branch');
final StoreRef dbTickets = intMapStoreFactory.store('tickets');
final StoreRef dbTicketsBranch = intMapStoreFactory.store('tickets_branch');

// same
Finder findByIdAndCreationDate(int id, DateTime creationDate) => Finder(
        filter: Filter.and([
      Filter.equals('id', id),
      Filter.equals('creationDate', creationDate.toIso8601String())
    ]));
