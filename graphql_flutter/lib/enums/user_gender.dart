// ignore_for_file: constant_identifier_names

enum UserGender {
  MALE("Homme"),
  FEMALE("Femme"),
  OTHER("Autre"),
  UNKNOWN("Inconnu");

  const UserGender(this.value);
  final String value;
}
