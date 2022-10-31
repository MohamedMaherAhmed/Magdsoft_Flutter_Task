part of 'verify_cubit.dart';

@immutable
abstract class VerifyState {}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifySuccess extends VerifyState {
  final AccountModel accountModel;

  VerifySuccess({required this.accountModel});

}

class VerifyChange extends VerifyState {}

class VerifyFailure extends VerifyState {}
