class Object
  def own_methods(levels_up = 0)
    tree, methods_to_exclude = self.kind_of?(Class) ? [self.ancestors, :methods] : [self.class.ancestors, :instance_methods]
    inherited_methods = tree[levels_up + 1, tree.size].collect { |k| k.send(methods_to_exclude) }.flatten
    methods - inherited_methods
  end
end
