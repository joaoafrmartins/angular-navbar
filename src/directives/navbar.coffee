module.exports = ->
  restrict: "E"
  replace: true
  scope:
    menu: "="
  controller: "NavbarController"
  template: """
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <script type="text/ng-template" id="navbar-dropdown">
      <li class="dropdown-submenu"
        ng-attr-caret="{{item.children.length > 0}}"
        ng-repeat="item in menu">
        <a class="dropdown-toggle" data-toggle="dropdown" dropdown
          ng-attr-caret="{{item.children.length > 0}}"
          ng-attr-href="{{ item.href }}"
          ng-attr-title="{{(item.title || '') | translate}}">
          <span>{{(item.title || '') | translate}}</span>
        </a>
        <ul class="dropdown-menu" dropdown-menu
          ng-if="item.children.length > 0"
          ng-include="'navbar-dropdown'"
          onload="menu=item.children"
          role="menu">
        </ul>
      </li>
    </script>
    <div class="container">
      <div class="navbar-header">
        <button ng-init="navCollapsed = true"
         ng-click="navCollapsed = !navCollapsed"
         type="button" class="navbar-toggle collapsed">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand"
          title="{{(menu.title || '') | translate}}"
          ng-attr-href="{{menu.href}}">{{(menu.title || '') | translate}}</a>
      </div>
      <div collapse="navCollapsed" class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <navbar-item data-ng-repeat="node in menu.children"
            item="node">
          </navbar-item>
        </ul>
      </div>
    </div>
  </nav>
  """
