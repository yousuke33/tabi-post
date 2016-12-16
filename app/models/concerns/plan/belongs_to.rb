module Plan::BelongsTo
    extend ActiveSupport::Concern
    included do
        belongs_to :plan
    end
end