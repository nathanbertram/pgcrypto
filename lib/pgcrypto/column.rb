module PGCrypto
  class Column < ActiveRecord::Base
    self.table_name = 'pgcrypto_columns'
    after_save :set_owner_table
    belongs_to :owner, :autosave => false, :inverse_of => :pgcrypto_columns, :polymorphic => true

    default_scope { select(%w(id owner_id owner_type owner_table name)) }

    protected

    def set_owner_table
      update_attribute(:owner_table, self.owner.class.table_name)
    end
  end
end
