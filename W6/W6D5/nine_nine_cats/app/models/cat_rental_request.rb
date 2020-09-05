class CatRentalRequest < ApplicationRecord
    STATUSES = ["PENDING", "APPROVED", "DENIED"]
    validates :start_date, :end_date, :status, presence:true
    validates :status, inclusion: {in: STATUSES}
    # validates :

    belongs_to :cat

    def overlapping_requests
        # CatRentalRequest.where("#{self.cat_id} = cat_id").where("#{self.start_date} NOT BETWEEN start_date AND end_date AND #{self.end_date} NOT BETWEEN start_date AND end_date")

        CatRentalRequest.where("#{self.cat_id} = cat_id").where(start_date: [self.start_date, self.end_end])
    end

    def overlapping_approved_requests
        overlapping_requests.where(status: 'APPROVED')
    end

    def does_not_overlap_approved_request
        !overlapping_approved_requests.exists?
    end
end

