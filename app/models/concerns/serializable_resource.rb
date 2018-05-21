module SerializableResource
  class MissingSerializable < StandardError; end

  def self.serialize(resource)
    if resource.respond_to?(:to_ary)
      return Array(resource).map(&:serialize)
    else
      return resource.serialize
    end
  end

  def serialize
    serializable.as_jsonapi[:attributes]
  end

  def serializable
    unless serializable?
      raise MissingSerializable.new("Class not found: #{serializable_class_name}")
    end

    serializable_class.new(object: self)
  end

  def serializable?
    serializable_class_name.safe_constantize.present?
  end

  private

  def serializable_class
    serializable_class_name.constantize
  end

  def serializable_class_name
    # Note: this could be configurable if need be
    "Serializable#{self.class.name.demodulize}"
  end
end
