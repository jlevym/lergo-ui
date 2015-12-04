'use strict';

describe('Controller: UsersProfileCtrl', function () {

    // load the controller's module
    beforeEach(module('lergoApp'));

    var UsersProfileCtrl,
        $rootScope,
        scope;

    // Initialize the controller and a mock scope
    beforeEach(inject(function ($controller, _$rootScope_) {
        $rootScope = _$rootScope_;
        scope = $rootScope.$new();
        UsersProfileCtrl = $controller('UsersProfileCtrl', {
            $scope: scope,
            $routeParams: {
                'username' : 'foo'
            }
        });
    }));

    it('should put username on scope', function () {
        expect(scope.username).toBe('foo');
    });

    describe('#getCanEdit', function(){
        it('should return true iff $root.user.username the same as $routeParams.username', function(){
            expect(!!scope.getCanEdit()).toBe(false);
            $rootScope.user = { username : 'foo'};
            expect(scope.getCanEdit()).toBe(true);
        });
    });

    describe('#getMode' , function(){
        it('should return private if user is logged in', function(){
            expect(scope.getMode()).toBe('public');
            $rootScope.user = { username : 'foo' };
            expect(scope.getMode()).toBe('private');
        });
    });
});
