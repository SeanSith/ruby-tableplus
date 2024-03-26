# frozen_string_literal: true

class TablePlus
  class Connection
    LOGO_PATH = "#{__dir__}/logos"
    attr_reader :database_host, :database_name, :driver,
                :environment, :group_id, :id, :url

    def initialize(args)
      @id = args['ID']
      @connection_name = args['ConnectionName']
      @database_name = args['DatabaseName']
      @database_host = args['DatabaseHost']
      @url = "tableplus://?id=#{args['ID']}"
      @driver = args['Driver']
      @group_id = args['GroupID']
      @environment = args['Enviroment']  # sic
    end

    def icon
      file = "#{LOGO_PATH}/#{@driver}.png"
      return { path: file } if File.exist? file

      { path: "#{LOGO_PATH}/TablePlus.png" }
    end
  end
end
