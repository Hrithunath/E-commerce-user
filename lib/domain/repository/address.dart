import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_shoes/domain/model/address.model.dart';

abstract class ShippingAddress {
  
  Future<void>saveAddress(AddressModel address);
  Stream<QuerySnapshot>fetchAddress(String userId);
  Future<void>deleteAddress(AddressModel address);
  Future<void>editAddress(AddressModel address);

}