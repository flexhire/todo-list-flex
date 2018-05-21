class SerializableTask < JSONAPI::Serializable::Resource
  type :task

  attributes :id, :name, :due_date, :priority, :doit

  attribute :user do
    @object.user.serialize
  end
end
