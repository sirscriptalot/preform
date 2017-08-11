# Preform

A small library for validating user input. It includes a mixin,
Validatable, and two opinionated classes that include it: Form, and Field.

## Usage

### Installation

`gem install preform`

### API

#### Validatable

`validate`: Template command method that needs to be implemented. Runs to determine errors.

`valid?`: Query to see if any errors exist.

`errors`: Returns the errors hash.

`merge_errors!`: Given another validatable, merges errors into self's errors.

`assert`: Tests a value to see if an error should be added or not. Always returns a boolean so asserts can be nested.

#### Form

`after_initialize`: Override to perform custom initialization behavior.

`params`: Raw params given to the form.

`attributes`: Hook that allows you to transform params for use in your application. By default returns raw params.

#### Field

`after_initialize`: Override to perform custom initialization behavior.

`key`: Reader for the form key, used when merging errors into a form.

`value`: Raw value to validate.
