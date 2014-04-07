'use strict';

angular.module('lergoApp')
    .controller('LoginCtrl', function ($scope, $log, LergoClient, $location, $rootScope ) {

        $scope.showLoginPage = false;

        if ($location.path() === '/public/session/login') {
            LergoClient.isLoggedIn().then(
                function (result) {
                    if (!!result) {
                        $rootScope.user = result.data;
                        $location.path('/user/homepage');
                    }
                },
                function () {
                    $scope.showLoginPage = true;
                }
            );
        }

        $scope.login = function () {

            LergoClient.login($scope.form).then(
                function success( result ) {
                    $rootScope.user = result.data;
                    $location.path( '/user/homepage' );
                },
                function error(result) {
                    $log.info('error logging in [%s]', result.data);
                }
            );
        };
    });
