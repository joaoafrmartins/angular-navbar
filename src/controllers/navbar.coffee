module.exports = class NavbarController

  constructor: (@$scope, $translatePartialLoader) ->

    @setItems @$scope.menu

  getItems: ->

    @items

  setItems: (items=[], key="#/", attr="href", children="children") ->

    @items = undefined

    _getPath = (n) =>

      if @items then return undefined

      if n?[attr] is key then return @items = n

      if n?[children]?.length > 0 then n[children].map (c) ->

        _getPath c

    _getPath items

    return @items
