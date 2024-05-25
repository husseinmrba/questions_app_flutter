part of 'database_cubit.dart';

@immutable
sealed class DatabaseState {}

final class DatabaseInitial extends DatabaseState {}
final class DatabaseLoaded extends DatabaseState {}
