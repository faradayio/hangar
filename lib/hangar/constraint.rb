module Hangar
  class RouteConstraint
    def matches?(request)
      request.headers['HTTP_FACTORY'] == 'hangar'
    end
  end
end