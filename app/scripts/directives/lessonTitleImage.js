
'use strict';

angular.module('lergoApp')
    .directive('lessonTitleImage', function (LergoClient) {
        return {
            template: '<img class="img-responsive" ng-show="!!img" ng-src="{{img}}" width="100%" />' +
            '<img class="img-responsive" ng-show="!img" ng-src="https://s3-eu-west-1.amazonaws.com/lergopro-test-dist/images-and-links/fa2.png" width="100%"/>',
            restrict: 'A',
            scope: {
                'lesson': '='
            },
            link: function postLink(scope/*, element, attrs*/) {

                scope.$watch('lesson', function () {
                    scope.img = LergoClient.lessons.getTitleImage(scope.lesson);
                });

            }
        };
    });
