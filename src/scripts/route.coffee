angular
.module 'phonecatApp'

.config [
  '$routeProvider'
  (
    $routeProvider
  ) ->
    $routeProvider

    .when '/phones',
      templateUrl: './module/phone-list.html'
      controller: 'PhoneListCtrl'

    .when '/phones/:phoneId',
      templateUrl: './module/phone-detail.html'
      controller: 'PhoneDetailCtrl'

    .otherwise
      redirectTo: '/phones'
]