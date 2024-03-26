# frozen_string_literal: true

class TablePlus
  class ConnectionGroup
    attr_reader :id, :group_id, :name

    def initialize(args)
      @id = args['ID']
      @group_id = args['GroupID']
      @name = args['Name']
    end
  end
end
