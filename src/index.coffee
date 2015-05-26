angular = require 'angular'

app = angular.module "app.navbar", []

app.directive "navbar", require "./directives/navbar"

app.directive "navbarItem", require "./directives/navbar-item"

app.controller "NavbarController", require "./controllers/navbar"
