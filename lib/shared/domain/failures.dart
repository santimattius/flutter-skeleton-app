abstract class ValueFailure<T> {
  final T failedValue;

  ValueFailure(this.failedValue);

  factory ValueFailure.invalidEmail({required T failedValue}) {
    return InvalidEmail(failedValue);
  }

  factory ValueFailure.shortPassword({required T failedValue}) {
    return ShortPassword(failedValue);
  }
}

class InvalidEmail<T> extends ValueFailure<T> {
  InvalidEmail(super.failedValue);
}

class ShortPassword<T> extends ValueFailure<T> {
  ShortPassword(super.failedValue);
}
