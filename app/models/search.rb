class Search
  def initialize(resource = Item)
    @resource = resource
  end

  def perform(query = '')
    @resource.basic_search(:html => query)
  end
end
