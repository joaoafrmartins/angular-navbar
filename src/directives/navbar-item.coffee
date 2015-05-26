module.exports = ($compile) ->
  restrict: "E"
  replace: true
  scope:
    item: "="
  template: """
  <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" dropdown
      ng-attr-href="{{item.href}}"
      ng-attr-title="{{ (item.title || '') | translate }}">
      <span>{{ (item.title || '') | translate }}</span>
      <b ng-attr-class="{{(item.children.length > 0) && 'caret' || '' }}"></b>
    </a>
    <ul class="dropdown-menu" dropdown-menu
      ng-if="item.children.length > 0"
      ng-include="'navbar-dropdown'"
      onload="menu=item.children"
      role="menu">
    </ul>
  </li>
  """
  link: (scope, element, attrs) ->

    $el = $ element

    if scope.item?.children?.length > 0

      delete scope.item.href

      $el.addClass "dropdown"

    $compile(element.contents())(scope)
