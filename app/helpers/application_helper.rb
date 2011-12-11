module ApplicationHelper
#endble i18n in will_paginate
include WillPaginate::ViewHelpers

def will_paginate_with_i18n(collection = nil, options = {})
will_paginate collection, options.merge(:previous_label => I18n.t(:previous), :next_label => I18n.t(:next))
end

end
