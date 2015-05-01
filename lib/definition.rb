class Definition

  # @@definitions = []

  attr_reader(:part_of_speach, :definition_read_out)

  define_method(:initialize) do |attributes|
    @part_of_speach = attributes.fetch(:part_of_speach)
    @definition_read_out = attributes.fetch(:definition_read_out)
  end

  # define_method(:save) do
  #   @@definitions.push(self)
  # end

end
