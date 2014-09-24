class OrphanList < ActiveRecord::Base
  ACCEPTED_FORMATS = ['application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']

  before_create :generate_osra_num

  acts_as_sequenced
  has_attached_file :spreadsheet

  validates :partner, presence: true
  validates :orphan_count, presence: true

  validates_attachment :spreadsheet, presence: true,
    content_type: { content_type: ACCEPTED_FORMATS },
    file_name: { matches: [/xls\Z/, /xlsx\Z/] }

  belongs_to :partner

  private

  def generate_osra_num
    self.osra_num = "%04d" % sequential_id
  end
end
