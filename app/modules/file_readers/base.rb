class Base
  def read
    raise NotImplementedError, "Subclasses must implement the 'read' method"
  end
end
