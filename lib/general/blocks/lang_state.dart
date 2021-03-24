part of 'lang_cubit.dart';

abstract class LangState extends Equatable {
  final Locale locale;
  const LangState(this.locale);
}

class LangInitial extends LangState {
  LangInitial() : super(Locale("ar"));

  @override
  List<Object> get props => [locale];
}

class LangUpdateState extends LangState {
  LangUpdateState(Locale locale) : super(locale);

  @override
  List<Object> get props => [locale];
}
