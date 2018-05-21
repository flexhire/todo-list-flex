module SerializableResource
  class MissingSerializable < StandardError; end

  def self.serialize(resource)
    return Array(resource).map(&:serialize) if resource.respond_to?(:to_ary)
    resource.serialize
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
