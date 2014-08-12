class Node
  nodes: ->
    require './nodes'

  visitors: ->
    require '../visitors'

  not: ->
    Not = @nodes().Not
    new Not(@)
    
  or: (right) ->
    Grouping = @nodes().Grouping
    Or = @nodes().Or
    new Grouping(new Or(@, right))
    
  and: (right) ->
    And = @nodes().And
    new And([@, right])
    
  # TODO Implement each and toSql
  toSql: ->
    @visitors().visitor().accept @
  
exports = module.exports = Node
