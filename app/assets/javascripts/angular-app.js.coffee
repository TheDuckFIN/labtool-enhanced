myApp = angular.module('myApp', [])

$(document).on('ready page:load', ->
  angular.bootstrap(document.body, ['myApp'])
)

myApp.controller 'UserSearchController', ($scope, $http) ->
    $http.get('/users.json').success (data, status, headers, config) ->
        $scope.users = data
        return
    $scope.searchText = ''
    return


###
var myApp = angular.module('myApp', []);

myApp.controller("UserSearchController", function($scope, $http) {
    $http.get('/users.json').success( function(data, status, headers, config) {
        $scope.users = data;
    });

    $scope.searchText = '';
});
###