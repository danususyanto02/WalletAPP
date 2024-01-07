part of 'payment_method_bloc.dart';

sealed class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodFail extends PaymentMethodState {
  final String e;
  const PaymentMethodFail(this.e);

  @override
  List<Object> get props => [e];
}

class PaymentMethodSuccess extends PaymentMethodState {
  final List<PaymentMethodModel> paymentMethods;
  const PaymentMethodSuccess(this.paymentMethods);

  @override
  List<Object> get props => [paymentMethods];
}
