module Preform
  VERSION = '0.1.1'

  module Validatable
    def validate
      raise NotImplementedError, "validate must be implemented on #{self.class}"
    end

    def valid?
      errors.empty?
    end

    def errors
      unless defined?(@errors)
        @errors = default_errors

        validate
      end

      @errors
    end

    def default_errors
      Hash.new { |hash, key| hash[key] = [] }
    end

    def merge_errors!(other)
      errors.merge!(other.errors)
    end

    def assert(predicate, key, msg)
      return if predicate

      errors[key.to_sym] << msg

      false # Allows assertations to be nested.
    end
  end

  class Field
    include Validatable

    attr_reader :key, :value

    def initialize(key, value)
      @key, @value = key, value

      after_initialize
    end

    def after_initialize
      # no op
    end
  end

  class Form
    include Validatable

    attr_reader :params

    def initialize(params)
      @params = params

      after_initialize
    end

    def after_initialize
      # no op
    end

    def attributes
      params
    end
  end
end
