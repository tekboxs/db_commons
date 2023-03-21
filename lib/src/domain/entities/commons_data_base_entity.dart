abstract class ISimpleDataBaseCommonsEntity {
  Future readMethod(key);
  Future writeMethod(key, value);
  Future deleteMethod(key);
}

abstract class ICustomDataBaseCommonsEntity {
  Future readMethod(key);
  Future writeMethod(key, value);
  Future deleteMethod(key);
}
